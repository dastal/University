package ch.uzh.ifi.seal.soprafs19.entity.godCards;

import ch.uzh.ifi.seal.soprafs19.dto.incoming.Move;
import ch.uzh.ifi.seal.soprafs19.entity.Game;
import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import ch.uzh.ifi.seal.soprafs19.entity.User;

import javax.persistence.Entity;

@Entity
public class Pan extends Ruleset {
    public Pan(User ownerUser){ super(ownerUser);}
    public Pan(){super();}

    @Override
    protected void checkWinner(Game state, Move move, Move lastMove) {
        if (state.getBuildings()[move.getRow()][move.getColumn()] == 3 || state.getBuildings()[lastMove.getRow()][lastMove.getColumn()]-state.getBuildings()[move.getRow()][move.getColumn()] >= 2) {
            state.setWinner(user.getId());
        }
    }
    
}
