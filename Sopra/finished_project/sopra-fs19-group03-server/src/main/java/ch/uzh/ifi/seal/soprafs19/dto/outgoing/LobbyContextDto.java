package ch.uzh.ifi.seal.soprafs19.dto.outgoing;

import ch.uzh.ifi.seal.soprafs19.constant.GameMode;
import ch.uzh.ifi.seal.soprafs19.constant.LobbyStatus;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.Message;

import java.util.Set;

public class LobbyContextDto implements Message {
    private String lobbyToken;
    private String lobbyName;
    private Long hostUserId;
    private Set<UserDto> users;
    private LobbyStatus stateType;
    private GameMode mode;

    public String getLobbyToken() {
        return lobbyToken;
    }

    public void setLobbyToken(String lobbyToken) {
        this.lobbyToken = lobbyToken;
    }

    public String getLobbyName() {
        return lobbyName;
    }

    public void setLobbyName(String lobbyName) {
        this.lobbyName = lobbyName;
    }

    public Long getHostUserId() {
        return hostUserId;
    }

    public void setHostUserId(Long hostUserId) {
        this.hostUserId = hostUserId;
    }


    public Set<UserDto> getUsers() {
        return users;
    }

    public void setUsers(Set<UserDto> users) {
        this.users = users;
    }

    public LobbyStatus getStateType() {
        return stateType;
    }

    public void setStateType(LobbyStatus stateType) {
        this.stateType = stateType;
    }

    public GameMode getMode() { return mode; }

    public void setMode(GameMode mode) { this.mode = mode; }
}
