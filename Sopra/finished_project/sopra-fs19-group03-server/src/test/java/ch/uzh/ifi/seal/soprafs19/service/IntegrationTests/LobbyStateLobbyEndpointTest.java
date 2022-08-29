package ch.uzh.ifi.seal.soprafs19.service.IntegrationTests;

import ch.uzh.ifi.seal.soprafs19.dto.incoming.AuthorizationCredentials;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.ReadyStateMessage;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.LobbyContextDto;
import ch.uzh.ifi.seal.soprafs19.entity.User;
import ch.uzh.ifi.seal.soprafs19.repository.*;
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

    @Qualifier("gameRepository")
    @Autowired
    private GameRepository gameRepository;

    @Qualifier("rulesetRepository")
    @Autowired
    private RulesetRepository rulesetRepository;

    @Qualifier("lobbyRepository")
    @Autowired
    private LobbyStateRepository lobbyStateRepository;


    @Autowired
    private UserService userService;

    @Test
    public void updateLobbyContextLobby() throws Exception {
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
        WebSocketStompClient stompClient = new WebSocketStompClient(new SockJsClient(createTransportClient()));
        stompClient.setMessageConverter(new MappingJackson2MessageConverter());
        completableFutureLobbies = new CompletableFuture<>();
        completableFutureSubscribeTestLobby = new CompletableFuture<>();
        completableFutureReady = new CompletableFuture<>();
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

        //update LobbyContextDto ready
        ReadyStateMessage readyStateMessage = new ReadyStateMessage();
        readyStateMessage.setUserId(authorizationCredentials.getBody().getId());
        readyStateMessage.setReady(true);

        StompSession sessionMessageReady = stompClient.connect(getBaseUrl() + "/lobbies", new StompSessionHandlerAdapter() {
            @Override
            public Type getPayloadType(StompHeaders headers) {
                return super.getPayloadType(headers);
            }
        }).get(1, TimeUnit.SECONDS);

        ReadyStompFrameHandler handlerReady = new ReadyStompFrameHandler();
        sessionMessageReady.subscribe("/topic/lobbies/"  + testLobbyToken + "/lobby", handlerReady);
        sessionMessageReady.subscribe("/app/lobbies/" + testLobbyToken + "/lobby", handlerReady);
        sessionMessageReady.send("/app/lobbies/" + testLobbyToken + "/lobby", readyStateMessage);
        LobbyContextDto readyDto = completableFutureReady.get(1, TimeUnit.SECONDS);

        Assert.assertNotNull(readyDto);

        //clear Repositories
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
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
}
