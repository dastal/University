package ch.uzh.ifi.seal.soprafs19.entity.godCards;

import ch.uzh.ifi.seal.soprafs19.constant.Action;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.Move;
import ch.uzh.ifi.seal.soprafs19.entity.Game;
import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import ch.uzh.ifi.seal.soprafs19.entity.User;

import javax.persistence.Entity;

@Entity
public class Artemis extends Ruleset {

    private boolean secondMoveStage;
    private int forbiddenRow;
    private int forbiddenColumn; // -1 nothing is forbidden
    public Artemis(){super();}

    public Artemis(User ownerUser) {
        super(ownerUser);
        secondMoveStage = false;
        forbiddenColumn = -1;
        forbiddenRow = -1; // -1 nothing is forbidden
    }


    @Override
    protected void nextTurn(Move move, Move lastMove, Game game) {
        if (actionType == Action.MOVE) {
            if (secondMoveStage) {
                secondMoveStage = false;
                this.actionType = Action.BUILD;
                forbiddenColumn = -1;
                forbiddenRow = -1;
                skippable = false;
            } else {
                secondMoveStage = true;
                forbiddenColumn = lastMove.getColumn();
                forbiddenRow = lastMove.getRow();
                skippable = true;
            }
        } else {
            actionType = Action.MOVE;
            game.nextUser();
        }
        resetParamsToDefault();
    }

    @Override
    protected void computeMovementActions(Game state, int row, int column) {
        AdditionalTest checkIfAlreadyMoved = new AdditionalTest() {
            @Override
            public boolean apply(Game state, int row, int column, int targetRow, int targetColumn) {
                if (targetRow == forbiddenRow && targetColumn == forbiddenColumn)
                    return false;
                else return true;
            }
        };
        applyMovementFilter(state, row, column, computeMovementFilter(state, 1, -1, row, column), false, checkIfAlreadyMoved);
    }
}
