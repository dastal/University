package ch.uzh.ifi.seal.soprafs19.entity.godCards;

import ch.uzh.ifi.seal.soprafs19.constant.Action;
import ch.uzh.ifi.seal.soprafs19.constant.ObjectType;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.Move;
import ch.uzh.ifi.seal.soprafs19.entity.Game;
import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import ch.uzh.ifi.seal.soprafs19.entity.User;

import javax.persistence.Entity;

@Entity
public class Hephaestus extends Ruleset {

    private boolean secondBuildStage;
    private int allowedRow;
    private int allowedColumn; //-1 if everything is allowed

    public Hephaestus(User ownerUser){
        super(ownerUser);
        secondBuildStage = false;
        allowedColumn = -1;
        allowedRow = -1; // everything is allowed
    }
    public Hephaestus(){super();}

    @Override
    protected void nextTurn(Move move, Move lastMove, Game game){
        if (actionType == Action.BUILD) {
            if (secondBuildStage || move.getType() == ObjectType.CUPOLA || game.getBuildings()[move.getRow()][move.getColumn()] == 3) {
                secondBuildStage = false;
                this.actionType = Action.MOVE;
                game.nextUser();
                allowedColumn = -1;
                allowedRow = -1;
                skippable = false;
            }
            else {
                secondBuildStage = true;
                allowedColumn = move.getColumn();
                allowedRow = move.getRow();
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
                if (allowedRow == -1 || (targetRow == allowedRow && targetColumn == allowedColumn))
                    return true;
                else return false;
            }
        };
        applyBuildingFilter(state, row, column, computeBuildingFilter(), false, checkIfAlreadyBuilt, !secondBuildStage);
    }
}
