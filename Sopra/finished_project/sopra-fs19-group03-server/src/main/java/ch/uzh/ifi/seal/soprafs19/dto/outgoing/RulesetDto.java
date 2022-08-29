package ch.uzh.ifi.seal.soprafs19.dto.outgoing;

import ch.uzh.ifi.seal.soprafs19.constant.Action;
import ch.uzh.ifi.seal.soprafs19.constant.ObjectType;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.Message;

import java.io.Serializable;

public class RulesetDto implements Serializable, Message {
    private ObjectType[][] actions;
    private Action actionType;
    private boolean skippable;

    public ObjectType[][] getActions() {
        return actions;
    }

    public void setActions(ObjectType[][] actions) {
        this.actions = actions;
    }

    public Action getActionType() {
        return actionType;
    }

    public void setActionType(Action actionType) {
        this.actionType = actionType;
    }

    public void setAction(int row, int column, ObjectType type){
        this.actions[row][column] = type;
    }

    public boolean isSkippable() {
        return skippable;
    }

    public void setSkippable(boolean skippable) {
        this.skippable = skippable;
    }
}
