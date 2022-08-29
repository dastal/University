package ch.uzh.ifi.seal.soprafs19.service.UnitTests;

import ch.uzh.ifi.seal.soprafs19.Application;
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
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.HashSet;

@WebAppConfiguration
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class SetupTest {

    @Autowired
    private UserService userService;

    @Autowired
    private LobbyService lobbyService;

    private Setup setup;

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

    @Test
    public void setupTest() {
        gameRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
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
}
