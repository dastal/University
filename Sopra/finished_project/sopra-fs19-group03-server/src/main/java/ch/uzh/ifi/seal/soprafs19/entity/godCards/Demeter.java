package ch.uzh.ifi.seal.soprafs19.entity.godCards;

import ch.uzh.ifi.seal.soprafs19.constant.Action;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.Move;
import ch.uzh.ifi.seal.soprafs19.entity.Game;
import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import ch.uzh.ifi.seal.soprafs19.entity.User;

import javax.persistence.Entity;

@Entity
public class Demeter extends Ruleset {

    private boolean secondBuildStage;
    private int forbiddenRow;
    private int forbiddenColumn; // -1 nothing is forbidden
    public Demeter(){super();}

    public Demeter(User ownerUser){
        super(ownerUser);
        secondBuildStage = false;
        forbiddenColumn = -1;
        forbiddenRow = -1; // -1 nothing is forbidden
    }

    @Override
    protected void nextTurn(Move move, Move lastMove,  Game game){
        if (actionType == Action.BUILD) {
            if (secondBuildStage) {
                secondBuildStage = false;
                this.actionType = Action.MOVE;
                game.nextUser();
                forbiddenColumn = -1;
                forbiddenRow = -1;
                skippable = false;
            }
            else {
                secondBuildStage = true;
                forbiddenColumn = move.getColumn();
                forbiddenRow = move.getRow();
                skippable = true;
            }
        }
        else actionType = Action.BUILD;
        resetParamsToDefault();
    }

    @Override
    protected void computeBuildingActions(Game state, int row, int column) {
        AdditionalTest checkIfAlreadyBuilt = new AdditionalTest() {
            @Override
            public boolean apply(Game state, int row, int column, int targetRow, int targetColumn) {
                if (targetRow == forbiddenRow && targetColumn == forbiddenColumn)
                    return false;
                else return true;
            }
        };
        applyBuildingFilter(state, row, column, computeBuildingFilter(), false, checkIfAlreadyBuilt);
    }
}
