package ch.uzh.ifi.seal.soprafs19.repository;

import ch.uzh.ifi.seal.soprafs19.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userRepository")
public interface UserRepository extends CrudRepository<User, Long> {
	User findByName(String name);
	User findByUsername(String username);
	User findByToken(String token);
	@Override
	List<User> findAll();
}


//Crud Repository