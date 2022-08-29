package ch.uzh.ifi.seal.soprafs19.service.IntegrationTests;

import ch.uzh.ifi.seal.soprafs19.Application;
import ch.uzh.ifi.seal.soprafs19.constant.GameMode;
import ch.uzh.ifi.seal.soprafs19.constant.LobbyStatus;
import ch.uzh.ifi.seal.soprafs19.constant.UserStatus;
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
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

@WebAppConfiguration
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class CreateLobby {
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

    @Test
    public void lobbyCreationProcedure() {
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();

        //create testUser and log him in
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        User createdUser = userService.createUser(testUser);

        Assert.assertNull(createdUser.getToken());
        Assert.assertEquals(createdUser.getStatus(), UserStatus.OFFLINE);
        Assert.assertEquals(createdUser, userRepository.findByUsername(createdUser.getUsername()));
        User local = userService.loginUser("testUsername", "1234");

        Assert.assertEquals(local, testUser);
        Assert.assertEquals(local.getStatus(), UserStatus.ONLINE);
        Assert.assertNotNull(local.getToken());

        //create second testUser and log him in
        User testUser2 = new User();
        testUser2.setName("testName2");
        testUser2.setUsername("testUsername2");
        testUser2.setBirthDay("946681200000");
        testUser2.setPassword("1234");
        User createdUser2 = userService.createUser(testUser2);
        User local2 = userService.loginUser("testUsername2", "1234");

        Assert.assertNull(createdUser2.getToken());
        Assert.assertEquals(createdUser2.getStatus(), UserStatus.OFFLINE);
        Assert.assertEquals(createdUser2, userRepository.findByUsername(createdUser2.getUsername()));

        Assert.assertEquals(local2, testUser2);
        Assert.assertEquals(local2.getStatus(), UserStatus.ONLINE);
        Assert.assertNotNull(local2.getToken());

        //create testLobby in simple mode with testUser
        String testLobbyToken = lobbyService.createLobby(local.getToken(), "simple");
        LobbyContext testLobby = lobbyContextRepository.findByLobbyToken(testLobbyToken);

        Assert.assertNotNull(testLobbyToken);
        Assert.assertEquals(testLobbyToken, testLobby.getLobbyToken());
        Assert.assertEquals(testLobby.getStateType(), LobbyStatus.LOBBY);
        Assert.assertEquals(testLobby.getMode().toString(), GameMode.SIMPLE.toString());
        Assert.assertEquals(createdUser.getUsername() + "'s Lobby", lobbyContextRepository.findByLobbyToken(testLobbyToken).getLobbyName());

        //testUser joins lobby
        String lobbyTokenAfterJoin = lobbyService.joinLobbyContext(local, testLobby);

        Assert.assertEquals(testLobbyToken, lobbyTokenAfterJoin);

        //Assert that testUser is in Lobby
        LobbyContext testLobbyFound = lobbyService.getLobbyContext(testLobbyToken);
        List<User> userSet = testLobbyFound.getUsers();
        Iterator<User> users = userSet.iterator();
        User userFound1 = users.next();
        LobbyContext context = lobbyContextRepository.findByLobbyName("testUsername's Lobby");
        List<User> user = context.getUsers();
        Iterator<User> iter = user.iterator();

        Assert.assertEquals(userFound1.getUsername(), testUser.getUsername());
        Assert.assertEquals(testLobbyToken, testLobbyFound.getLobbyToken());
        Assert.assertEquals(iter.next().getUsername(), local.getUsername());

        //get all open Lobbies for testUser2
        List<LobbyContext> openLobbies = lobbyService.getOpenLobbies();
        Iterator<LobbyContext> lobbiesFound = openLobbies.iterator();
        LobbyContext lobbyFound = lobbiesFound.next();

        Assert.assertEquals(lobbyFound.getLobbyToken(), testLobbyToken);
        Assert.assertEquals(lobbyFound.getLobbyName(), testLobby.getLobbyName());
        Assert.assertEquals(lobbyFound.getId(), testLobby.getId());

        //testUser2 joins testLobby
        String lobbyTokenAfterSecondJoin = lobbyService.joinLobbyContext(local2, testLobby);
        Assert.assertEquals(testLobbyToken, lobbyTokenAfterSecondJoin);

        //delete testLobby, testUser and testUser2
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyContextRepository.delete(testLobby);
        userRepository.delete(testUser);
        userRepository.delete(testUser2);
        Assert.assertNull(lobbyContextRepository.findByLobbyName(createdUser.getUsername() + "'s Lobby"));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        Assert.assertNull(userRepository.findByUsername("testUsername2"));
    }
}
