package ch.uzh.ifi.seal.soprafs19.entity.godCards;

import ch.uzh.ifi.seal.soprafs19.entity.Game;
import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import ch.uzh.ifi.seal.soprafs19.entity.User;

import javax.persistence.Entity;

@Entity
public class Atlas extends Ruleset {
    public Atlas(User ownerUser){ super(ownerUser);}
    public Atlas(){super();}

    @Override
    protected void computeBuildingActions(Game state, int row, int column) {
        applyBuildingFilter(state, row, column, computeBuildingFilter(), true, null);
    }
}
