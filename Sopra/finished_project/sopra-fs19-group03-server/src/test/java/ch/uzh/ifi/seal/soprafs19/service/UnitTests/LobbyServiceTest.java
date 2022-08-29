package ch.uzh.ifi.seal.soprafs19.service.UnitTests;

import ch.uzh.ifi.seal.soprafs19.Application;
import ch.uzh.ifi.seal.soprafs19.constant.*;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.*;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.LobbyDto;
import ch.uzh.ifi.seal.soprafs19.entity.LobbyContext;
import ch.uzh.ifi.seal.soprafs19.entity.Setup;
import ch.uzh.ifi.seal.soprafs19.entity.User;
import ch.uzh.ifi.seal.soprafs19.exceptions.LobbyNotExistsException;
import ch.uzh.ifi.seal.soprafs19.repository.*;
import ch.uzh.ifi.seal.soprafs19.service.LobbyService;
import ch.uzh.ifi.seal.soprafs19.service.UserService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;

@WebAppConfiguration
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class LobbyServiceTest {

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

    @Autowired
    private UserService userService;

    private Setup setup;

    @Test
    public void createLobbyModeSimple(){
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");

        User createdUser = userService.createUser(testUser);
        User loggedInUser = userService.loginUser("testUsername", "1234");

        String testLobbyToken = lobbyService.createLobby(loggedInUser.getToken(), "simple");
        LobbyContext testLobby = lobbyContextRepository.findByLobbyToken(testLobbyToken);

        Assert.assertNotNull(testLobbyToken);
        Assert.assertEquals(testLobbyToken, testLobby.getLobbyToken());
        Assert.assertEquals(testLobby.getStateType(), LobbyStatus.LOBBY);
        Assert.assertEquals("SIMPLE", GameMode.SIMPLE.toString());
        Assert.assertEquals(createdUser.getUsername() + "'s Lobby", lobbyContextRepository.findByLobbyToken(testLobbyToken).getLobbyName());

        lobbyContextRepository.delete(testLobby);
        userRepository.delete(testUser);
        Assert.assertNull(lobbyContextRepository.findByLobbyName(createdUser.getUsername() + "'s Lobby"));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test
    public void createLobbyModeGodCards() {
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();

        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");

        User createdUser = userService.createUser(testUser);
        User loggedInUser = userService.loginUser("testUsername", "1234");

        String testLobbyToken = lobbyService.createLobby(loggedInUser.getToken(), "GodCard");
        LobbyContext testLobby = lobbyContextRepository.findByLobbyToken(testLobbyToken);

        Assert.assertNotNull(testLobbyToken);
        Assert.assertEquals(testLobbyToken, testLobby.getLobbyToken());
        Assert.assertEquals(testLobby.getStateType(), LobbyStatus.LOBBY);
        Assert.assertEquals("GODCARDS", GameMode.GODCARDS.toString());
        Assert.assertEquals(createdUser.getUsername() + "'s Lobby", lobbyContextRepository.findByLobbyToken(testLobbyToken).getLobbyName());

        lobbyContextRepository.delete(testLobby);
        userRepository.delete(testUser);
        Assert.assertNull(lobbyContextRepository.findByLobbyName(createdUser.getUsername() + "'s Lobby"));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test
    public void getLobbyContexts(){
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");

        userService.createUser(testUser);
        User loggedInUser = userService.loginUser("testUsername", "1234");
        String testLobbyToken = lobbyService.createLobby(loggedInUser.getToken(), "simple");
        LobbyContext testLobby = lobbyContextRepository.findByLobbyToken(testLobbyToken);

        Iterable<LobbyContext> lobbies = lobbyService.getLobbyContexts();
        Iterator<LobbyContext> iter = lobbies.iterator();

        Assert.assertEquals(iter.next().getLobbyToken(), testLobbyToken);

        lobbyContextRepository.delete(testLobby);
        userRepository.delete(testUser);
        Assert.assertNull(lobbyContextRepository.findByLobbyName(loggedInUser.getUsername() + "'s Lobby"));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test
    public void getLobbyContextByLobbyToken() {
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();

        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");

        userService.createUser(testUser);
        User loggedInUser = userService.loginUser("testUsername", "1234");
        String testLobbyToken = lobbyService.createLobby(loggedInUser.getToken(), "simple");
        LobbyContext testLobby = lobbyService.getLobbyContext(testLobbyToken);

        Assert.assertEquals(testLobbyToken, testLobby.getLobbyToken());
        Assert.assertEquals("testUsername's Lobby", testLobby.getLobbyName());

        lobbyContextRepository.delete(testLobby);
        userRepository.delete(testUser);
        Assert.assertNull(lobbyContextRepository.findByLobbyName(loggedInUser.getUsername() + "'s Lobby"));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test
    public void getLobbyContextByLobbyId() {
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");

        userService.createUser(testUser);
        User loggedInUser = userService.loginUser("testUsername", "1234");
        String testLobbyToken = lobbyService.createLobby(loggedInUser.getToken(), "simple");
        LobbyContext testLobby = lobbyService.getLobbyContext(testLobbyToken);
        Long testLobbyId = testLobby.getId();
        LobbyContext testLobbyResponse = lobbyService.getLobbyContext(testLobbyId);

        Assert.assertEquals(testLobbyId, testLobbyResponse.getId());
        Assert.assertEquals("testUsername's Lobby", testLobbyResponse.getLobbyName());

        lobbyContextRepository.delete(testLobby);
        userRepository.delete(testUser);
        Assert.assertNull(lobbyContextRepository.findByLobbyName(loggedInUser.getUsername() + "'s Lobby"));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test(expected = LobbyNotExistsException.class)
    public void getLobbyContextWithInvalidLobbyId() {
        lobbyService.getLobbyContext(99999L);
    }

    @Test
    public void getOpenLobbies() {
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");

        userService.createUser(testUser);
        User loggedInUser = userService.loginUser("testUsername", "1234");
        String testLobbyToken = lobbyService.createLobby(loggedInUser.getToken(), "simple");

        Iterable<LobbyContext> lobbies = lobbyService.getOpenLobbies();
        Iterator<LobbyContext> iter = lobbies.iterator();
        LobbyContext testLobby = lobbyContextRepository.findByLobbyToken(testLobbyToken);

        Assert.assertEquals(iter.next().getLobbyToken(), testLobbyToken);
        Assert.assertEquals(testLobby.getStateType(), LobbyStatus.LOBBY);

        lobbyContextRepository.delete(testLobby);
        userRepository.delete(testUser);
        Assert.assertNull(lobbyContextRepository.findByLobbyName(loggedInUser.getUsername() + "'s Lobby"));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test
    public void joinLobby() {
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");

        User createdUser = userService.createUser(testUser);
        User loggedInUser = userService.loginUser("testUsername", "1234");

        String testLobbyToken = lobbyService.createLobby(loggedInUser.getToken(), "simple");
        LobbyContext testLobby = lobbyContextRepository.findByLobbyToken(testLobbyToken);

        Assert.assertNotNull(testLobbyToken);
        Assert.assertEquals(testLobbyToken, testLobby.getLobbyToken());
        Assert.assertEquals(testLobby.getStateType(), LobbyStatus.LOBBY);
        Assert.assertEquals("SIMPLE", GameMode.SIMPLE.toString());
        Assert.assertEquals(createdUser.getUsername() + "'s Lobby", lobbyContextRepository.findByLobbyToken(testLobbyToken).getLobbyName());

        User anotherTestUser = new User();
        anotherTestUser.setName("anotherTestName");
        anotherTestUser.setUsername("anotherTestUsername");
        anotherTestUser.setBirthDay("946681200000");
        anotherTestUser.setPassword("1234");
        userService.createUser(anotherTestUser);
        User anotherLoggedInUser = userService.loginUser("anotherTestUsername", "1234");

        String lobbyTokenAfterJoin = lobbyService.joinLobbyContext(anotherLoggedInUser, testLobby);

        Assert.assertEquals(testLobbyToken, lobbyTokenAfterJoin);

        lobbyContextRepository.delete(testLobby);
        userRepository.delete(testUser);
        userRepository.delete(anotherTestUser);
        Assert.assertNull(lobbyContextRepository.findByLobbyName(createdUser.getUsername() + "'s Lobby"));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        Assert.assertNull(userRepository.findByUsername("anotherTestUsername"));
    }

    @Test
    public void currentLobbyStateLobby() {
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");

        userService.createUser(testUser);
        User loggedInUser = userService.loginUser("testUsername", "1234");

        String testLobbyToken = lobbyService.createLobby(loggedInUser.getToken(), "simple");

        Message lobbyStateLobby = lobbyService.currentLobbyState(testLobbyToken);

        Assert.assertEquals(lobbyStateLobby.getClass(), LobbyDto.class);

        lobbyContextRepository.deleteAll();
        userRepository.delete(testUser);
        Assert.assertNull(lobbyContextRepository.findByLobbyName("testUsername's Lobby"));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test
    public void updateLobbyContext() {
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();

        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");

        userService.createUser(testUser);
        User loggedInUser = userService.loginUser("testUsername", "1234");

        String testLobbyToken = lobbyService.createLobby(loggedInUser.getToken(), "simple");
        LobbyContext testLobby = lobbyContextRepository.findByLobbyToken(testLobbyToken);
        lobbyService.joinLobbyContext(testUser, testLobby);

        User anotherTestUser = new User();
        anotherTestUser.setName("anotherTestName");
        anotherTestUser.setUsername("anotherTestUsername");
        anotherTestUser.setBirthDay("946681200000");
        anotherTestUser.setPassword("1234");
        userService.createUser(anotherTestUser);
        User anotherLoggedInUser = userService.loginUser("anotherTestUsername", "1234");
        LobbyContext testLobbyContext = lobbyContextRepository.findByLobbyToken(testLobbyToken);

        lobbyService.joinLobbyContext(anotherLoggedInUser, testLobby);

        ReadyStateMessage message = new ReadyStateMessage();
        message.setUserId(loggedInUser.getId());
        ReadyStateMessage message1 = new ReadyStateMessage();
        message1.setUserId(anotherLoggedInUser.getId());

        MessageContainer container = new MessageContainer(message, MessageType.READYSTATEMESSAGE);
        MessageContainer container1 = new MessageContainer(message1, MessageType.READYSTATEMESSAGE);

        lobbyService.updateLobbyContext(testLobbyToken, container);
        lobbyService.updateLobbyContext(testLobbyToken, container1);

        lobbyContextRepository.delete(testLobby);
        userRepository.delete(testUser);
        userRepository.delete(anotherTestUser);
        Assert.assertNull(lobbyContextRepository.findByLobbyName("testUsername's Lobby"));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        Assert.assertNull(userRepository.findByUsername("anotherTestUsername"));
    }

    @Test
    public void wrapAndUpdateMessageReadyStateMessage() {
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();

        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        User loggedInUser = userService.loginUser("testUsername", "1234");

        String testLobbyToken = lobbyService.createLobby(loggedInUser.getToken(), "simple");
        LobbyContext testLobby = lobbyContextRepository.findByLobbyToken(testLobbyToken);
        lobbyService.joinLobbyContext(testUser, testLobby);

        ReadyStateMessage message = new ReadyStateMessage();
        message.setUserId(loggedInUser.getId());
        message.setReady(true);

        lobbyService.wrapAndUpdate(testLobbyToken, message);

        lobbyContextRepository.delete(testLobby);
        userRepository.delete(testUser);
        Assert.assertNull(lobbyContextRepository.findByLobbyName("testUsername's Lobby"));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test
    public void wrapAndUpdateCardCollectionMessage() {
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

        //send cardCollection
        Long chooserId = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getChooserId();
        ArrayList<GameCard> cardCollection = new ArrayList<>();
        cardCollection.add(GameCard.ATLAS);
        cardCollection.add(GameCard.DEMETER);

        CardCollectionMessage collectionMessage = new CardCollectionMessage();
        collectionMessage.setUserId(chooserId);
        collectionMessage.setCardCollection(cardCollection);

        lobbyService.wrapAndUpdate(tesLobbyToken, collectionMessage);

        //all user leave lobby
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser1, tesLobbyToken);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser2, tesLobbyToken);

        //delete all
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        Assert.assertNull(lobbyContextRepository.findByLobbyName("testUsername's Lobby"));
        userRepository.delete(loggedInUser1);
        userRepository.delete(loggedInUser2);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        Assert.assertNull(userRepository.findByUsername("testUsername2"));
        Assert.assertNull(userRepository.findByUsername("testUsername3"));
        Assert.assertNull(userRepository.findByUsername("testUsername4"));
    }

    @Test
    public void wrapAndUpdateGameCardMessage() {
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

        //send cardCollection
        Long chooserId = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getChooserId();
        ArrayList<GameCard> cardCollection = new ArrayList<>();
        cardCollection.add(GameCard.ATLAS);
        cardCollection.add(GameCard.DEMETER);

        CardCollectionMessage collectionMessage = new CardCollectionMessage();
        collectionMessage.setUserId(chooserId);
        collectionMessage.setCardCollection(cardCollection);

        lobbyService.wrapAndUpdate(tesLobbyToken, collectionMessage);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //send chosen Cards
        Long otherId;
        if(testUser.getId().equals(chooserId)){
            otherId = testUser2.getId();
        } else {
            otherId = testUser.getId();
        }

        GameCardMessage cardMessage1 = new GameCardMessage();
        cardMessage1.setUserId(otherId);
        cardMessage1.setChosenCard(GameCard.ATLAS);

        GameCardMessage cardMessage2 = new GameCardMessage();
        cardMessage2.setUserId(otherId);
        cardMessage2.setChosenCard(GameCard.DEMETER);

        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage1);
        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage2);

        //all user leave lobby
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser1, tesLobbyToken);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser2, tesLobbyToken);

        //delete all
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        Assert.assertNull(lobbyContextRepository.findByLobbyName("testUsername's Lobby"));
        userRepository.delete(loggedInUser1);
        userRepository.delete(loggedInUser2);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        Assert.assertNull(userRepository.findByUsername("testUsername2"));
        Assert.assertNull(userRepository.findByUsername("testUsername3"));
        Assert.assertNull(userRepository.findByUsername("testUsername4"));
    }

    @Test
    public void changeStateToSetup() {
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();

        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();

        //create TestUsers and log them in
        User testUser = new User();
        testUser.setUsername("testUsername");
        testUser.setName("testUser");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        User loggedInUser1 = userService.loginUser("testUsername", "1234");

        User testUser2 = new User();
        testUser2.setUsername("testUsername2");
        testUser2.setName("testUser2");
        //01-01-1990
        testUser2.setBirthDay("631148400000");
        testUser2.setPassword("1234");
        userService.createUser(testUser2);
        User loggedInUser2 = userService.loginUser("testUsername2", "1234");

        User testUser3 = new User();
        testUser3.setUsername("testUsername3");
        testUser3.setName("testUser3");
        //01-01-1995
        testUser3.setBirthDay("788914800000");
        testUser3.setPassword("1234");
        userService.createUser(testUser3);
        User loggedInUser3 = userService.loginUser("testUsername3", "1234");

        User testUser4 = new User();
        testUser4.setUsername("testUsername4");
        testUser4.setName("testUser4");
        //01-01-1985
        testUser4.setBirthDay("473382000000");
        testUser4.setPassword("1234");
        userService.createUser(testUser4);
        User loggedInUser4 = userService.loginUser("testUsername4", "1234");

        //create testLobby with testUser1 and let the other join testLobby
        String tesLobbyToken = lobbyService.createLobby(loggedInUser1.getToken(), "GodCards");
        LobbyContext testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.joinLobbyContext(testUser2, testLobbyContext);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.joinLobbyContext(testUser3, testLobbyContext);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.joinLobbyContext(testUser4, testLobbyContext);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //create Setup
        HashSet<Long> userIds = new HashSet<>();
        userIds.add(loggedInUser2.getId());
        userIds.add(loggedInUser3.getId());
        userIds.add(loggedInUser4.getId());
        userIds.add(loggedInUser1.getId());

        setup = new Setup(userIds, testLobbyContext);
        lobbyService.changeStateToSetup(testLobbyContext, userIds);

        Assert.assertNotNull(setup.getChooserId());
        Assert.assertNotNull(setup.getCurrentChooser());
        Assert.assertNotNull(setup.getPickList());

        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser1, tesLobbyToken);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser2, tesLobbyToken);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser3, tesLobbyToken);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser4, tesLobbyToken);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //delete all
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        Assert.assertNull(lobbyContextRepository.findByLobbyName("testUsername's Lobby"));
        userRepository.delete(loggedInUser1);
        userRepository.delete(loggedInUser2);
        userRepository.delete(loggedInUser3);
        userRepository.delete(loggedInUser4);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        Assert.assertNull(userRepository.findByUsername("testUsername2"));
        Assert.assertNull(userRepository.findByUsername("testUsername3"));
        Assert.assertNull(userRepository.findByUsername("testUsername4"));
    }

    @Test
    public void changeStateToGame() {
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
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

        //send cardCollection
        Long chooserId = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getChooserId();
        ArrayList<GameCard> cardCollection = new ArrayList<>();
        cardCollection.add(GameCard.ATLAS);
        cardCollection.add(GameCard.DEMETER);

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
        cardMessage1.setChosenCard(GameCard.ATLAS);

        GameCardMessage cardMessage2 = new GameCardMessage();
        cardMessage2.setUserId(pickList.next());
        cardMessage2.setChosenCard(GameCard.DEMETER);

        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage1);
        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //change State to Game
        lobbyService.changeStateToGame(testLobbyContext, turnList);

        //all user leave lobby
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser1, tesLobbyToken);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser2, tesLobbyToken);

        //delete all
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        Assert.assertNull(lobbyContextRepository.findByLobbyName("testUsername's Lobby"));
        userRepository.delete(loggedInUser1);
        userRepository.delete(loggedInUser2);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        Assert.assertNull(userRepository.findByUsername("testUsername2"));
        Assert.assertNull(userRepository.findByUsername("testUsername3"));
        Assert.assertNull(userRepository.findByUsername("testUsername4"));
    }

    @Test
    public void wrapAndUpdateMoveMessage() {
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
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

        //send cardCollection
        Long chooserId = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getChooserId();
        ArrayList<GameCard> cardCollection = new ArrayList<>();
        cardCollection.add(GameCard.ATLAS);
        cardCollection.add(GameCard.DEMETER);

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
        cardMessage1.setChosenCard(GameCard.ATLAS);

        GameCardMessage cardMessage2 = new GameCardMessage();
        cardMessage2.setUserId(pickList.next());
        cardMessage2.setChosenCard(GameCard.DEMETER);

        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage1);
        lobbyService.wrapAndUpdate(tesLobbyToken, cardMessage2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //change State to Game
        lobbyService.changeStateToGame(testLobbyContext, turnList);

        //send first Move
        Iterator<Long> turnListIterator = turnList.iterator();
        Long firstId = turnListIterator.next();
        String firstToken = userService.getUser(firstId).getToken();
        AuthorizationCredentials authorizationCredentials = new AuthorizationCredentials();
        authorizationCredentials.setToken(firstToken);
        authorizationCredentials.setId(firstId);

        Move move = new Move();
        move.setRow(1);
        move.setColumn(1);
        move.setType(ObjectType.WORKER1);
        move.setSkip(false);

        MoveMessage moveMessage = new MoveMessage();
        moveMessage.setAuthorization(authorizationCredentials);
        moveMessage.setMove(move);

        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage);

        //all user leave lobby
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser1, tesLobbyToken);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser2, tesLobbyToken);

        //delete all
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        Assert.assertNull(lobbyContextRepository.findByLobbyName("testUsername's Lobby"));
        userRepository.delete(loggedInUser1);
        userRepository.delete(loggedInUser2);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        Assert.assertNull(userRepository.findByUsername("testUsername2"));
        Assert.assertNull(userRepository.findByUsername("testUsername3"));
        Assert.assertNull(userRepository.findByUsername("testUsername4"));
    }
}
