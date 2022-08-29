package ch.uzh.ifi.seal.soprafs19.dto.incoming;

import ch.uzh.ifi.seal.soprafs19.constant.ObjectType;

import java.io.Serializable;

public class Move implements Serializable {
    private int row;
    private int column;
    private ObjectType type;
    private boolean skip;
    public Move(){super();}
    public Move(int row, int column, boolean skip) {setRow(row);
    setColumn(column);
    setSkip(skip);}

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }

    public ObjectType getType() {
        return type;
    }

    public void setType(ObjectType type) {
        this.type = type;
    }

    public boolean isSkip() {
        return skip;
    }

    public void setSkip(boolean skip) {
        this.skip = skip;
    }
}
