package ch.uzh.ifi.seal.soprafs19.service;

import ch.uzh.ifi.seal.soprafs19.constant.UserStatus;
import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import ch.uzh.ifi.seal.soprafs19.entity.User;
import ch.uzh.ifi.seal.soprafs19.exceptions.AuthenticationException;
import ch.uzh.ifi.seal.soprafs19.exceptions.PasswordNotValidException;
import ch.uzh.ifi.seal.soprafs19.exceptions.UserExistingException;
import ch.uzh.ifi.seal.soprafs19.exceptions.UserNotFoundExceptions;
import ch.uzh.ifi.seal.soprafs19.repository.RulesetRepository;
import ch.uzh.ifi.seal.soprafs19.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserService {

    private final Logger log = LoggerFactory.getLogger(UserService.class);

    private final UserRepository userRepository;

    private final AuthorizationService authService;

    private final RulesetRepository rulesetRepository;

    private final LobbyService lobbyService;

    @Autowired
    public UserService(@Qualifier("userRepository") UserRepository userRepository, AuthorizationService authorizationService,@Qualifier("rulesetRepository") RulesetRepository rulesetRepository, @Qualifier("lobbyService") LobbyService lobbyService) {
        this.userRepository = userRepository;
        this.authService = authorizationService;
        this.rulesetRepository = rulesetRepository;
        this.lobbyService = lobbyService;
    }

    public List<User> getUsers() {
        return this.userRepository.findAll();
    }

    public User loginUser(String username, String password) {
        User temp = this.userRepository.findByUsername(username);
        if (temp == null)
            throw new UserNotFoundExceptions(username);
        if (temp.getPassword().equals(password)) {
            authService.startSession(temp);
            log.debug("User {} logged in!", username);
            return temp;
        }
        else throw new PasswordNotValidException(username);
    }

    public String logoutUser(String token) {
        User local = authService.authorize(token);
        if (local.getLobbyToken() != null)
            lobbyService.leaveLobbyContext(local, local.getLobbyToken());
        authService.endSession(local);
        return "logout successful!";
    }

    public User createUser(User newUser) {
        if (userRepository.findByUsername(newUser.getUsername()) != null)
            throw new UserExistingException(newUser.getUsername());
        newUser.setStatus(UserStatus.OFFLINE);
        newUser.setCreationDate(Long.toString(System.currentTimeMillis()));
        newUser.setWins(0);
        newUser.setGames(0);
        userRepository.save(newUser);
        log.debug("Created Information for User: {}", newUser);
        return newUser;
    }

    public User getUser(String id) {
        return getUser(Long.parseLong(id));
    }

    public User getUser(Long id){
        User temp = this.userRepository.findById(id).orElse(null);
        if (temp == null)
            throw new UserNotFoundExceptions("User not found!");
        return temp;
    }
    public void updateUser(String id, User updatedUser, String token) {
        User local = authService.authorize(token);
        if (!local.getId().toString().equals(id))
            throw new AuthenticationException("Token and id do not match!");
        User temp = userRepository.findByUsername(updatedUser.getUsername());
        if (temp != null && !temp.getUsername().equals(local.getUsername()))
            throw new UserExistingException(updatedUser.getUsername());
        local.setName(updatedUser.getName());
        local.setUsername(updatedUser.getUsername());
        local.setBirthDay(updatedUser.getBirthDay());
        userRepository.save(local);
    }
    public void setRulesetOfUser(Long userId, Ruleset ruleset){
        User local = userRepository.findById(userId).orElseThrow();
        rulesetRepository.save(ruleset);
        local.setRuleset(ruleset);
        userRepository.save(local);
    }

    public User removeRuleset(Long userId){
        User local = userRepository.findById(userId).orElseThrow();
        Ruleset oldRuleset = local.getRuleset();
        local.setRuleset(null);
        rulesetRepository.delete(oldRuleset);
        userRepository.save(local);
        return local;
    }
    public User createTestUser() {
        User temp = userRepository.findByUsername("asdf");
        if (temp == null) {
            User newUser = new User();
            newUser.setName("TestUser");
            newUser.setUsername("asdf");
            newUser.setPassword("asdf");
            newUser.setBirthDay(Long.toString(System.currentTimeMillis() - 10000));
            createUser(newUser);
            User newUser2 = new User();
            newUser2.setName("TestUser2");
            newUser2.setUsername("du");
            newUser2.setPassword("du");
            newUser2.setBirthDay(Long.toString(System.currentTimeMillis() - 20000));
            createUser(newUser2);
            temp = userRepository.findByUsername("asdf");
        }
        return temp;
    }

    public void updateUser(User update){
        userRepository.save(update);
    }
    public User loginTestUser() {
        createTestUser();
        return this.loginUser("asdf", "asdf");
    }
    public User loginTestUser2() {
        createTestUser();
        return this.loginUser("du", "asdf");
    }
}
