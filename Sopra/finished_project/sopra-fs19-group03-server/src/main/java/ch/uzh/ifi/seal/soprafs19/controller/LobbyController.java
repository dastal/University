package ch.uzh.ifi.seal.soprafs19.controller;

import ch.uzh.ifi.seal.soprafs19.constant.LobbyStatus;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.*;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.LobbyContextDto;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.RulesetDto;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.StateChangeMessage;
import ch.uzh.ifi.seal.soprafs19.entity.Game;
import ch.uzh.ifi.seal.soprafs19.entity.LobbyContext;
import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import ch.uzh.ifi.seal.soprafs19.entity.User;
import ch.uzh.ifi.seal.soprafs19.service.AuthorizationService;
import ch.uzh.ifi.seal.soprafs19.service.LobbyService;
import ch.uzh.ifi.seal.soprafs19.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageExceptionHandler;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class LobbyController {
    private final AuthorizationService authService;
    private final LobbyService lobbyService;
    private final UserService userService;

    private final DashboardController dashboardController;
    private SimpMessagingTemplate template;

    @Autowired
    private ModelMapper modelMapper;

    LobbyController(UserService userService, LobbyService lobbyService, DashboardController dashboardController, AuthorizationService authorizationService, SimpMessagingTemplate template) {
        this.lobbyService = lobbyService;
        this.dashboardController = dashboardController;
        this.authService = authorizationService;
        this.template = template;
        this.userService = userService;
    }

    @SubscribeMapping("/lobbies/{lobbyToken}")
    protected LobbyContextDto subscribeLobbyContext(@DestinationVariable String lobbyToken) {
        return convertToLobbyContextDto(lobbyService.getLobbyContext(lobbyToken));
    }


    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/lobbies/join/{id}")
    @ResponseBody
    String joinLobbyContext(@PathVariable String id, @RequestParam() String token) {
        Long longId = Long.parseLong(id);
        User local = authService.authorize(token);
        String lobbyToken = lobbyService.joinLobbyContext(local, lobbyService.getLobbyContext(longId));
        publishLobbyContext(lobbyToken);
        dashboardController.publishLobbies();
        return lobbyToken;
    }

    @ResponseStatus(HttpStatus.OK)
    @PostMapping("/lobbies/leave/{lobbyToken}")
    @ResponseBody
    void leaveLobbyContext(@PathVariable String lobbyToken, @RequestParam() String token) {
        User user = authService.authorize(token, lobbyToken);
        lobbyService.leaveLobbyContext(user, lobbyToken);
    }

    //region LobbyState LOBBY
    @MessageMapping("/lobbies/{lobbyToken}/stateUpdate")
    @SendToUser
    protected Message getCurrentState(@DestinationVariable String lobbyToken, @Payload String sessionToken) {
        authService.authorize(sessionToken, lobbyToken);
        return lobbyService.currentLobbyState(lobbyToken);
    }

    @SubscribeMapping("/lobbies/{lobbyToken}/lobby")
    protected Message getLobby(@DestinationVariable String lobbyToken) {
        return lobbyService.currentLobbyState(lobbyToken);
    }

    @MessageMapping("/lobbies/{lobbyToken}/lobby")
    protected void updateLobbyContextLobby(@DestinationVariable String lobbyToken, ReadyStateMessage message) {
        lobbyService.wrapAndUpdate(lobbyToken, message);
    }

    //endregion

    //region LobbyChat

    @MessageMapping("/lobbies/{lobbyToken}/chat")
    protected void sendChatMessage(@DestinationVariable String lobbyToken, @Payload ChatMessageContainer chatMessageContainer) {
        authService.authorize(chatMessageContainer.getAuthorization().getToken(), lobbyToken);
        this.template.convertAndSend("/topic/lobbies/" + lobbyToken + "/chat", chatMessageContainer.getChatMessage());
    }

    //endregion

    //region LobbyState SETUP
    @SubscribeMapping("/lobbies/{lobbyToken}/setup")
    protected Message getSetup(@DestinationVariable String lobbyToken) {
        return lobbyService.currentLobbyState(lobbyToken);
    }

    @MessageMapping("/lobbies/{lobbyToken}/setup/collection")
    protected void updateLobbyContextSetupCollection(@DestinationVariable String lobbyToken, @Payload CardCollectionMessage message) {
        lobbyService.wrapAndUpdate(lobbyToken, message);
    }

    @MessageMapping("/lobbies/{lobbyToken}/setup/pick")
    protected void updateLobbyContextSetupPick(@DestinationVariable String lobbyToken, @Payload GameCardMessage message) {
        lobbyService.wrapAndUpdate(lobbyToken, message);
    }
    //endregion

    //region LobbyState GAME
    @SubscribeMapping("/lobbies/{lobbyToken}/game")
    protected Message getGame(@DestinationVariable String lobbyToken) {
        return lobbyService.currentLobbyState(lobbyToken);
    }

    @SubscribeMapping("user/{userId}/lobbies/{lobbyToken}/game/actions")
    protected Message getRuleset(@DestinationVariable String userId, @DestinationVariable String lobbyToken) {

        if (lobbyService.getLobbyContext(lobbyToken).getStateType() == LobbyStatus.GAME &&
                ((Game) lobbyService.getLobbyContext(lobbyToken).getState()).getCurrentUser() == Long.parseLong(userId)) {
            return modelMapper.map(userService.getUser(Long.parseLong(userId)).getRuleset(), RulesetDto.class);
        }
        return null;
    }

    @MessageMapping("/lobbies/{lobbyToken}/game")
    protected void updateLobbyContextGame(@DestinationVariable String lobbyToken, @Payload MoveMessage moveMessage) {
        lobbyService.wrapAndUpdate(lobbyToken, moveMessage);
    }

    @MessageMapping("/lobbies/{lobbyToken}/game/fastforward")
    protected void fastforwardGame(@DestinationVariable String lobbyToken, @Payload AuthorizationCredentials authorizationCredentials) {
        authService.authorize(authorizationCredentials.getToken(), lobbyToken);
        lobbyService.fastforwardGame(lobbyToken);
    }

    public void convertAndSendRuleset(Ruleset ruleset, String lobbyToken) {
        RulesetDto rulesetDto = modelMapper.map(ruleset, RulesetDto.class);
        template.convertAndSend("/topic/user/" + ruleset.getUser().getId() + "/lobbies/" + lobbyToken + "/game/actions", rulesetDto);
    }
    //endregion

    @MessageExceptionHandler
    @SendToUser("/topic/error")
    public String handleException(IllegalArgumentException ex) {
        return "Got error: " + ex.getMessage();
    }

    public void publishLobbyContext(String lobbyToken) {
        this.template.convertAndSend("/topic/lobbies/" + lobbyToken, convertToLobbyContextDto(lobbyService.getLobbyContext(lobbyToken)));
    }

    private LobbyContextDto convertToLobbyContextDto(LobbyContext lobbyContext) {
        return modelMapper.map(lobbyContext, LobbyContextDto.class);
    }


    public void sendStateChange(String lobbyToken, LobbyStatus lobbyStatus) {
        StateChangeMessage message = new StateChangeMessage();
        message.setLobbyStatus(lobbyStatus);
        this.template.convertAndSend("/topic/lobbies/" + lobbyToken + "/stateChange", message);
    }

    public void convertAndSendLobbyState(LobbyContext lobbyContext) {
        String endpoint = "";
        switch (lobbyContext.getStateType()) {
            case LOBBY:
                endpoint = "/lobby";
                break;
            case SETUP:
                endpoint = "/setup";
                break;
            case GAME:
                endpoint = "/game";
                break;
        }
        this.template.convertAndSend("/topic/lobbies/" + lobbyContext.getLobbyToken() + endpoint, lobbyService.convertToRightDto(lobbyContext.getState(), lobbyContext.getStateType()));
    }


}
