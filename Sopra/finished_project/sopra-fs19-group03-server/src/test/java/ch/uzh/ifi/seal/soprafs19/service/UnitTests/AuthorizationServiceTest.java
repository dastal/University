package ch.uzh.ifi.seal.soprafs19.service.UnitTests;

import ch.uzh.ifi.seal.soprafs19.Application;
import ch.uzh.ifi.seal.soprafs19.constant.UserStatus;
import ch.uzh.ifi.seal.soprafs19.entity.LobbyContext;
import ch.uzh.ifi.seal.soprafs19.entity.User;
import ch.uzh.ifi.seal.soprafs19.exceptions.AuthenticationException;
import ch.uzh.ifi.seal.soprafs19.repository.LobbyContextRepository;
import ch.uzh.ifi.seal.soprafs19.repository.UserRepository;
import ch.uzh.ifi.seal.soprafs19.service.AuthorizationService;
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
public class AuthorizationServiceTest {

    @Qualifier("userRepository")
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthorizationService authorizationService;

    @Autowired
    private UserService userService;

    @Autowired
    private LobbyService lobbyService;

    @Qualifier("lobbyContextRepository")
    @Autowired
    private LobbyContextRepository lobbyContextRepository;

    @Test
    public void authorizeValidToken() {
        userRepository.deleteAll();
        Assert.assertNull(userRepository.findByUsername("testUsername"));

        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        User localTestUser = userService.loginUser("testUsername", "1234");

        User local = authorizationService.authorize(localTestUser.getToken());
        Assert.assertNotNull(local);

        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUser"));
    }

    @Test
    public void startSession() {
        userRepository.deleteAll();
        Assert.assertNull(userRepository.findByUsername("testUsername"));

        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        testUser = userService.loginUser("testUsername", "1234");

        authorizationService.startSession(testUser);
        Assert.assertEquals(testUser.getStatus(), UserStatus.ONLINE);

        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test
    public void validateWithSessionToken() {
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
        Assert.assertNull(userRepository.findByUsername("testUsername"));

        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        userService.loginUser("testUsername", "1234");
        testUser = userRepository.findByUsername("testUsername");

        String testLobbyToken = lobbyService.createLobby(testUser.getToken(), "simple");
        LobbyContext testLobby = lobbyContextRepository.findByLobbyToken(testLobbyToken);

        authorizationService.authorize(testUser.getToken(), testLobbyToken);

        lobbyContextRepository.delete(testLobby);
        userRepository.delete(testUser);
        Assert.assertNull(lobbyContextRepository.findByLobbyToken(testLobbyToken));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test(expected = AuthenticationException.class)
    public void validateWithInvalidSessionToken() {
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();
        Assert.assertNull(userRepository.findByUsername("testUsername"));

        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        userService.loginUser("testUsername", "1234");
        testUser = userRepository.findByUsername("testUsername");

        String testLobbyToken = lobbyService.createLobby(testUser.getToken(), "simple");
        LobbyContext testLobby = lobbyContextRepository.findByLobbyToken(testLobbyToken);

        authorizationService.authorize("someRandomSessionTokenButForSureNotTheRightOne", testLobbyToken);

        lobbyContextRepository.delete(testLobby);
        userRepository.delete(testUser);
        Assert.assertNull(lobbyContextRepository.findByLobbyToken(testLobbyToken));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }
}
