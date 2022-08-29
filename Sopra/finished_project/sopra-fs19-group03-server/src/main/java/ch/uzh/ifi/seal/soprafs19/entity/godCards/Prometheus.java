package ch.uzh.ifi.seal.soprafs19.entity.godCards;

import ch.uzh.ifi.seal.soprafs19.constant.Action;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.Move;
import ch.uzh.ifi.seal.soprafs19.entity.Game;
import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import ch.uzh.ifi.seal.soprafs19.entity.User;

import javax.persistence.Entity;

@Entity
public class Prometheus extends Ruleset {

    private boolean firstAction;

    public Prometheus(User ownerUser){
        super(ownerUser);
        firstAction = false;
        skippable = true;
    }
    public Prometheus(){super();}

    @Override
    protected void nextTurn(Move move, Move lastMove, Game game) {
        if (actionType == Action.BUILD){
            if (move.isSkip()) {
                firstAction = false;
                skippable = false;
                actionType = Action.MOVE;
            } else if (firstAction) {
                firstAction = false;
                skippable = false;
                setMaxRaise(0);
                actionType = Action.MOVE;
            } else {
                resetParamsToDefault();
                skippable = true;
                firstAction = true;
                actionType = Action.BUILD;
                game.nextUser();
            }
        }else{
            actionType = Action.BUILD;
        }
    }

    @Override
    protected boolean handleInitialTurn(Game game) {
        if (actionType.equals(Action.INITIALWORKER1)) { //initial Worker -> winner must not be checked
            actionType = Action.INITIALWORKER2;
            return true;
        } else if (actionType.equals(Action.INITIALWORKER2)) { //initial Worker -> winner must not be checked
            actionType = Action.BUILD;
            game.nextUser();
            return true;
        }
        return false;
    }
}
