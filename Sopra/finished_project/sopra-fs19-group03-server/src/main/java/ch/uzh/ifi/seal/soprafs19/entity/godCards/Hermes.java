package ch.uzh.ifi.seal.soprafs19.entity.godCards;

import ch.uzh.ifi.seal.soprafs19.constant.Action;
import ch.uzh.ifi.seal.soprafs19.constant.ObjectType;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.Move;
import ch.uzh.ifi.seal.soprafs19.entity.Game;
import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import ch.uzh.ifi.seal.soprafs19.entity.User;

import javax.persistence.Entity;

@Entity
public class Hermes extends Ruleset {

    ObjectType previousWorker;

    public Hermes (User ownerUser){
        super(ownerUser);
    }
    public Hermes(){super();}

    @Override
    protected void nextTurn(Move move, Move lastMove, Game game){
        if (actionType == Action.MOVE){
             if (move.isSkip() || game.getBuildings()[move.getRow()][move.getColumn()] != game.getBuildings()[lastMove.getRow()][lastMove.getColumn()]){
                 previousWorker = null;
                 skippable = false;
                 actionType = Action.BUILD;
             }else{
                 previousWorker = move.getType();
                 setMaxRaise(0);
                 setMaxLower(0);
             }
        }else{
            actionType = Action.MOVE;
            resetParamsToDefault();
            skippable = true;
            game.nextUser();
        }
    }

    @Override
    protected boolean handleInitialTurn(Game game) {
        boolean res = super.handleInitialTurn(game);
        if (actionType == Action.MOVE)
            skippable = true;
        return res;
    }

    @Override
    protected void computeMovementActions(Game state, int row, int column) {
        if (previousWorker == null || state.getWorkerType()[row][column] == previousWorker) {
            super.computeMovementActions(state, row, column);
        }
    }
}
