package ch.uzh.ifi.seal.soprafs19.service.IntegrationTests;

import ch.uzh.ifi.seal.soprafs19.Application;
import ch.uzh.ifi.seal.soprafs19.constant.GameCard;
import ch.uzh.ifi.seal.soprafs19.constant.ObjectType;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.*;
import ch.uzh.ifi.seal.soprafs19.entity.LobbyContext;
import ch.uzh.ifi.seal.soprafs19.entity.Setup;
import ch.uzh.ifi.seal.soprafs19.entity.User;
import ch.uzh.ifi.seal.soprafs19.exceptions.InvalidMoveException;
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
import java.util.Iterator;
import java.util.LinkedList;

@WebAppConfiguration
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class GodCardArtemisTest {

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

    @Test(expected = InvalidMoveException.class)
    public void moveInSimpleMode() {
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
        String tesLobbyToken = lobbyService.createLobby(loggedInUser1.getToken(), "simple");
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

        LinkedList<Long> turnList = ((Setup)lobbyService.getLobbyContext(tesLobbyToken).getState()).getTurnList();

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

        //Set Scenario
        Move move1 = new Move();
        move1.setRow(3);
        move1.setColumn(1);
        move1.setType(ObjectType.WORKER1);
        move1.setSkip(false);
        MoveMessage moveMessage1 = new MoveMessage();
        moveMessage1.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage1.setMove(move1);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage1);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move2 = new Move();
        move2.setRow(2);
        move2.setColumn(1);
        move2.setType(ObjectType.WORKER2);
        move2.setSkip(false);
        MoveMessage moveMessage2 = new MoveMessage();
        moveMessage2.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage2.setMove(move2);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move3= new Move();
        move3.setRow(3);
        move3.setColumn(2);
        move3.setType(ObjectType.WORKER1);
        move3.setSkip(false);
        MoveMessage moveMessage3 = new MoveMessage();
        moveMessage3.setAuthorization(authorizationCredentialsPlayer2);
        moveMessage3.setMove(move3);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage3);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move4 = new Move();
        move4.setRow(2);
        move4.setColumn(2);
        move4.setType(ObjectType.WORKER2);
        move4.setSkip(false);
        MoveMessage moveMessage4 = new MoveMessage();
        moveMessage4.setAuthorization(authorizationCredentialsPlayer2);
        moveMessage4.setMove(move4);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage4);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move5 = new Move();
        move5.setRow(2);
        move5.setColumn(0);
        move5.setType(ObjectType.WORKER1);
        move5.setSkip(false);
        MoveMessage moveMessage5 = new MoveMessage();
        moveMessage5.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage5.setMove(move5);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage5);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //deciding move: worker1 of player1 can move twice
        Move move6 = new Move();
        move6.setRow(1);
        move6.setColumn(0);
        move6.setType(ObjectType.WORKER1);
        move6.setSkip(false);
        MoveMessage moveMessage6 = new MoveMessage();
        moveMessage6.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage6.setMove(move6);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage6);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //all user leave lobby
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser1, tesLobbyToken);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser2, tesLobbyToken);

        //delete all
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyContextRepository.delete(testLobbyContext);
        Assert.assertNull(lobbyContextRepository.findByLobbyName("testUsername's Lobby"));
        userRepository.delete(loggedInUser1);
        userRepository.delete(loggedInUser2);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        Assert.assertNull(userRepository.findByUsername("testUsername2"));
        Assert.assertNull(userRepository.findByUsername("testUsername3"));
        Assert.assertNull(userRepository.findByUsername("testUsername4"));
    }

    @Test
    public void moveWithArtemisCard() {
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
        cardCollection.add(GameCard.ARTEMIS);

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
        cardMessage2.setChosenCard(GameCard.ARTEMIS);

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

        //Set Scenario
        Move move1 = new Move();
        move1.setRow(3);
        move1.setColumn(1);
        move1.setType(ObjectType.WORKER1);
        move1.setSkip(false);
        MoveMessage moveMessage1 = new MoveMessage();
        moveMessage1.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage1.setMove(move1);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage1);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move2 = new Move();
        move2.setRow(2);
        move2.setColumn(1);
        move2.setType(ObjectType.WORKER2);
        move2.setSkip(false);
        MoveMessage moveMessage2 = new MoveMessage();
        moveMessage2.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage2.setMove(move2);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move3= new Move();
        move3.setRow(3);
        move3.setColumn(2);
        move3.setType(ObjectType.WORKER1);
        move3.setSkip(false);
        MoveMessage moveMessage3 = new MoveMessage();
        moveMessage3.setAuthorization(authorizationCredentialsPlayer2);
        moveMessage3.setMove(move3);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage3);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move4 = new Move();
        move4.setRow(2);
        move4.setColumn(2);
        move4.setType(ObjectType.WORKER2);
        move4.setSkip(false);
        MoveMessage moveMessage4 = new MoveMessage();
        moveMessage4.setAuthorization(authorizationCredentialsPlayer2);
        moveMessage4.setMove(move4);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage4);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move5 = new Move();
        move5.setRow(2);
        move5.setColumn(0);
        move5.setType(ObjectType.WORKER1);
        move5.setSkip(false);
        MoveMessage moveMessage5 = new MoveMessage();
        moveMessage5.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage5.setMove(move5);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage5);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //deciding move: worker1 of player1 can move twice
        Move move6 = new Move();
        move6.setRow(1);
        move6.setColumn(0);
        move6.setType(ObjectType.WORKER1);
        move6.setSkip(false);
        MoveMessage moveMessage6 = new MoveMessage();
        moveMessage6.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage6.setMove(move6);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage6);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //all user leave lobby
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser1, tesLobbyToken);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser2, tesLobbyToken);

        //delete all
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
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
    public void moveWithArtemisCardSkipFunction() {
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
        cardCollection.add(GameCard.ARTEMIS);

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
        cardMessage2.setChosenCard(GameCard.ARTEMIS);

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

        //Set Scenario
        Move move1 = new Move();
        move1.setRow(3);
        move1.setColumn(1);
        move1.setType(ObjectType.WORKER1);
        move1.setSkip(false);
        MoveMessage moveMessage1 = new MoveMessage();
        moveMessage1.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage1.setMove(move1);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage1);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move2 = new Move();
        move2.setRow(2);
        move2.setColumn(1);
        move2.setType(ObjectType.WORKER2);
        move2.setSkip(false);
        MoveMessage moveMessage2 = new MoveMessage();
        moveMessage2.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage2.setMove(move2);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move3= new Move();
        move3.setRow(3);
        move3.setColumn(2);
        move3.setType(ObjectType.WORKER1);
        move3.setSkip(false);
        MoveMessage moveMessage3 = new MoveMessage();
        moveMessage3.setAuthorization(authorizationCredentialsPlayer2);
        moveMessage3.setMove(move3);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage3);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move4 = new Move();
        move4.setRow(2);
        move4.setColumn(2);
        move4.setType(ObjectType.WORKER2);
        move4.setSkip(false);
        MoveMessage moveMessage4 = new MoveMessage();
        moveMessage4.setAuthorization(authorizationCredentialsPlayer2);
        moveMessage4.setMove(move4);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage4);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move5 = new Move();
        move5.setRow(2);
        move5.setColumn(0);
        move5.setType(ObjectType.WORKER1);
        move5.setSkip(false);
        MoveMessage moveMessage5 = new MoveMessage();
        moveMessage5.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage5.setMove(move5);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage5);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //deciding move: player1 is able to skip the second move
        Move move6 = new Move();
        move6.setSkip(true);
        MoveMessage moveMessage6 = new MoveMessage();
        moveMessage6.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage6.setMove(move6);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage6);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //all user leave lobby
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser1, tesLobbyToken);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser2, tesLobbyToken);

        //delete all
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        Assert.assertNull(lobbyContextRepository.findByLobbyName("testUsername's Lobby"));
        userRepository.delete(loggedInUser1);
        userRepository.delete(loggedInUser2);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        Assert.assertNull(userRepository.findByUsername("testUsername2"));
        Assert.assertNull(userRepository.findByUsername("testUsername3"));
        Assert.assertNull(userRepository.findByUsername("testUsername4"));
    }

    @Test(expected = InvalidMoveException.class)
    public void moveWithArtemisCardInvalidMove() {
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
        cardCollection.add(GameCard.ARTEMIS);

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
        cardMessage2.setChosenCard(GameCard.ARTEMIS);

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

        //Set Scenario
        Move move1 = new Move();
        move1.setRow(3);
        move1.setColumn(1);
        move1.setType(ObjectType.WORKER1);
        move1.setSkip(false);
        MoveMessage moveMessage1 = new MoveMessage();
        moveMessage1.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage1.setMove(move1);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage1);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move2 = new Move();
        move2.setRow(2);
        move2.setColumn(1);
        move2.setType(ObjectType.WORKER2);
        move2.setSkip(false);
        MoveMessage moveMessage2 = new MoveMessage();
        moveMessage2.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage2.setMove(move2);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage2);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move3= new Move();
        move3.setRow(3);
        move3.setColumn(2);
        move3.setType(ObjectType.WORKER1);
        move3.setSkip(false);
        MoveMessage moveMessage3 = new MoveMessage();
        moveMessage3.setAuthorization(authorizationCredentialsPlayer2);
        moveMessage3.setMove(move3);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage3);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move4 = new Move();
        move4.setRow(2);
        move4.setColumn(2);
        move4.setType(ObjectType.WORKER2);
        move4.setSkip(false);
        MoveMessage moveMessage4 = new MoveMessage();
        moveMessage4.setAuthorization(authorizationCredentialsPlayer2);
        moveMessage4.setMove(move4);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage4);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        Move move5 = new Move();
        move5.setRow(2);
        move5.setColumn(0);
        move5.setType(ObjectType.WORKER1);
        move5.setSkip(false);
        MoveMessage moveMessage5 = new MoveMessage();
        moveMessage5.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage5.setMove(move5);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage5);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //deciding move: player1 is able to skip the second move
        Move move6 = new Move();
        move6.setRow(2);
        move6.setColumn(1);
        move6.setType(ObjectType.WORKER1);
        move6.setSkip(false);
        MoveMessage moveMessage6 = new MoveMessage();
        moveMessage6.setAuthorization(authorizationCredentialsPlayer1);
        moveMessage6.setMove(move6);
        lobbyService.wrapAndUpdate(tesLobbyToken, moveMessage6);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);

        //all user leave lobby
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser1, tesLobbyToken);
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyService.leaveLobbyContext(loggedInUser2, tesLobbyToken);

        //delete all
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        testLobbyContext = lobbyService.getLobbyContext(tesLobbyToken);
        lobbyContextRepository.delete(testLobbyContext);
        Assert.assertNull(lobbyContextRepository.findByLobbyName("testUsername's Lobby"));
        userRepository.delete(loggedInUser1);
        userRepository.delete(loggedInUser2);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        Assert.assertNull(userRepository.findByUsername("testUsername2"));
        Assert.assertNull(userRepository.findByUsername("testUsername3"));
        Assert.assertNull(userRepository.findByUsername("testUsername4"));
    }
}
