package ch.uzh.ifi.seal.soprafs19.repository;

import ch.uzh.ifi.seal.soprafs19.entity.LobbyState;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("lobbyRepository")
public interface LobbyStateRepository extends CrudRepository<LobbyState, Long> {
}

