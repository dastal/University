package ch.uzh.ifi.seal.soprafs19.repository;

import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("rulesetRepository")
public interface RulesetRepository extends CrudRepository<Ruleset, Long> {
}

