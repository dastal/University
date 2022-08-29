package ch.uzh.ifi.seal.soprafs19.entity.godCards;

import ch.uzh.ifi.seal.soprafs19.dto.incoming.Move;
import ch.uzh.ifi.seal.soprafs19.entity.Game;
import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import ch.uzh.ifi.seal.soprafs19.entity.User;

import javax.persistence.Entity;

@Entity
public class Minotaur extends Ruleset {

    public Minotaur(User ownerUser){
        super(ownerUser);
    }
    public Minotaur(){super();}

    @Override
    protected void handleMoveMove(Move move, Game game) {
        if (!handleInitialTurn(game))
        { //normal move -> unset Worker and check if Move is a winning move
            Move lastMove = unsetWorker(game, user.getId(), move.getType());
            checkWinner(game, move, lastMove); //has to happen before setWorker
            nextTurn(move, lastMove, game);
            //push enemy back
            if(game.getWorkerOwner()[move.getRow()][move.getColumn()] != null) {
                int pushedRow = 2 * move.getRow() - lastMove.getRow(), pushedColumn = 2 * move.getColumn() - lastMove.getColumn();
                game.setWorker(game.getWorkerOwner()[move.getRow()][move.getColumn()], game.getWorkerType()[move.getRow()][move.getColumn()], pushedRow, pushedColumn);
            }
            allowedWorker = move.getType();
        }
        game.setWorker(user.getId(), move.getType(), move.getRow(), move.getColumn());
    }

    @Override
    protected void computeMovementActions(Game state, int row, int column) {
        AdditionalTest checkIfPushPossible = new AdditionalTest() {
            @Override
            public boolean apply(Game state, int row, int column, int targetRow, int targetColumn) {
                int pushedRow = 2 * targetRow - row, pushedColumn = 2 * targetColumn - column;
                return state.getWorkerOwner()[targetRow][targetColumn] == null || //either field is empty OR
                        (hasElementAt(pushedColumn, pushedRow) && //field not out of playfield
                        state.getWorkerOwner()[pushedRow][pushedColumn] == null && //pushed field is empty
                            state.getCupola()[pushedRow][pushedColumn] == 0); //pushed field does not have a cupola on it
            }
        };
        applyMovementFilter(state, row, column, computeMovementFilter(state, getMaxRaise(), getMaxLower(), row, column), true, checkIfPushPossible);
    }
}
