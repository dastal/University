package ch.uzh.ifi.seal.soprafs19.dto.outgoing;

import ch.uzh.ifi.seal.soprafs19.dto.incoming.Message;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class LobbyDto implements Message, Serializable {
    private Set<Long> readyUsers;

    public void setReadyUsers(HashSet<Long> readyUsers) {
        this.readyUsers = readyUsers;
    }

    public Set<Long> getReadyUsers() {
        return readyUsers;
    }
}
