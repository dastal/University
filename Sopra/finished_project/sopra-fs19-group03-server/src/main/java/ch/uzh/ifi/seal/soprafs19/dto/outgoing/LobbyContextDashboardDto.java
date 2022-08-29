package ch.uzh.ifi.seal.soprafs19.dto.outgoing;

import ch.uzh.ifi.seal.soprafs19.constant.GameMode;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.Message;
import ch.uzh.ifi.seal.soprafs19.entity.User;

import java.util.List;

public class LobbyContextDashboardDto implements Message {
    private String id;
    private String lobbyName;
    private Long hostUserId;
    private int userCount;
    private GameMode mode;


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

    public int getUserCount() {
        return userCount;
    }

    public void setUserCount(List<User> users) {
        this.userCount = users.size();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public GameMode getMode() {
        return mode;
    }

    public void setMode(GameMode mode) {
        this.mode = mode;
    }
}
