package ch.uzh.ifi.seal.soprafs19.entity.godCards;

import ch.uzh.ifi.seal.soprafs19.dto.incoming.Move;
import ch.uzh.ifi.seal.soprafs19.entity.Game;
import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import ch.uzh.ifi.seal.soprafs19.entity.User;

import javax.persistence.Entity;

@Entity
public class Apollo extends Ruleset {
    public Apollo(){super();}
    public Apollo(User ownerUser){super(ownerUser);}
    @Override
    protected void computeMovementActions(Game state, int row, int column) {
        applyMovementFilter(state, row, column, computeMovementFilter(state, getMaxRaise(), getMaxLower(), row, column), true, null);
    }

    @Override
    protected void checkWinner(Game state, Move move, Move lastMove) {
        super.checkWinner(state, move, lastMove);
        if (state.getWorkerOwner()[move.getRow()][move.getColumn()] != null){
            state.setWorker(state.getWorkerOwner()[move.getRow()][move.getColumn()], state.getWorkerType()[move.getRow()][move.getColumn()], lastMove.getRow(), lastMove.getColumn());
        }
    }
}
