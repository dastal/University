package ch.uzh.ifi.seal.soprafs19.dto.outgoing;

import ch.uzh.ifi.seal.soprafs19.constant.ObjectType;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.Message;

public class GameDto implements Message {


    private Long currentUser;

    private Long winner;

    private Long[][] workerOwner;

    private ObjectType[][] workerType;

    private int[][] buildings;

    private int[][] cupola;

    public Long getCurrentUser() { return currentUser; }

    public Long getWinner() { return winner; }

    public Long[][] getWorkerOwner() { return workerOwner; }

    public ObjectType[][] getWorkerType() { return workerType; }

    public int[][] getBuildings() { return buildings; }

    public int[][] getCupola() { return cupola; }

    public void setCurrentUser(Long currentUser) { this.currentUser = currentUser; }

    public void setWinner(Long winner) { this.winner = winner; }

    public void setWorkerOwner(Long[][] workerOwner) { this.workerOwner = workerOwner; }

    public void setWorkerType(ObjectType[][] workerType) { this.workerType = workerType; }

    public void setBuildings(int[][] buildings) { this.buildings = buildings; }

    public void setCupola(int[][] cupola) { this.cupola = cupola; }

}
