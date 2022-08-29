package ch.uzh.ifi.seal.soprafs19.service;

import ch.uzh.ifi.seal.soprafs19.constant.UserStatus;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.AuthorizationCredentials;
import ch.uzh.ifi.seal.soprafs19.entity.User;
import ch.uzh.ifi.seal.soprafs19.exceptions.AuthenticationException;
import ch.uzh.ifi.seal.soprafs19.repository.LobbyContextRepository;
import ch.uzh.ifi.seal.soprafs19.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
@Transactional
public class AuthorizationService {
    public final UserRepository userRepository;
    public final LobbyContextRepository lobbyContextRepository;

    @Autowired
    public AuthorizationService(@Qualifier("userRepository") UserRepository userRepository, @Qualifier("lobbyContextRepository") LobbyContextRepository lobbyContextRepository) {
        this.userRepository = userRepository;
        this.lobbyContextRepository = lobbyContextRepository;
    }

    public User authorize(AuthorizationCredentials authorizationCredentials) {
        User local = userRepository.findById(authorizationCredentials.getId()).orElse(null);
        if (local == null || !local.getToken().equals(authorizationCredentials.getToken()))
            throw new AuthenticationException("User Authorization is not valid!");
        return local;
    }

    public User authorize(String token) {
        User local = userRepository.findByToken(token);
        if (local == null)
            throw new AuthenticationException("User Authorization is not valid!");
        return local;
    }

    public User authorize(String sessionToken, String lobbyToken){
        User local = this.authorize(sessionToken);
        if(local.getLobbyToken() != null && local.getLobbyToken().equals(lobbyToken))
            return local;
        throw new AuthenticationException("User is not authorized for this lobby!");
    }


    public void startSession(User user){
        user.setToken(UUID.randomUUID().toString());
        user.setStatus(UserStatus.ONLINE);
    }

    public void endSession(User user) {
        user.setToken(null);
        user.setStatus(UserStatus.OFFLINE);
    }
}
