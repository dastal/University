package ch.uzh.ifi.seal.soprafs19.entity;

import ch.uzh.ifi.seal.soprafs19.constant.Action;
import ch.uzh.ifi.seal.soprafs19.constant.ObjectType;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.Move;
import ch.uzh.ifi.seal.soprafs19.exceptions.InvalidMoveException;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Ruleset implements Serializable {

    @FunctionalInterface
    protected interface AdditionalTest {
        boolean apply(Game state, int row, int column, int targetRow, int targetColumn);
    }

    @Id
    @GeneratedValue
    protected Long id;

    @Lob
    @Column
    protected Action actionType;


    @OneToOne(mappedBy = "ruleset")
    protected User user;

    @Lob
    protected ObjectType[][] actions;

    @Column
    protected boolean skippable;

    @Column
    private int maxRaise;

    @Column
    protected ObjectType allowedWorker;

    @Column
    private int maxLower;

    @Transient
    protected boolean hasOptions;

    public Ruleset() {
        super();
    }

    public Ruleset(User ownerUser) {
        actionType = Action.INITIALWORKER1;
        allowedWorker = ObjectType.BOTH;
        resetParamsToDefault();
        user = ownerUser;
    }

    protected void resetParamsToDefault() {
        maxRaise = 1;
        maxLower = -3;
    }

    public void resetToDefaultMove() {
        resetParamsToDefault();
        actionType = Action.MOVE;
    }

    public void setMove(Move move, Game game) {
        if (actions != null) {
            if (move.isSkip()) {
                if (skippable) nextTurn(move, null, game);
                else throw new InvalidMoveException("Skip not allowed!");
                return;
            } else if (actions[move.getRow()][move.getColumn()] == move.getType() || (actions[move.getRow()][move.getColumn()] == ObjectType.BOTH &&  //If BOTH
                    (actionType == Action.MOVE && (move.getType() == ObjectType.WORKER1 || move.getType() == ObjectType.WORKER2) || //if type MOVE either Worker1 or Worker2
                            (actionType == Action.BUILD && (move.getType() == ObjectType.CUPOLA || move.getType() == ObjectType.BUILDING))  //if type BUILD either Cupola or Building
                    ))) {
                actions = null;
                if (move.getType() == null)
                    throw new InvalidMoveException("Type can not be null");
                switch (move.getType()) {
                    case CUPOLA:
                    case BUILDING:
                        handleBuildMove(move, game);
                        return;
                    case WORKER1:
                    case WORKER2:
                        handleMoveMove(move, game);
                        return;
                    default:
                        throw new InvalidMoveException();
                }
            }
        }
        throw new InvalidMoveException();
    }

    public void computeActions(Game state) {
        //initialize objects
        this.actions = new ObjectType[5][5];
        hasOptions = true;

        //statements for the workerplacements in the beginning
        if (actionType.equals(Action.INITIALWORKER1)) {
            computeInitialActions(state, ObjectType.WORKER1);
        } else if (actionType.equals(Action.INITIALWORKER2)) {
            computeInitialActions(state, ObjectType.WORKER2);
        } else //statements for calculating actions
        {
            hasOptions = false;
            for (int row = 0; row < 5; row++) {
                for (int column = 0; column < 5; column++) {
                    //Check if the current idx containts a figure of the user and if this workertype is allowed
                    if ((state.getWorkerOwner()[row][column] != null) && state.getWorkerOwner()[row][column].equals(user.getId()) &&
                            (allowedWorker == ObjectType.BOTH || state.getWorkerType()[row][column] == allowedWorker)) {
                        switch (actionType) {
                            case MOVE:
                                computeMovementActions(state, row, column);
                                break;
                            case BUILD:
                                computeBuildingActions(state, row, column);
                                break;
                            default:
                                throw new IllegalStateException();
                        }
                    }
                }
            }
            if (!hasOptions) {
                switch (actionType) {
                    case MOVE:
                        state.nextUser();
                        break;
                    case BUILD:
                        nextTurn(new Move(-1, -1, false), null, state);
                    default:
                        throw new IllegalStateException();
                }
            }
        }
    }

    protected void nextTurn(Move move, Move lastMove, Game game) {
        if (actionType == Action.BUILD)
            game.nextUser();
        actionType = actionType == Action.MOVE ? Action.BUILD : Action.MOVE;
        resetParamsToDefault();
    }

    protected boolean handleInitialTurn(Game game) {
        if (actionType.equals(Action.INITIALWORKER1)) { //initial Worker -> winner must not be checked
            actionType = Action.INITIALWORKER2;
            return true;
        } else if (actionType.equals(Action.INITIALWORKER2)) { //initial Worker -> winner must not be checked
            actionType = Action.MOVE;
            game.nextUser();
            return true;
        }
        return false;
    }

    protected void handleBuildMove(Move move, Game game) {
        switch (move.getType()) {
            case BUILDING:
                game.raiseBuilding(move.getRow(), move.getColumn());
                break;
            case CUPOLA:
                game.buildCupola(move.getRow(), move.getColumn());
                break;
            default:
                throw new IllegalStateException("Not a building move!");
        }
        allowedWorker = ObjectType.BOTH;
        nextTurn(move, null, game);
    }

    protected void handleMoveMove(Move move, Game game) {
        if (!handleInitialTurn(game)) { //normal move -> unset Worker and check if Move is a winning move
            Move lastMove = unsetWorker(game, user.getId(), move.getType());
            checkWinner(game, move, lastMove); //has to happen before setWorker
            nextTurn(move, lastMove, game);
            allowedWorker = move.getType();
        }
        game.setWorker(user.getId(), move.getType(), move.getRow(), move.getColumn());
    }

    protected void checkWinner(Game state, Move move, Move lastMove) {
        if (state.getBuildings()[move.getRow()][move.getColumn()] == 3) {
            state.setWinner(user.getId());
        }
    }

    protected Move unsetWorker(Game state, Long userId, ObjectType workerType) {
        Move lastMove = null;
        for (int row = 0; row < 5; row++) {
            for (int column = 0; column < 5; column++) {
                if (state.getWorkerOwner()[row][column] != null && state.getWorkerOwner()[row][column].equals(userId) && state.getWorkerType()[row][column] == workerType) {
                    lastMove = new Move();
                    lastMove.setColumn(column);
                    lastMove.setRow(row);
                    lastMove.setType(workerType);
                    state.setWorker(null, null, row, column);
                }
            }
        }
        if (lastMove == null)
            throw new IllegalStateException("Workerposition not found!");
        return lastMove;
    }

    protected void computeInitialActions(Game state, ObjectType worker) {
        for (int row = 0; row < 5; row++) {
            for (int column = 0; column < 5; column++) {
                if (state.getWorkerOwner()[row][column] == null) {
                    this.actions[row][column] = worker;
                }
            }
        }
    }

    //computes a filter on a specific point for movement which can be applied on a matrix
    protected int[][] computeMovementFilter(Game state, int maxRaise, int maxLower, int row, int column) {
        int[][] moveFilter = { //1 means a valid move
                {1, 1, 1},
                {1, 0, 1},
                {1, 1, 1}
        };
        int filterCenter = moveFilter.length / 2;

        for (int filterRow = 0; filterRow < moveFilter.length; filterRow++) {
            for (int filterColumn = 0; filterColumn < moveFilter.length; filterColumn++) {
                int targetRow = row - (filterCenter - filterRow), targetColumn = column - (filterCenter - filterColumn);
                if (hasElementAt(targetColumn, targetRow) && moveFilter[filterRow][filterColumn] == 1) {
                        int heightDiff = state.getBuildings()[targetRow][targetColumn] - state.getBuildings()[row][column];
                        if (heightDiff > maxRaise || heightDiff < maxLower)
                            moveFilter[filterRow][filterColumn] = 0;
                }
            }
        }
        return moveFilter;
    }

    //applies a MovementFilter on its actions matrix
    protected void applyMovementFilter(Game state, int row, int column, int[][] movementFilter, boolean ignoreEnemies, AdditionalTest additionalTest) {
        assert movementFilter.length % 2 == 1 && movementFilter[0].length % 2 == 1 && movementFilter.length == movementFilter[0].length; //check that filter is of uneven*uneven (center needed!)
        int filterCenter = movementFilter.length / 2;

        for (int filterRow = 0; filterRow < movementFilter.length; filterRow++) {
            for (int filterColumn = 0; filterColumn < movementFilter.length; filterColumn++) {
                int targetRow = row - (filterCenter - filterRow), targetColumn = column - (filterCenter - filterColumn);
                if (hasElementAt(targetColumn, targetRow) &&
                    //Check if Filter allows movement AND if theres a cupola AND if the target row is empty or if we can ignore enemies
                    movementFilter[filterRow][filterColumn] == 1 && state.getCupola()[targetRow][targetColumn] == 0 && (state.getWorkerOwner()[targetRow][targetColumn] == null || (ignoreEnemies && !state.getWorkerOwner()[targetRow][targetColumn].equals(user.getId()))) &&
                        //Check for additional Tests
                        (additionalTest == null || additionalTest.apply(state, row, column, targetRow, targetColumn))) {
                            //Check if an action is already added, if second worker is allowed too, state BOTH
                            if (this.actions[targetRow][targetColumn] == null) {
                                this.actions[targetRow][targetColumn] = state.getWorkerType()[row][column];
                                hasOptions = true;
                            } else if (actions[targetRow][targetColumn] != state.getWorkerType()[row][column]) {
                                this.actions[targetRow][targetColumn] = ObjectType.BOTH;
                                hasOptions = true;
                            }
                        }

                }
            }
        }


    //computes filter and applies it on Movementtable, should be overwriten for most Godcards for parameter tuning
    protected void computeMovementActions(Game state, int row, int column) {
        applyMovementFilter(state, row, column, computeMovementFilter(state, getMaxRaise(), getMaxLower(), row, column), false, null);
    }

    //computes a filter on a specific point for movement which can be applied on a matrix
    protected int[][] computeBuildingFilter() {
        int[][] buildingFilter = { //1 means a valid build
                {1, 1, 1},
                {1, 0, 1},
                {1, 1, 1}
        };
        return buildingFilter;
    }

    //applies a BuildingFilter on its actions matrix
    protected void applyBuildingFilter(Game state, int row, int column, int[][] buildingFilter, boolean ignoreCupolaLevel, AdditionalTest additionalTest) {
        applyBuildingFilter(state, row, column, buildingFilter, ignoreCupolaLevel, additionalTest, true);
    }

    protected void applyBuildingFilter(Game state, int row, int column, int[][] buildingFilter, boolean ignoreCupolaLevel, AdditionalTest additionalTest, boolean allowCupola) {
        assert (buildingFilter.length % 2 == 1 && buildingFilter[0].length % 2 == 1 && buildingFilter.length == buildingFilter[0].length); //check that filter is of uneven*uneven (center needed!)

        int filterCenter = buildingFilter.length / 2;

        for (int filterRow = 0; filterRow < buildingFilter.length; filterRow++) {
            for (int filterColumn = 0; filterColumn < buildingFilter.length; filterColumn++) {
                int targetRow = row - (filterCenter - filterRow), targetColumn = column - (filterCenter - filterColumn);
                if (hasElementAt(targetColumn, targetRow) &&
                    //Check if Filter allows movement and if the target has no player on it
                    buildingFilter[filterRow][filterColumn] == 1 && (state.getWorkerOwner()[targetRow][targetColumn] == null) &&
                        //Check if an action is already added AND if theres no cupola AND if the additional tests are valid
                        actions[targetRow][targetColumn] == null && state.getCupola()[targetRow][targetColumn] != 1 &&
                                (additionalTest == null || additionalTest.apply(state, row, column, targetRow, targetColumn))) {
                            //Check which Building type is possible
                            if (state.getBuildings()[targetRow][targetColumn] == 3) {
                                if (allowCupola) {
                                    actions[targetRow][targetColumn] = ObjectType.CUPOLA;
                                    hasOptions = true;
                                }
                            } else if (ignoreCupolaLevel) {
                                actions[targetRow][targetColumn] = ObjectType.BOTH;
                                hasOptions = true;
                            } else {
                                actions[targetRow][targetColumn] = ObjectType.BUILDING;
                                hasOptions = true;
                            }
                        }


            }
        }
    }

    //computes filter and applies it on Movementtable, should be overwritten for most Godcards for parameter tuning
    protected void computeBuildingActions(Game state, int row, int column) {
        applyBuildingFilter(state, row, column, computeBuildingFilter(), false, null);
    }

    protected boolean hasElementAt(int col, int row) {
        return row >= 0 && row < 5 && col >= 0 && col < 5;
    }

    public Action getActionType() {
        return actionType;
    }

    public boolean isSkippable() {
        return skippable;
    }

    public ObjectType[][] getActions() {
        return actions;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public int getMaxRaise() {
        return maxRaise;
    }

    public void setMaxRaise(int maxRaise) {
        this.maxRaise = maxRaise;
    }

    public int getMaxLower() {
        return maxLower;
    }

    public void setMaxLower(int maxLower) {
        this.maxLower = maxLower;
    }


}




