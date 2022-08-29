package ch.uzh.ifi.seal.soprafs19.service.EndpointTests;

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
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class LobbyPrestateEndpointTest {

    @Autowired
    private TestRestTemplate restTemplate;

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

    private CompletableFuture<LobbyContextDto> completableFutureLobby;

    @Test
    public void subscribeLobbyContext() throws Exception {
        //setup
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
        WebSocketStompClient stompClient = new WebSocketStompClient(new SockJsClient(createTransportClient()));
        stompClient.setMessageConverter(new MappingJackson2MessageConverter());
        completableFutureLobby = new CompletableFuture<>();

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

        //subscribe lobby context
        StompSession sessionSubscribeLobbyContext = stompClient.connect(getBaseUrl() + "/lobbies", new StompSessionHandlerAdapter() {
            @Override
            public Type getPayloadType(StompHeaders headers) {
                return super.getPayloadType(headers);
            }
        }).get(1, TimeUnit.SECONDS);

        Assert.assertTrue(sessionSubscribeLobbyContext.isConnected());

        LobbyStopmFrameHandler handlerLobby = new LobbyStopmFrameHandler();

        sessionSubscribeLobbyContext.subscribe("/topic/lobbies/" + tesLobbyToken, handlerLobby);
        sessionSubscribeLobbyContext.subscribe("/app/lobbies/" + tesLobbyToken, handlerLobby);

        LobbyContextDto context = completableFutureLobby.get(1, TimeUnit.SECONDS);

        Assert.assertNotNull(context);

        //clear
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
    }

    @Test
    public void joinLobbyContext() {
        //setup
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
        WebSocketStompClient stompClient = new WebSocketStompClient(new SockJsClient(createTransportClient()));
        stompClient.setMessageConverter(new MappingJackson2MessageConverter());
        completableFutureLobby = new CompletableFuture<>();

        //create TestUser and log him in
        User testUser = new User();
        testUser.setUsername("testUsername");
        testUser.setName("testUser");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        User loggedInUser1 = userService.loginUser("testUsername", "1234");

        //create testLobby with testUser1
        String testLobbyToken = lobbyService.createLobby(loggedInUser1.getToken(), "simple");
        LobbyContext testLobbyContext = lobbyService.getLobbyContext(testLobbyToken);
        Long testLobbyId = testLobbyContext.getId();

        User testUser2 = new User();
        testUser2.setUsername("testUsername2");
        testUser2.setName("testUser2");
        //01-01-1990
        testUser2.setBirthDay("631148400000");
        testUser2.setPassword("1234");
        userService.createUser(testUser2);
        User loggedInUser2 = userService.loginUser("testUsername2", "1234");
        String testUser2Token = userRepository.findByUsername("testUsername").getToken();

        //let testUser2 join the lobby
        ResponseEntity<String> response = restTemplate.getForEntity(getBaseUrl() + "/lobbies/join/" + testLobbyId + "?token=" + testUser2Token,String.class);

        Assert.assertEquals(response.getStatusCode(), HttpStatus.OK);
        Assert.assertEquals(response.getBody(), testLobbyToken);

        //clear
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
    }

    @Test
    public void leaveLobbyContext() {
        //setup
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();

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
        lobbyService.joinLobbyContext(loggedInUser2, testLobbyContext);
        String testUser2Token = userRepository.findByUsername("testUsername2").getToken();
        
        //leave lobby
        String leaveEntity = "";
        restTemplate.postForEntity(getBaseUrl() + "/lobbies/leave/" + tesLobbyToken + "?token=" + testUser2Token, leaveEntity, String.class);


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

    private class LobbyStopmFrameHandler implements StompFrameHandler {
        @Override
        public Type getPayloadType(StompHeaders headers) {
            return LobbyContextDto.class;
        }

        @Override
        public void handleFrame(StompHeaders stompHeaders, Object payload) {
            completableFutureLobby.complete((LobbyContextDto) payload);
        }
    }
}
