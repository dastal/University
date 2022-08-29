package ch.uzh.ifi.seal.soprafs19.entity;


import ch.uzh.ifi.seal.soprafs19.constant.LobbyStatus;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.MessageContainer;
import ch.uzh.ifi.seal.soprafs19.exceptions.MessageInvalidException;

import javax.persistence.*;

@Entity
@Table(name = "lobbystate")
public abstract class LobbyState {
    @Id
    @GeneratedValue
    @Column(name = "id")
    protected Long id;

    @OneToOne(mappedBy = "state")
    protected LobbyContext context;

    public LobbyState(){
        super();
    }

    public LobbyState(LobbyContext context){
        this.context = context;
    }

    public abstract void update(MessageContainer message) throws MessageInvalidException;

    @Transient
    protected LobbyStatus type;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LobbyContext getContext() {
        return context;
    }

    public void setContext(LobbyContext context) {
        this.context = context;
    }


    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof LobbyState)) {
            return false;
        }
        LobbyState lobby = (LobbyState) o;
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
