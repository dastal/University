package ch.uzh.ifi.seal.soprafs19.entity;

import ch.uzh.ifi.seal.soprafs19.constant.LobbyStatus;
import ch.uzh.ifi.seal.soprafs19.constant.MessageType;
import ch.uzh.ifi.seal.soprafs19.constant.ObjectType;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.MessageContainer;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.MoveMessage;
import ch.uzh.ifi.seal.soprafs19.exceptions.InvalidMoveException;
import ch.uzh.ifi.seal.soprafs19.exceptions.MessageInvalidException;
import ch.uzh.ifi.seal.soprafs19.service.AccessHelper;

import javax.persistence.*;
import java.util.LinkedList;
import java.util.List;

@Entity
public class Game extends LobbyState {

    private static final long serialVersionUID = 1L;

    @Column//(nullable = false)
    private String token;

    @Column//(nullable = false)
    private LinkedList<Long> userSequence;

    @Column//(nullable = false)
    private Long currentUser;

    @Column
    private Long winner;

    @Lob
    @Column//(nullable = false)
    private Long[][] workerOwner;

    @Column//(nullable = false)
    @Lob
    private ObjectType[][] workerType;

    @Column//(nullable = false)
    private int[][] buildings;

    @Column//(nullable = false)
    private int[][] cupola;

    public Game(){
        super();
    }

    public Game(LobbyContext context, LinkedList<Long> userSequence) {
        super(context);
        this.token = context.getLobbyToken();
        this.type = LobbyStatus.GAME;
        context.setStateType(this.type);
        this.workerType = new ObjectType[5][5];
        this.workerOwner = new Long[5][5];
        this.buildings = new int[5][5];
        this.cupola = new int[5][5];
        this.userSequence = userSequence;
        this.currentUser = userSequence.peek();
        Ruleset initial = AccessHelper.getUserService().getUser(currentUser).getRuleset();
        initial.computeActions(this);
        AccessHelper.getLobbyController().convertAndSendRuleset(initial, token);
    }


    public void setWorker(Long playerId, ObjectType figureType, int row, int column){
        if ((figureType != ObjectType.WORKER1 && figureType != ObjectType.WORKER2 && figureType!= null) ||
        row > 4 || row < 0 || column > 4 || column < 0
        ) throw new InvalidMoveException();
        workerOwner[row][column] = playerId;
        workerType[row][column] = figureType;
    }

    public Long[][] getWorkerOwner(){
        return workerOwner;
    }

    public ObjectType[][] getWorkerType() {
        return workerType;
    }

    public void raiseBuilding(int row, int column){
        if (buildings[row][column] >= 3 || cupola[row][column] == 1)
            throw new InvalidMoveException();
        buildings[row][column]++;
    }

    public void buildCupola(int row, int column){
        if(cupola[row][column] == 1)
            throw new InvalidMoveException();
        cupola[row][column] = 1;
    }

    public Long getWinner(){return winner;}

    public void setWinner(Long winner) {
        this.winner = winner;
    }

    public void nextUser(){
        userSequence.add(userSequence.remove());
        currentUser = userSequence.peek();
    }

    @Override
    public void update(MessageContainer message) throws InvalidMoveException, MessageInvalidException {
        if (message.getType().equals(MessageType.MOVEMESSAGE)) {
            MoveMessage moveMessage = (MoveMessage) message.getMessage();
            if (moveMessage.getAuthorization().getId().equals(currentUser)) {
                //handle Move
                User currentUserLocal = AccessHelper.getUserService().getUser(moveMessage.getAuthorization().getId().toString());
                Ruleset currentRuleset = currentUserLocal.getRuleset();
                currentRuleset.setMove(moveMessage.getMove(), this);
                AccessHelper.getLobbyController().convertAndSendLobbyState(context);
                if (winner != null) {
                    if (!currentUserLocal.getId().equals(winner))
                        throw new IllegalStateException("Somethings wrong!");
                    handleGameEnd(currentUserLocal);
                    return;
                }

                //initialize next Move
                do {
                    currentUserLocal = AccessHelper.getUserService().getUser(getCurrentUser().toString());
                    currentRuleset = currentUserLocal.getRuleset();
                    currentRuleset.computeActions(this);
                } while (!currentRuleset.hasOptions); //handle case where User has no moves left to do
                AccessHelper.getLobbyController().convertAndSendRuleset(currentRuleset, token);
            }
            else throw new InvalidMoveException("It's not your turn!");
        }
        else throw new MessageInvalidException();
    }

    private void handleGameEnd(User winner){
        winner.setWins(winner.getWins() + 1);
        AccessHelper.getUserService().updateUser(winner);
        for (Long idLocal : userSequence
             ) {
            User local = AccessHelper.getUserService().removeRuleset(idLocal);
            local.setGames(local.getGames() + 1);
            AccessHelper.getUserService().updateUser(local);
        }
        AccessHelper.getLobbyService().changeStateToLobby(context);
    }

    public int[][] getBuildings() {
        return buildings;
    }

    public int[][] getCupola() {
        return cupola;
    }

    public Long getCurrentUser() {
        return currentUser;
    }

    public List<Long> getUserSequence() {
        return userSequence;
    }

    public void setWorkerOwner(Long[][] workerOwner) {
        this.workerOwner = workerOwner;
    }

    public void setWorkerType(ObjectType[][] workerType) {
        this.workerType = workerType;
    }

    public void setBuildings(int[][] buildings) {
        this.buildings = buildings;
    }

    public void setCupola(int[][] cupola) {
        this.cupola = cupola;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Game)) {
            return false;
        }
        Game lobby = (Game) o;
        return this.getId().equals(lobby.getId());
    }

    @Override
    public int hashCode() {
        int result = 17;
        result = 31 * result + id.hashCode();
        result = 31 * result + context.hashCode();
        return result;
    }
}
