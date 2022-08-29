package ch.uzh.ifi.seal.soprafs19.service.UnitTests;

import ch.uzh.ifi.seal.soprafs19.Application;
import ch.uzh.ifi.seal.soprafs19.constant.UserStatus;
import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import ch.uzh.ifi.seal.soprafs19.entity.User;
import ch.uzh.ifi.seal.soprafs19.exceptions.AuthenticationException;
import ch.uzh.ifi.seal.soprafs19.exceptions.PasswordNotValidException;
import ch.uzh.ifi.seal.soprafs19.exceptions.UserExistingException;
import ch.uzh.ifi.seal.soprafs19.exceptions.UserNotFoundExceptions;
import ch.uzh.ifi.seal.soprafs19.repository.RulesetRepository;
import ch.uzh.ifi.seal.soprafs19.repository.UserRepository;
import ch.uzh.ifi.seal.soprafs19.service.AuthorizationService;
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

@WebAppConfiguration
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class UserServiceTest {

    @Qualifier("userRepository")
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private AuthorizationService authService;

    @Qualifier("rulesetRepository")
    @Autowired
    private RulesetRepository rulesetRepository;

    @Test
    public void createUser() {
        userRepository.deleteAll();

        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");

        User createdUser = userService.createUser(testUser);

        Assert.assertNull(createdUser.getToken());
        Assert.assertEquals(createdUser.getStatus(), UserStatus.OFFLINE);
        Assert.assertEquals(createdUser, userRepository.findByUsername(createdUser.getUsername()));

        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test
    public void getUsers() {
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);

        Iterable<User> users = userService.getUsers();
        Iterator<User> iter = users.iterator();
        Assert.assertEquals(iter.next(), testUser);

        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test
    public void loginValidUser() {
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        User local = userService.loginUser("testUsername", "1234");

        Assert.assertEquals(local, testUser);
        Assert.assertEquals(local.getStatus(), UserStatus.ONLINE);
        Assert.assertNotNull(local.getToken());

        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test(expected = UserNotFoundExceptions.class)
    public void loginInvalidUsername() {
        userService.loginUser("invalidUser", "1234");
    }

    @Test(expected = PasswordNotValidException.class)
    public void loginInvalidPassword() {
        userRepository.deleteAll();

        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        userService.loginUser("testUsername", "invalidPassword");

        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test
    public void logoutValidToken() {
        userRepository.deleteAll();

        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);

        userService.loginUser("testUsername", "1234");
        Assert.assertNotNull(userRepository.findByUsername("testUsername").getToken());
        Assert.assertEquals(userRepository.findByUsername("testUsername").getStatus(), UserStatus.ONLINE);

        userService.logoutUser(userRepository.findByUsername("testUsername").getToken());
        Assert.assertEquals(userRepository.findByUsername("testUsername").getStatus(), UserStatus.OFFLINE);

        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test(expected = AuthenticationException.class)
    public void logoutInvalidToken() {
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        userService.loginUser("testUsername", "1234");

        Assert.assertNotNull(userRepository.findByUsername("testUsername").getToken());
        Assert.assertEquals(userRepository.findByUsername("testUsername").getStatus(), UserStatus.ONLINE);

        userService.logoutUser("SomeRandomTokenButForSureNotTheRightOne");
        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test
    public void getValidUserID() {
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        User createdUser = userService.createUser(testUser);

        Assert.assertEquals(userService.getUser(createdUser.getId().toString()), createdUser);

        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test(expected = UserNotFoundExceptions.class)
    public void getInvalidUserId() {
        userService.getUser("1");
    }

    @Test(expected = AuthenticationException.class)
    public void validateInvalidToken() {
        userRepository.deleteAll();
        authService.authorize("somerandomtokenbutforsurenottherightoneorthiswouldbecrazy");
    }

    @Test
    public void validateValidToken() {
        userRepository.deleteAll();
        Assert.assertNull(userRepository.findByUsername("testUsername"));

        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("somedateinmiliseconds");
        testUser.setPassword("password1234");
        userService.createUser(testUser);
        User local = userService.loginUser("testUsername", "password1234");
        authService.authorize(local.getToken());
    }

    @Test
    public void updateValidUser() {
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        User local = userService.loginUser("testUsername", "1234");

        User updatedUser = new User();
        updatedUser.setName("testNameUpdated");
        updatedUser.setUsername("testUsernameUpdated");
        //01-01-1999
        updatedUser.setBirthDay("915145200000");
        updatedUser.setPassword("1234");

        userService.updateUser(local.getId().toString(), updatedUser, local.getToken());

        local = userRepository.findById(local.getId()).orElse(null);
        Assert.assertEquals(local.getUsername(), updatedUser.getUsername());
        Assert.assertEquals(local.getName(), updatedUser.getName());
        Assert.assertEquals(local.getBirthDay(), updatedUser.getBirthDay());

        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        userRepository.delete(local);
        Assert.assertNull(userRepository.findByUsername("testUsernameUpdated"));
    }

    @Test(expected = AuthenticationException.class)
    public void updateUserWithInvalidToken() {
        userRepository.deleteAll();

        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);

        User otherUser = new User();
        otherUser.setName("OtherTestName");
        otherUser.setUsername("otherTestUsername");
        //01-01-1999
        otherUser.setBirthDay("915145200000");
        otherUser.setPassword("1234");
        userService.createUser(otherUser);

        String loggedInTestUserId = userService.loginUser("testUsername", "1234").getId().toString();
        String loggedInOtherTestUserToken = userService.loginUser("otherTestUsername", "1234").getToken();

        User updatedUser = new User();
        updatedUser.setName("testNameUpdated");
        updatedUser.setUsername("testUsernameUpdated");
        //01-01-1999
        updatedUser.setBirthDay("915145200000");
        updatedUser.setPassword("1234");

        userService.updateUser(loggedInTestUserId, updatedUser, loggedInOtherTestUserToken);

        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        userRepository.delete(otherUser);
        Assert.assertNull(userRepository.findByUsername("otherTestUsername"));
    }

    @Test(expected = UserExistingException.class)
    public void updateUserUsernameExisting() {
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);

        User otherUser = new User();
        otherUser.setName("otherTestName");
        otherUser.setUsername("otherTestUsername");
        //01-01-1999
        otherUser.setBirthDay("915145200000");
        otherUser.setPassword("1234");
        userService.createUser(otherUser);

        User loggedInTesUser = userService.loginUser("testUsername", "1234");

        User updatedUser = new User();
        updatedUser.setName("testNameUpdated");
        updatedUser.setUsername("otherTestUsername");
        //01-01-1999
        updatedUser.setBirthDay("915145200000");
        updatedUser.setPassword("1234");

        userService.updateUser(userRepository.findByUsername("testUsername").getId().toString(), updatedUser, loggedInTesUser.getToken());

        userService.logoutUser(loggedInTesUser.getToken());

        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
        userRepository.delete(otherUser);
        Assert.assertNull(userRepository.findByUsername("otherTestUsername"));
        userRepository.delete(updatedUser);
        Assert.assertNull(userRepository.findByUsername("otherTestUsername"));
    }

    @Test
    public void setRulesetOfUser() {
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        userService.loginUser("testUsername", "1234");
        testUser = userRepository.findByUsername("testUsername");

        Ruleset ruleset = new Ruleset(testUser);
        userService.setRulesetOfUser(testUser.getId(), ruleset);
        ruleset = testUser.getRuleset();

        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }

    @Test
    public void removeRuleset() {
        User testUser = new User();
        testUser.setName("testName");
        testUser.setUsername("testUsername");
        testUser.setBirthDay("946681200000");
        testUser.setPassword("1234");
        userService.createUser(testUser);
        userService.loginUser("testUsername", "1234");
        testUser = userRepository.findByUsername("testUsername");

        Ruleset ruleset = new Ruleset(testUser);
        userService.setRulesetOfUser(testUser.getId(), ruleset);
        ruleset = testUser.getRuleset();

        userService.removeRuleset(testUser.getId());

        userRepository.delete(testUser);
        Assert.assertNull(userRepository.findByUsername("testUsername"));
    }
}
