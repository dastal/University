package ch.uzh.ifi.seal.soprafs19.entity;

import ch.uzh.ifi.seal.soprafs19.constant.LobbyStatus;
import ch.uzh.ifi.seal.soprafs19.constant.MessageType;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.MessageContainer;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.ReadyStateMessage;
import ch.uzh.ifi.seal.soprafs19.exceptions.MessageInvalidException;
import ch.uzh.ifi.seal.soprafs19.service.AccessHelper;

import javax.persistence.Column;
import javax.persistence.Entity;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Lobby extends LobbyState {
    public Set<Long> getReadyUsers() {
        return readyUsers;
    }

    public void setReadyUsers(HashSet<Long> readyUsers) {
        this.readyUsers = readyUsers;
    }

    @Column
    private HashSet<Long> readyUsers;


    public Lobby() {
        super();
        this.type = LobbyStatus.LOBBY;
    }
    public Lobby(LobbyContext context){
        super(context);
        this.readyUsers = new HashSet<>();
        this.type = LobbyStatus.LOBBY;
    }

    @Override
    public void update(MessageContainer message) throws MessageInvalidException {
        if (message.getType() != MessageType.READYSTATEMESSAGE)
            throw new MessageInvalidException();

        updateReadyState((ReadyStateMessage)message.getMessage());
        AccessHelper.getLobbyController().convertAndSendLobbyState(context);

        //all users are ready -> update Lobby State to Setup
        if (getContext().getUsers().size() == readyUsers.size()) {
            AccessHelper.getLobbyService().changeStateToSetup(context, this.readyUsers);
        }
    }

    private void updateReadyState(ReadyStateMessage message) {
        if (message.isReady()) {
            if (!readyUsers.contains(message.getUserId()))
                readyUsers.add(message.getUserId());
        }
        else {
            if (readyUsers.contains(message.getUserId()))
                readyUsers.remove(message.getUserId());
        }
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Lobby)) {
            return false;
        }
        Lobby lobby = (Lobby) o;
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
