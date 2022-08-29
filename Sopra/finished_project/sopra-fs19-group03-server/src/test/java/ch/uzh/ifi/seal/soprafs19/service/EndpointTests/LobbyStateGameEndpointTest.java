package ch.uzh.ifi.seal.soprafs19.service.EndpointTests;

import ch.uzh.ifi.seal.soprafs19.constant.GameCard;
import ch.uzh.ifi.seal.soprafs19.constant.ObjectType;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.*;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.GameDto;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.LobbyContextDto;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.RulesetDto;
import ch.uzh.ifi.seal.soprafs19.entity.LobbyContext;
import ch.uzh.ifi.seal.soprafs19.entity.Setup;
import ch.uzh.ifi.seal.soprafs19.entity.User;
import ch.uzh.ifi.seal.soprafs19.repository.*;
import ch.uzh.ifi.seal.soprafs19.service.LobbyService;
import ch.uzh.ifi.seal.soprafs19.service.UserService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.messaging.converter.MappingJackson2MessageConverter;
import org.springframework.messaging.simp.stomp.StompFrameHandler;
import org.springframework.messaging.simp.stomp.StompHeaders;
import org.springframework.messaging.simp.stomp.StompSession;
import org.springframework.messaging.simp.stomp.StompSessionHandlerAdapter;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.socket.client.standard.StandardWebSocketClient;
import org.springframework.web.socket.messaging.WebSocketStompClient;
import org.springframework.web.socket.sockjs.client.SockJsClient;
import org.springframework.web.socket.sockjs.client.Transport;
import org.springframework.web.socket.sockjs.client.WebSocketTransport;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class LobbyStateGameEndpointTest {

    @LocalServerPort
    private int port;

    private String getBaseUrl() {
        return "http://localhost:" + port;
    }

    @Autowired
    private UserService userService;

    @Autowired
    private LobbyService lobbyService;

    @Qualifier("lobbyContextRepository")
    @Autowired
    private LobbyContextRepository lobbyContextRepository;

    @Qualifier("userRepository")
    @Autowired
    private UserRepository userRepository;

    @Qualifier("gameRepository")
    @Autowired
    private GameRepository gameRepository;

    @Qualifier("rulesetRepository")
    @Autowired
    private RulesetRepository rulesetRepository;

    @Qualifier("lobbyRepository")
    @Autowired
    private LobbyStateRepository lobbyStateRepository;

    private CompletableFuture<GameDto> completableFutureGame;

    private CompletableFuture<RulesetDto> completableFutureRuleset;

    //LobbyState GAME
    @Test
    public void getGame() throws Exception {
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
        WebSocketStompClient stompClient = new WebSocketStompClient(new SockJsClient(createTransportClient()));
        stompClient.setMessageConverter(new MappingJackson2MessageConverter());
        completableFutureGame = new CompletableFuture<>();

        //create TestUser and log him in
        User testUser = new User();
        testUser.setUsername("testUsername");
        testUser.setName("testUser");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        User loggedInUser1 = userService.loginUser("testUsername", "1234");

        //create testLobby with testUser1 and let the other join testLobby
        String tesLobbyToken = lobbyService.createLobby(loggedInUser1.getToken(), "godCards");
        LobbyContext testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        User testUser2 = new User();
        testUser2.setUsername("testUsername2");
        testUser2.setName("testUser2");
        //01-01-1990
        testUser2.setBirthDay("631148400000");
        testUser2.setPassword("1234");
        userService.createUser(testUser2);
        User loggedInUser2 = userService.loginUser("testUsername2", "1234");
        lobbyService.joinLobbyContext(testUser2, testLobbyContext);

        //both are ready
        ReadyStateMessage message1 = new ReadyStateMessage();
        message1.setUserId(loggedInUser1.getId());
        message1.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message1);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        ReadyStateMessage message2 = new ReadyStateMessage();
        message2.setUserId(loggedInUser2.getId());
        message2.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //both have loaded
        message1 = new ReadyStateMessage();
        message1.setUserId(loggedInUser1.getId());
        message1.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message1);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        message2 = new ReadyStateMessage();
        message2.setUserId(loggedInUser2.getId());
        message2.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //send cardCollection (twice the same card to ensure that the critical Move is only possible with the GodCard)
        Long chooserId = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getChooserId();
        ArrayList<GameCard> cardCollection = new ArrayList<>();
        cardCollection.add(GameCard.ARTEMIS);
        cardCollection.add(GameCard.PAN);

        CardCollectionMessage collectionMessage = new CardCollectionMessage();
        collectionMessage.setUserId(chooserId);
        collectionMessage.setCardCollection(cardCollection);

        lobbyService.wrapAndUpdate(tesLobbyToken, collectionMessage);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //send chosen Cards
        LinkedList<Long> turnList  = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getTurnList();
        ArrayList<Long> iterable = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getPickList();
        Iterator<Long> pickList = iterable.iterator();

        GameCardMessage cardMessage1 = new GameCardMessage();
        cardMessage1.setUserId(pickList.next());
        cardMessage1.setChosenCard(GameCard.ARTEMIS);

        GameCardMessage cardMessage2 = new GameCardMessage();
        cardMessage2.setUserId(pickList.next());
        cardMessage2.setChosenCard(GameCard.PAN);

        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage1);
        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //change State to Game
        lobbyService.changeStateToGame(testLobbyContext, turnList);

        //get GameDto
        StompSession sessionGetGame = stompClient.connect(getBaseUrl() + "/lobbies", new StompSessionHandlerAdapter() {
            @Override
            public Type getPayloadType(StompHeaders headers) {
                return super.getPayloadType(headers);
            }
        }).get(1, TimeUnit.SECONDS);

        Assert.assertTrue(sessionGetGame.isConnected());

        GameStompFrameHandler handlerGame= new GameStompFrameHandler();
        sessionGetGame.subscribe("/topic/lobbies/" + tesLobbyToken + "/game", handlerGame);
        sessionGetGame.subscribe("/app/lobbies/" + tesLobbyToken + "/game", handlerGame);
        GameDto lobbyDto = completableFutureGame.get(1, TimeUnit.SECONDS);

        Assert.assertNotNull(lobbyDto);

        //disconnect and clear
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
    }

    @Test
    public void getRuleset() throws Exception {
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
        WebSocketStompClient stompClient = new WebSocketStompClient(new SockJsClient(createTransportClient()));
        stompClient.setMessageConverter(new MappingJackson2MessageConverter());
        completableFutureRuleset = new CompletableFuture<>();

        //create TestUser and log him in
        User testUser = new User();
        testUser.setUsername("testUsername");
        testUser.setName("testUser");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        User loggedInUser1 = userService.loginUser("testUsername", "1234");

        //create testLobby with testUser1 and let the other join testLobby
        String tesLobbyToken = lobbyService.createLobby(loggedInUser1.getToken(), "godCards");
        LobbyContext testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        User testUser2 = new User();
        testUser2.setUsername("testUsername2");
        testUser2.setName("testUser2");
        //01-01-1990
        testUser2.setBirthDay("631148400000");
        testUser2.setPassword("1234");
        userService.createUser(testUser2);
        User loggedInUser2 = userService.loginUser("testUsername2", "1234");
        lobbyService.joinLobbyContext(testUser2, testLobbyContext);

        //both are ready
        ReadyStateMessage message1 = new ReadyStateMessage();
        message1.setUserId(loggedInUser1.getId());
        message1.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message1);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        ReadyStateMessage message2 = new ReadyStateMessage();
        message2.setUserId(loggedInUser2.getId());
        message2.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //both have loaded
        message1 = new ReadyStateMessage();
        message1.setUserId(loggedInUser1.getId());
        message1.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message1);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        message2 = new ReadyStateMessage();
        message2.setUserId(loggedInUser2.getId());
        message2.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //send cardCollection (twice the same card to ensure that the critical Move is only possible with the GodCard)
        Long chooserId = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getChooserId();
        ArrayList<GameCard> cardCollection = new ArrayList<>();
        cardCollection.add(GameCard.PAN);
        cardCollection.add(GameCard.PAN);

        CardCollectionMessage collectionMessage = new CardCollectionMessage();
        collectionMessage.setUserId(chooserId);
        collectionMessage.setCardCollection(cardCollection);

        lobbyService.wrapAndUpdate(tesLobbyToken, collectionMessage);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //send chosen Cards
        LinkedList<Long> turnList  = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getTurnList();
        ArrayList<Long> iterable = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getPickList();
        Iterator<Long> pickList = iterable.iterator();

        GameCardMessage cardMessage1 = new GameCardMessage();
        cardMessage1.setUserId(pickList.next());
        cardMessage1.setChosenCard(GameCard.PAN);

        GameCardMessage cardMessage2 = new GameCardMessage();
        cardMessage2.setUserId(pickList.next());
        cardMessage2.setChosenCard(GameCard.PAN);

        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage1);
        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //change State to Game
        lobbyService.changeStateToGame(testLobbyContext, turnList);

        //collect authorization Credentials of both players
        Iterator<Long> turnListIterator = turnList.iterator();
        Long firstId = turnListIterator.next();
        String firstToken = userService.getUser(firstId).getToken();
        AuthorizationCredentials authorizationCredentialsPlayer1 = new AuthorizationCredentials();
        authorizationCredentialsPlayer1.setToken(firstToken);
        authorizationCredentialsPlayer1.setId(firstId);

        Long secondId = turnListIterator.next();
        String secondToken = userService.getUser(secondId).getToken();
        AuthorizationCredentials authorizationCredentialsPlayer2 = new AuthorizationCredentials();
        authorizationCredentialsPlayer2.setToken(secondToken);
        authorizationCredentialsPlayer2.setId(secondId);

        //getRuleset
        StompSession sessionGetRuleset = stompClient.connect(getBaseUrl() + "/lobbies", new StompSessionHandlerAdapter() {
            @Override
            public Type getPayloadType(StompHeaders headers) {
                return super.getPayloadType(headers);
            }
        }).get(1, TimeUnit.SECONDS);

        Assert.assertTrue(sessionGetRuleset.isConnected());

        RulesetStompFrameHandler handlerRuleset = new RulesetStompFrameHandler();

        sessionGetRuleset.subscribe("/topic/user/" + authorizationCredentialsPlayer1.getId() +  "/lobbies/" + tesLobbyToken + "/game/actions", handlerRuleset);
        sessionGetRuleset.subscribe("/app/user/" + authorizationCredentialsPlayer1.getId() +  "/lobbies/" + tesLobbyToken + "/game/actions", handlerRuleset);
        RulesetDto rulesetDto = completableFutureRuleset.get(1, TimeUnit.SECONDS);

        Assert.assertNotNull(rulesetDto);

        //disconnect and clear
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
    }

    @Test(expected = TimeoutException.class)
    public void getNullRuleset() throws Exception {
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
        WebSocketStompClient stompClient = new WebSocketStompClient(new SockJsClient(createTransportClient()));
        stompClient.setMessageConverter(new MappingJackson2MessageConverter());
        completableFutureRuleset = new CompletableFuture<>();

        //create TestUser and log him in
        User testUser = new User();
        testUser.setUsername("testUsername");
        testUser.setName("testUser");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        User loggedInUser1 = userService.loginUser("testUsername", "1234");

        //create testLobby with testUser1 and let the other join testLobby
        String tesLobbyToken = lobbyService.createLobby(loggedInUser1.getToken(), "godCards");
        LobbyContext testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        User testUser2 = new User();
        testUser2.setUsername("testUsername2");
        testUser2.setName("testUser2");
        //01-01-1990
        testUser2.setBirthDay("631148400000");
        testUser2.setPassword("1234");
        userService.createUser(testUser2);
        User loggedInUser2 = userService.loginUser("testUsername2", "1234");
        lobbyService.joinLobbyContext(testUser2, testLobbyContext);

        //both are ready
        ReadyStateMessage message1 = new ReadyStateMessage();
        message1.setUserId(loggedInUser1.getId());
        message1.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message1);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        ReadyStateMessage message2 = new ReadyStateMessage();
        message2.setUserId(loggedInUser2.getId());
        message2.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //both have loaded
        message1 = new ReadyStateMessage();
        message1.setUserId(loggedInUser1.getId());
        message1.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message1);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        message2 = new ReadyStateMessage();
        message2.setUserId(loggedInUser2.getId());
        message2.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //send cardCollection (twice the same card to ensure that the critical Move is only possible with the GodCard)
        Long chooserId = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getChooserId();
        ArrayList<GameCard> cardCollection = new ArrayList<>();
        cardCollection.add(GameCard.PAN);
        cardCollection.add(GameCard.PAN);

        CardCollectionMessage collectionMessage = new CardCollectionMessage();
        collectionMessage.setUserId(chooserId);
        collectionMessage.setCardCollection(cardCollection);

        lobbyService.wrapAndUpdate(tesLobbyToken, collectionMessage);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //send chosen Cards
        LinkedList<Long> turnList  = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getTurnList();
        ArrayList<Long> iterable = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getPickList();
        Iterator<Long> pickList = iterable.iterator();

        GameCardMessage cardMessage1 = new GameCardMessage();
        cardMessage1.setUserId(pickList.next());
        cardMessage1.setChosenCard(GameCard.PAN);

        GameCardMessage cardMessage2 = new GameCardMessage();
        cardMessage2.setUserId(pickList.next());
        cardMessage2.setChosenCard(GameCard.PAN);

        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage1);
        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //change State to Game
        lobbyService.changeStateToGame(testLobbyContext, turnList);

        //collect authorization Credentials of both players
        Iterator<Long> turnListIterator = turnList.iterator();
        Long firstId = turnListIterator.next();
        String firstToken = userService.getUser(firstId).getToken();
        AuthorizationCredentials authorizationCredentialsPlayer1 = new AuthorizationCredentials();
        authorizationCredentialsPlayer1.setToken(firstToken);
        authorizationCredentialsPlayer1.setId(firstId);

        Long secondId = turnListIterator.next();
        String secondToken = userService.getUser(secondId).getToken();
        AuthorizationCredentials authorizationCredentialsPlayer2 = new AuthorizationCredentials();
        authorizationCredentialsPlayer2.setToken(secondToken);
        authorizationCredentialsPlayer2.setId(secondId);

        //getRuleset
        StompSession sessionGetRuleset = stompClient.connect(getBaseUrl() + "/lobbies", new StompSessionHandlerAdapter() {
            @Override
            public Type getPayloadType(StompHeaders headers) {
                return super.getPayloadType(headers);
            }
        }).get(1, TimeUnit.SECONDS);

        Assert.assertTrue(sessionGetRuleset.isConnected());

        RulesetStompFrameHandler handlerRuleset = new RulesetStompFrameHandler();

        sessionGetRuleset.subscribe("/topic/user/" + 999L +  "/lobbies/" + tesLobbyToken + "/game/actions", handlerRuleset);
        sessionGetRuleset.subscribe("/app/user/" + 999L +  "/lobbies/" + tesLobbyToken + "/game/actions", handlerRuleset);
        RulesetDto rulesetDto = completableFutureRuleset.get(1, TimeUnit.SECONDS);

        Assert.assertNotNull(rulesetDto);

        //disconnect and clear
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
    }

    @Test
    public void updateLobbyContextGame() throws Exception {
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
        WebSocketStompClient stompClient = new WebSocketStompClient(new SockJsClient(createTransportClient()));
        stompClient.setMessageConverter(new MappingJackson2MessageConverter());
        completableFutureRuleset = new CompletableFuture<>();

        //create TestUser and log him in
        User testUser = new User();
        testUser.setUsername("testUsername");
        testUser.setName("testUser");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        User loggedInUser1 = userService.loginUser("testUsername", "1234");

        //create testLobby with testUser1 and let the other join testLobby
        String tesLobbyToken = lobbyService.createLobby(loggedInUser1.getToken(), "godCards");
        LobbyContext testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        User testUser2 = new User();
        testUser2.setUsername("testUsername2");
        testUser2.setName("testUser2");
        //01-01-1990
        testUser2.setBirthDay("631148400000");
        testUser2.setPassword("1234");
        userService.createUser(testUser2);
        User loggedInUser2 = userService.loginUser("testUsername2", "1234");
        lobbyService.joinLobbyContext(testUser2, testLobbyContext);

        //both are ready
        ReadyStateMessage message1 = new ReadyStateMessage();
        message1.setUserId(loggedInUser1.getId());
        message1.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message1);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        ReadyStateMessage message2 = new ReadyStateMessage();
        message2.setUserId(loggedInUser2.getId());
        message2.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //both have loaded
        message1 = new ReadyStateMessage();
        message1.setUserId(loggedInUser1.getId());
        message1.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message1);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        message2 = new ReadyStateMessage();
        message2.setUserId(loggedInUser2.getId());
        message2.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //send cardCollection (twice the same card to ensure that the critical Move is only possible with the GodCard)
        Long chooserId = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getChooserId();
        ArrayList<GameCard> cardCollection = new ArrayList<>();
        cardCollection.add(GameCard.PAN);
        cardCollection.add(GameCard.PAN);

        CardCollectionMessage collectionMessage = new CardCollectionMessage();
        collectionMessage.setUserId(chooserId);
        collectionMessage.setCardCollection(cardCollection);

        lobbyService.wrapAndUpdate(tesLobbyToken, collectionMessage);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //send chosen Cards
        LinkedList<Long> turnList  = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getTurnList();
        ArrayList<Long> iterable = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getPickList();
        Iterator<Long> pickList = iterable.iterator();

        GameCardMessage cardMessage1 = new GameCardMessage();
        cardMessage1.setUserId(pickList.next());
        cardMessage1.setChosenCard(GameCard.PAN);

        GameCardMessage cardMessage2 = new GameCardMessage();
        cardMessage2.setUserId(pickList.next());
        cardMessage2.setChosenCard(GameCard.PAN);

        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage1);
        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //change State to Game
        lobbyService.changeStateToGame(testLobbyContext, turnList);

        //collect authorization Credentials of both players
        Iterator<Long> turnListIterator = turnList.iterator();
        Long firstId = turnListIterator.next();
        String firstToken = userService.getUser(firstId).getToken();
        AuthorizationCredentials authorizationCredentialsPlayer1 = new AuthorizationCredentials();
        authorizationCredentialsPlayer1.setToken(firstToken);
        authorizationCredentialsPlayer1.setId(firstId);

        Long secondId = turnListIterator.next();
        String secondToken = userService.getUser(secondId).getToken();
        AuthorizationCredentials authorizationCredentialsPlayer2 = new AuthorizationCredentials();
        authorizationCredentialsPlayer2.setToken(secondToken);
        authorizationCredentialsPlayer2.setId(secondId);

        //send Move
        Move move1 = new Move();
        move1.setRow(2);
        move1.setColumn(1);
        move1.setType(ObjectType.WORKER1);
        move1.setSkip(false);
        MoveMessage moveMessage1 = new MoveMessage();
        moveMessage1.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage1.setMove(move1);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage1);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        StompSession sessionSendMove = stompClient.connect(getBaseUrl() + "/lobbies", new StompSessionHandlerAdapter() {
            @Override
            public Type getPayloadType(StompHeaders headers) {
                return super.getPayloadType(headers);
            }
        }).get(1, TimeUnit.SECONDS);

        Assert.assertTrue(sessionSendMove.isConnected());

        MoveStompFrameHandler handlerMove = new MoveStompFrameHandler();

        sessionSendMove.subscribe("/topic/lobbies/" + tesLobbyToken + "/game",handlerMove);
        sessionSendMove.send("/topic/lobbies/" + tesLobbyToken + "/game", moveMessage1);

        //disconnect and clear
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
    }

    private List<Transport> createTransportClient() {
        List<Transport> transports = new ArrayList<>(1);
        transports.add(new WebSocketTransport(new StandardWebSocketClient()));
        return transports;
    }

    private class GameStompFrameHandler implements StompFrameHandler {
        @Override
        public Type getPayloadType(StompHeaders headers) {
            return GameDto.class;
        }

        @Override
        public void handleFrame(StompHeaders stompHeaders, Object payload) {
            completableFutureGame.complete((GameDto) payload);
        }
    }

    private class RulesetStompFrameHandler implements StompFrameHandler {
        @Override
        public Type getPayloadType(StompHeaders headers) {
            return RulesetDto.class;
        }

        @Override
        public void handleFrame(StompHeaders stompHeaders, Object payload) {
            completableFutureRuleset.complete((RulesetDto) payload);
        }
    }

    private class MoveStompFrameHandler implements StompFrameHandler {
        @Override
        public Type getPayloadType(StompHeaders headers) {
            return LobbyContextDto.class;
        }

        @Override
        public void handleFrame(StompHeaders stompHeaders, Object payload) {
        }
    }
}
