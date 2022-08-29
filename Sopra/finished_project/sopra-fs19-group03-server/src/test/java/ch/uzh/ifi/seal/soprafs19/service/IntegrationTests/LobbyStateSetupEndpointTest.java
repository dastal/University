package ch.uzh.ifi.seal.soprafs19.service.IntegrationTests;

import ch.uzh.ifi.seal.soprafs19.dto.outgoing.LobbyContextDto;
import ch.uzh.ifi.seal.soprafs19.repository.LobbyContextRepository;
import ch.uzh.ifi.seal.soprafs19.repository.UserRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.concurrent.CompletableFuture;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class LobbyStateSetupEndpointTest {

    @LocalServerPort
    private int port;

    private CompletableFuture<Iterable> completableFutureUsers;

    private CompletableFuture<Iterable> completableFutureLobbies;

    private CompletableFuture<LobbyContextDto> completableFutureSubscribeTestLobby;

    private String getBaseUrl() {
        return "http://localhost:" + port;
    }

    @Qualifier("lobbyContextRepository")
    @Autowired
    private LobbyContextRepository lobbyContextRepository;

    @Qualifier("userRepository")
    @Autowired
    private UserRepository userRepository;

    @Test
    public void LobbySetup() throws Exception {

    }
}
