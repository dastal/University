package ch.uzh.ifi.seal.soprafs19.repository;

import ch.uzh.ifi.seal.soprafs19.constant.LobbyStatus;
import ch.uzh.ifi.seal.soprafs19.entity.LobbyContext;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("lobbyContextRepository")
public interface LobbyContextRepository extends CrudRepository<LobbyContext, Long> {
   LobbyContext findByLobbyName(String name);
   LobbyContext findByLobbyToken(String token);

   List<LobbyContext> findByStateType(LobbyStatus state);
   @Override
   List<LobbyContext> findAll();
}

