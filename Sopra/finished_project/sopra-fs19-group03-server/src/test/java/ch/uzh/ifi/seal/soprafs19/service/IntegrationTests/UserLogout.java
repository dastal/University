package ch.uzh.ifi.seal.soprafs19.service.IntegrationTests;

import ch.uzh.ifi.seal.soprafs19.Application;
import ch.uzh.ifi.seal.soprafs19.constant.UserStatus;
import ch.uzh.ifi.seal.soprafs19.entity.User;
import ch.uzh.ifi.seal.soprafs19.repository.*;
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
public class UserLogout {

    @Qualifier("userRepository")
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @Qualifier("lobbyContextRepository")
    @Autowired
    private LobbyContextRepository lobbyContextRepository;

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
    public void loginLogoutProcedure() {
        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.deleteAll();

        //create testUser
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        User createdUser = userService.createUser(testUser);

        Assert.assertNull(createdUser.getToken());
        Assert.assertEquals(createdUser.getStatus(), UserStatus.OFFLINE);
        Assert.assertEquals(createdUser, userRepository.findByUsername(createdUser.getUsername()));

        //login testUser
        User local = userService.loginUser("testUsername", "1234");

        Assert.assertEquals(local, testUser);
        Assert.assertEquals(local.getStatus(), UserStatus.ONLINE);
        Assert.assertNotNull(local.getToken());

        //update testUser
        User updatedUser = new User();
        updatedUser.setName("testNameUpdated");
        updatedUser.setUsername("testUsernameUpdated");
        updatedUser.setBirthDay("915145200000");
        updatedUser.setPassword("1234");

        userService.updateUser(local.getId().toString(), updatedUser, local.getToken());

        local = userRepository.findById(local.getId()).orElse(null);
        Assert.assertEquals(local.getUsername(), updatedUser.getUsername());
        Assert.assertEquals(local.getName(), updatedUser.getName());
        Assert.assertEquals(local.getBirthDay(), updatedUser.getBirthDay());

        //logout testUser
        userService.logoutUser(userRepository.findByUsername("testUsernameUpdated").getToken());

        Assert.assertEquals(userRepository.findByUsername("testUsernameUpdated").getStatus(), UserStatus.OFFLINE);

        gameRepository.deleteAll();
        lobbyStateRepository.deleteAll();
        rulesetRepository.deleteAll();
        lobbyContextRepository.deleteAll();
        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsernameUpdated"));
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }
}
