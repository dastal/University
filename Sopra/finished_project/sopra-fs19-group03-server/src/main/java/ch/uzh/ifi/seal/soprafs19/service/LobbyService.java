package ch.uzh.ifi.seal.soprafs19.service;


import ch.uzh.ifi.seal.soprafs19.constant.GameMode;
import ch.uzh.ifi.seal.soprafs19.constant.LobbyStatus;
import ch.uzh.ifi.seal.soprafs19.constant.MessageType;
import ch.uzh.ifi.seal.soprafs19.constant.ObjectType;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.*;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.Message;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.GameDto;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.LobbyDto;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.SetupDto;
import ch.uzh.ifi.seal.soprafs19.entity.*;
import ch.uzh.ifi.seal.soprafs19.exceptions.AuthenticationException;
import ch.uzh.ifi.seal.soprafs19.exceptions.LobbyNotExistsException;
import ch.uzh.ifi.seal.soprafs19.exceptions.MessageInvalidException;
import ch.uzh.ifi.seal.soprafs19.repository.LobbyContextRepository;
import ch.uzh.ifi.seal.soprafs19.repository.LobbyStateRepository;
import ch.uzh.ifi.seal.soprafs19.repository.UserRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;

@Service
@Transactional
public class LobbyService {
    private final LobbyContextRepository lobbyContextRepository;

    private final UserRepository userRepository;

    private final LobbyStateRepository lobbyStateRepository;


    @Autowired
    private AuthorizationService authorizationService;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    public LobbyService(@Qualifier("lobbyContextRepository") LobbyContextRepository lobbyContextRepository,
                        @Qualifier("userRepository") UserRepository userRepository,
                        @Qualifier("lobbyRepository") LobbyStateRepository lobbyStateRepository) {
        this.lobbyContextRepository = lobbyContextRepository;
        this.userRepository = userRepository;
        this.lobbyStateRepository = lobbyStateRepository;
    }

    public List<LobbyContext> getLobbyContexts() {
        return this.lobbyContextRepository.findAll();
    }

    public LobbyContext getLobbyContext(Long id) {
        return lobbyContextRepository.findById(id).orElseThrow(LobbyNotExistsException::new);
    }

    public LobbyContext getLobbyContext(String lobbyToken) {
        return lobbyContextRepository.findByLobbyToken(lobbyToken);
    }

    public void updateLobbyState(LobbyState state){
        this.lobbyStateRepository.save(state);
    }

    public String joinLobbyContext(User user, LobbyContext lobby) {
        if (lobby.getUsers().contains(user))
            return lobby.getLobbyToken();
        User local = userRepository.findById(user.getId()).orElseThrow();
        lobby.addUser(local);
        lobbyContextRepository.save(lobby);
        local.setLobbyToken(lobby.getLobbyToken());
        userRepository.save(local);
        return lobby.getLobbyToken();
    }

    public void leaveLobbyContext(User user, String lobbyToken){
        LobbyContext lobbyContext = getLobbyContext(lobbyToken);
        lobbyContext.removeUser(user);
        user.setLobbyToken(null);
        if (lobbyContext.getUsers().isEmpty()){
            deleteLobbyContext(lobbyContext);
        }
        else {
            if (lobbyContext.getHostUserId().equals(user.getId())) {
                User newHost = lobbyContext.getUsers().iterator().next();
                lobbyContext.setHostUserId(newHost.getId());
                lobbyContext.setLobbyName(newHost.getUsername() + "'s Lobby");
                AccessHelper.getLobbyController().publishLobbyContext(lobbyToken);
            }
            changeStateToLobby(lobbyContext);
            AccessHelper.getLobbyController().publishLobbyContext(lobbyToken);
            lobbyContextRepository.save(lobbyContext);
        }
        AccessHelper.getDashboardController().publishLobbies();
        userRepository.save(user);
    }

    public void deleteLobbyContext(LobbyContext lobbyContext){
        LobbyState state = lobbyContext.getState();
        lobbyStateRepository.delete(state);
        lobbyContextRepository.delete(lobbyContext);
    }
    public LobbyContext validateUser(User user, String lobbyToken) {
        LobbyContext lobbyContext = this.getLobbyContext(lobbyToken);
        if (!lobbyContext.getUsers().contains(user))
            throw new AuthenticationException("User is not in this Lobby");
        return lobbyContext;
    }

    public String createLobby(String token, String mode) {
        GameMode realMode;
        if ("simple".equals(mode)) {
            realMode = GameMode.SIMPLE;
        } else realMode = GameMode.GODCARDS;

        User local = authorizationService.authorize(token);

        LobbyContext context = new LobbyContext(local, realMode);
        Lobby lobby = new Lobby(context);
        lobbyStateRepository.save(lobby);
        context.setState(lobby);
        context.setLobbyName(local.getUsername() + "'s Lobby");
        lobbyContextRepository.save(context);
        local.setLobbyToken(context.getLobbyToken());
        return context.getLobbyToken();
    }

