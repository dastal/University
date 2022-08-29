package ch.uzh.ifi.seal.soprafs19.service.IntegrationTests;

import ch.uzh.ifi.seal.soprafs19.Application;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.ReadyStateMessage;
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

@WebAppConfiguration
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class CreateSetupModeSimple {
    @Autowired
    private LobbyService lobbyService;

    @Qualifier("lobbyContextRepository")
    @Autowired
    private LobbyContextRepository lobbyContextRepository;

    @Qualifier("userRepository")
    @Autowired
    private UserRepository userRepository;

    @Qualifier("lobbyRepository")
    @Autowired
    private LobbyStateRepository lobbyStateRepository;

    @Qualifier("gameRepository")
    @Autowired
    private GameRepository gameRepository;

    @Qualifier("rulesetRepository")
    @Autowired
    private RulesetRepository rulesetRepository;

    @Autowired
    private UserService userService;

    @Test
    public void createSetupModeSimple() {
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
        testLobbyContext = lobbyContextRepository.findByLobbyName(tesLobbyToken);

        ReadyStateMessage message2 = new ReadyStateMessage();
        message2.setUserId(loggedInUser2.getId());
        message2.setReady(true);
        lobbyService.wrapAndUpdate(tesLobbyToken, message2);
        testLobbyContext = lobbyContextRepository.findByLobbyName(tesLobbyToken);

        //delete all
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        Assert.assertNull(lobbyContextRepository.findByLobbyName("testUsername's Lobby"));
        userRepository.delete(loggedInUser1);
        userRepository.delete(loggedInUser2);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        Assert.assertNull(userRepository.findByUsername("testUsername2"));
        Assert.assertNull(userRepository.findByUsername("testUsername3"));
        Assert.assertNull(userRepository.findByUsername("testUsername4"));
    }
}
