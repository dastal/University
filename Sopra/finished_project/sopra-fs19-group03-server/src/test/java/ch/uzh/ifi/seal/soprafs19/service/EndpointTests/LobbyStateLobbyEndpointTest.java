package ch.uzh.ifi.seal.soprafs19.service.EndpointTests;

import ch.uzh.ifi.seal.soprafs19.dto.incoming.AuthorizationCredentials;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.ReadyStateMessage;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.LobbyContextDto;
import ch.uzh.ifi.seal.soprafs19.entity.LobbyContext;
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
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class LobbyStateLobbyEndpointTest {

    @Autowired
    private TestRestTemplate restTemplate;

    private CompletableFuture<Iterable> completableFutureLobbies;

    private CompletableFuture<LobbyContextDto> completableFutureSubscribeTestLobby;

    private CompletableFuture<LobbyContextDto> completableFutureGetLobby;

    private CompletableFuture<LobbyContextDto> completableFutureReady;

    private CompletableFuture<LobbyContextDto> completableFutureGetCurrentState;

    private CompletableFuture<LobbyContextDto> completableFutureCurrentState;

    @Autowired
    private UserService userService;

    @Autowired
    private LobbyService lobbyService;

    @LocalServerPort
    private int port;

    private String getBaseUrl() {
        return "http://localhost:" + port;
    }

    @Qualifier("lobbyContextRepository")
    @Autowired
    private LobbyContextRepository lobbyContextRepository;

    @Qualifier("userRepository")
    @Autowired
    private UserRepository userRepository;

    @Qualifier("lobbyRepository")
    @Autowired
    private LobbyStateRepository lobbyStateRepository;

    @Qualifier("rulesetRepository")
    @Autowired
    private RulesetRepository rulesetRepository;

    @Qualifier("gameRepository")
    @Autowired
    private GameRepository gameRepository;

    //LobbyState Lobby
    @Test
    public void getCurrentState() throws Exception {
        //setup
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
        WebSocketStompClient stompClient = new WebSocketStompClient(new SockJsClient(createTransportClient()));
        stompClient.setMessageConverter(new MappingJackson2MessageConverter());
        completableFutureCurrentState = new CompletableFuture<>();

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
        String testUser2Token = userRepository.findByUsername("testUsername2").getToken();

        //get current state
        StompSession sessionGetCurrentState = stompClient.connect(getBaseUrl() + "/lobbies", new StompSessionHandlerAdapter() {
            @Override
            public Type getPayloadType(StompHeaders headers) {
                return super.getPayloadType(headers);
            }
        }).get(1, TimeUnit.SECONDS);

        Assert.assertTrue(sessionGetCurrentState.isConnected());
        System.out.println(loggedInUser1.getToken());
        GetCurrentStateStompFrameHandler getCurrentState = new GetCurrentStateStompFrameHandler();
        sessionGetCurrentState.subscribe("/topic/lobbies/" + tesLobbyToken + "/stateUpdate", getCurrentState);
        sessionGetCurrentState.send("/app/lobbies/" + tesLobbyToken + "/stateUpdate", loggedInUser1.getToken());

        //clear
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
    }

    @Test
    public void getLobby() throws Exception {
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
        WebSocketStompClient stompClient = new WebSocketStompClient(new SockJsClient(createTransportClient()));
        stompClient.setMessageConverter(new MappingJackson2MessageConverter());
        completableFutureLobbies = new CompletableFuture<>();
        completableFutureSubscribeTestLobby = new CompletableFuture<>();
        completableFutureGetLobby = new CompletableFuture<>();

        //create TestUser
        User testUser = new User();
        testUser.setUsername("asdf");
        testUser.setName("testUserASDF");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("asdf");
        userService.createUser(testUser);

        //Login testUser
        Map<String, String> acred = new HashMap<>();
        acred.put("username", "asdf");
        acred.put("password", "asdf");
        String testUserStatus = restTemplate.postForEntity(getBaseUrl() + "/users/login", acred, String.class).getStatusCode().toString();
        Assert.assertEquals(testUserStatus, HttpStatus.OK.toString());
        ResponseEntity<AuthorizationCredentials> authorizationCredentials = restTemplate.postForEntity(getBaseUrl() + "/users/login", acred, AuthorizationCredentials.class);

        //Create testLobby and get lobbyToken
        Map<String, String > lobCred = new HashMap<>();
        lobCred.put("token", authorizationCredentials.getBody().getToken());
        lobCred.put("mode", "simple");
        ResponseEntity<String> lobbyResponse = restTemplate.postForEntity(getBaseUrl() + "/dashboard/lobbies", lobCred, String.class);

        Assert.assertEquals(lobbyResponse.getStatusCode(),HttpStatus.CREATED);

        //Create a second user and Log him in
        Map<String, String> testUser2 = new HashMap<>();
        testUser2.put("name","testUser2");
        testUser2.put("username", "testUsername2");
        testUser2.put("password", "1234");
        testUser2.put("birthDay", "946681200000");
        String response2 = restTemplate.postForEntity(getBaseUrl() + "/users", testUser2, String.class).getStatusCode().toString();
        String testUserStatus2 = restTemplate.postForEntity(getBaseUrl() + "/users/login", testUser2, String.class).getStatusCode().toString();
        ResponseEntity<AuthorizationCredentials> authorizationCredentials2 = restTemplate.postForEntity(getBaseUrl() + "/users/login", acred, AuthorizationCredentials.class);

        Assert.assertEquals(HttpStatus.CREATED.toString(), response2);
        Assert.assertEquals(testUserStatus2, HttpStatus.OK.toString());

        //Get all lobbyDtos
        StompSession sessionLobbies = stompClient.connect(getBaseUrl() + "/lobbies", new StompSessionHandlerAdapter() {
            @Override
            public Type getPayloadType(StompHeaders headers) {
                return super.getPayloadType(headers);
            }
        }).get(1, TimeUnit.SECONDS);

        Assert.assertTrue(sessionLobbies.isConnected());

        LobbiesStompFrameHandler handlerLobby = new LobbiesStompFrameHandler();
        sessionLobbies.subscribe("/topic/dashboard/lobbies", handlerLobby);
        sessionLobbies.subscribe("/app/dashboard/lobbies", handlerLobby);
        Iterable lobbyDtosAfterSubscription = completableFutureLobbies.get(1,TimeUnit.SECONDS);
        Iterator<HashMap> lobbies = lobbyDtosAfterSubscription.iterator();
        String testLobbyId = lobbies.next().get("id").toString();

        Assert.assertNotNull(lobbyDtosAfterSubscription);

        //TestUser2 joins testLobby
        ResponseEntity<String> join = restTemplate.getForEntity(getBaseUrl() + "/lobbies/join/"+ testLobbyId + "?token=" + authorizationCredentials2.getBody().getToken(), String.class);
        String testLobbyToken = join.getBody();

        Assert.assertEquals(join.getStatusCode(),HttpStatus.OK);
        Assert.assertEquals(lobbyResponse.getBody(), testLobbyToken);

        //TestUser2 subscribes testLobby
        StompSession sessionSubscribeTestLobby = stompClient.connect(getBaseUrl() + "/lobbies", new StompSessionHandlerAdapter() {
            @Override
            public Type getPayloadType(StompHeaders headers) {
                return super.getPayloadType(headers);
            }
        }).get(1, TimeUnit.SECONDS);

        Assert.assertTrue(sessionSubscribeTestLobby.isConnected());

        SubscribeTestLobbyStompFrameHandler handlerTestLobbySubscription = new SubscribeTestLobbyStompFrameHandler();
        sessionSubscribeTestLobby.subscribe("/topic/lobbies/" + testLobbyToken, handlerTestLobbySubscription);
        sessionSubscribeTestLobby.subscribe("/app/lobbies/" + testLobbyToken, handlerTestLobbySubscription);
        LobbyContextDto lobbyDto = completableFutureSubscribeTestLobby.get(1, TimeUnit.SECONDS);

        Assert.assertNotNull(lobbyDto);

        //get current Lobby State
        StompSession sessionGetLobby = stompClient.connect(getBaseUrl() + "/lobbies", new StompSessionHandlerAdapter() {
            @Override
            public Type getPayloadType(StompHeaders headers) {
                return super.getPayloadType(headers);
            }
        }).get(1, TimeUnit.SECONDS);

        Assert.assertTrue(sessionSubscribeTestLobby.isConnected());

        GetLobbyStompFrameHandler handlerGetLobby = new GetLobbyStompFrameHandler();
        sessionGetLobby.subscribe("/topic/lobbies/" + testLobbyToken, handlerGetLobby);
        sessionGetLobby.subscribe("/app/lobbies/" + testLobbyToken, handlerGetLobby);
        LobbyContextDto lobbyReceived = completableFutureGetLobby.get(1, TimeUnit.SECONDS);

        Assert.assertNotNull(lobbyReceived);

        //disconnect and clear
        sessionGetLobby.disconnect();
        sessionLobbies.disconnect();
        sessionSubscribeTestLobby.disconnect();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
    }

    @Test
    public void updateLobbyContextLobby() throws Exception{
        //setup
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
        WebSocketStompClient stompClient = new WebSocketStompClient(new SockJsClient(createTransportClient()));
        stompClient.setMessageConverter(new MappingJackson2MessageConverter());
        completableFutureCurrentState = new CompletableFuture<>();

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
        String testUser2Token = userRepository.findByUsername("testUsername2").getToken();

        //endpoint test
        ReadyStateMessage message1 = new ReadyStateMessage();
        message1.setUserId(loggedInUser1.getId());
        message1.setReady(true);

        StompSession sessionReady = stompClient.connect(getBaseUrl() + "/lobbies", new StompSessionHandlerAdapter() {
            @Override
            public Type getPayloadType(StompHeaders headers) {
                return super.getPayloadType(headers);
            }
        }).get(1, TimeUnit.SECONDS);

        Assert.assertTrue(sessionReady.isConnected());

        ReadyStompFrameHandler handlerReady = new ReadyStompFrameHandler();
        sessionReady.subscribe("/topic/lobbies" + tesLobbyToken + "/lobby", handlerReady);
        sessionReady.send("/app/lobbies" + tesLobbyToken + "/lobby", message1);

        //clear
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

    private class LobbiesStompFrameHandler implements StompFrameHandler {
        @Override
        public Type getPayloadType(StompHeaders headers) {
            return Iterable.class;
        }

        @Override
        public void handleFrame(StompHeaders stompHeaders, Object payload) {
            completableFutureLobbies.complete((Iterable) payload);
        }
    }

    private class SubscribeTestLobbyStompFrameHandler implements StompFrameHandler {
        @Override
        public Type getPayloadType(StompHeaders headers) {
            return LobbyContextDto.class;
        }

        @Override
        public void handleFrame(StompHeaders stompHeaders, Object payload) {
            completableFutureSubscribeTestLobby.complete((LobbyContextDto) payload);
        }
    }

    private class GetLobbyStompFrameHandler implements StompFrameHandler {
        @Override
        public Type getPayloadType(StompHeaders headers) {
            return LobbyContextDto.class;
        }

        @Override
        public void handleFrame(StompHeaders stompHeaders, Object payload) {
            completableFutureGetLobby.complete((LobbyContextDto) payload);
        }
    }

    private class ReadyStompFrameHandler implements StompFrameHandler {
        @Override
        public Type getPayloadType(StompHeaders headers) {
            return LobbyContextDto.class;
        }

        @Override
        public void handleFrame(StompHeaders stompHeaders, Object payload) {
            completableFutureReady.complete((LobbyContextDto) payload);
        }
    }

    private class GetCurrentStateStompFrameHandler implements StompFrameHandler {
        @Override
        public Type getPayloadType(StompHeaders headers) {
            return LobbyContextDto.class;
        }

        @Override
        public void handleFrame(StompHeaders stompHeaders, Object payload) {
            completableFutureCurrentState.complete((LobbyContextDto) payload);
        }
    }
}