    public List<LobbyContext> getOpenLobbies() {
        return this.lobbyContextRepository.findByStateType(LobbyStatus.LOBBY);
    }


    public Message currentLobbyState(String lobbyToken) {
        LobbyContext lobbyContext = getLobbyContext(lobbyToken);
        return convertToRightDto(lobbyContext.getState(), lobbyContext.getStateType());
    }

    public Message convertToRightDto(LobbyState lobbyState, LobbyStatus lobbyStatus) {
        if (lobbyStatus == LobbyStatus.LOBBY) {
            LobbyDto lobbyDto = modelMapper.map(lobbyState, LobbyDto.class);
            return lobbyDto;
        } else if (lobbyStatus == LobbyStatus.SETUP) {
            SetupDto setupDto = modelMapper.map(lobbyState, SetupDto.class);
            return setupDto;
        } else if (lobbyStatus == LobbyStatus.GAME) {
            GameDto gameDto = modelMapper.map(lobbyState, GameDto.class);
            return gameDto;
        } else throw new MessageInvalidException();
    }

    public void fastforwardGame(String lobbyToken){
        LobbyContext context = getLobbyContext(lobbyToken);
        if (context.getStateType() != LobbyStatus.GAME || context.getUsers().size() != 2)
            throw new MessageInvalidException("Fastforwarding only works in the game and with 2 players!");
        Game game = (Game)context.getState();
        int[][] buildings = {{0,0,0,3,2},{0,0,0,0,2},{1,0,0,0,1},{2,0,0,1,3},{0,0,0,2,3}};
        int[][] cupola = {{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,1},{0,0,0,0,1}};
        List<Long> users = game.getUserSequence();
        ObjectType[][] workerType = {{null,null,null,null,ObjectType.WORKER1},{ObjectType.WORKER1,null,null,ObjectType.WORKER2,null},{null,null,null,ObjectType.WORKER2,null},{null,null,null,null,null},{null,null,null,null,null}};
        Long[][] workerOwner = {{null,null,null,null,users.get(0)},{users.get(1),null,null,users.get(0),null},{null,null,null,users.get(1),null},{null,null,null,null,null},{null,null,null,null,null}};
        game.setBuildings(buildings);
        game.setCupola(cupola);
        game.setWorkerOwner(workerOwner);
        game.setWorkerType(workerType);

        for (Long user:
             users) {
            User local = AccessHelper.getUserService().getUser(user);
            local.getRuleset().resetToDefaultMove();
        }
        Ruleset initial = AccessHelper.getUserService().getUser(game.getCurrentUser()).getRuleset();
        AccessHelper.getLobbyController().convertAndSendLobbyState(context);
        initial.computeActions(game);
        AccessHelper.getLobbyController().convertAndSendRuleset(initial, lobbyToken);
    }

    //region StateChange
    public void changeStateToSetup(LobbyContext context, HashSet<Long> userIds) {
        Setup setup = new Setup(userIds, context);
        changeLobbyState(context, setup);
    }
    public void changeStateToGame(LobbyContext context, LinkedList<Long> turnList) {
        Game game = new Game(context, turnList);
        changeLobbyState(context, game);

    }
    public void changeStateToLobby(LobbyContext context){
        Lobby lobby = new Lobby(context);
        changeLobbyState(context, lobby);
    }

    private void changeLobbyState(LobbyContext context, LobbyState newState){
        LobbyState oldState = context.getState();
        lobbyStateRepository.save(newState);
        context.setState(newState);
        lobbyStateRepository.delete(oldState);
        lobbyContextRepository.save(context);
        AccessHelper.getLobbyController().convertAndSendLobbyState(context);
        AccessHelper.getLobbyController().sendStateChange(context.getLobbyToken(), context.getStateType());
    }
    //endregion

    //region wrapAndUpdate
    public void updateLobbyContext(String lobbyToken, MessageContainer messageContainer) {
        LobbyContext lobby = getLobbyContext(lobbyToken);
        lobby.update(messageContainer);
    }

    public void wrapAndUpdate(String lobbyToken, ReadyStateMessage message) {
        MessageContainer container = new MessageContainer(message, MessageType.READYSTATEMESSAGE);
        updateLobbyContext(lobbyToken, container);
    }

    public void wrapAndUpdate(String lobbyToken, MoveMessage message){
        MessageContainer container = new MessageContainer(message, MessageType.MOVEMESSAGE);
        updateLobbyContext(lobbyToken, container);
    }

    public void wrapAndUpdate(String lobbyToken, CardCollectionMessage message) {
        MessageContainer container = new MessageContainer(message, MessageType.CARDCOLLECTION);
        updateLobbyContext(lobbyToken, container);
    }

    public void wrapAndUpdate(String lobbyToken, GameCardMessage message) {
        MessageContainer container = new MessageContainer(message, MessageType.GAMECARDMESSAGE);
        updateLobbyContext(lobbyToken, container);
    }

    //endregion
}