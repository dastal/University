package ch.uzh.ifi.seal.soprafs19.entity;

import ch.uzh.ifi.seal.soprafs19.constant.GameMode;
import ch.uzh.ifi.seal.soprafs19.constant.LobbyStatus;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.MessageContainer;
import ch.uzh.ifi.seal.soprafs19.exceptions.LobbyFullException;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "lobbycontexts")
public class LobbyContext{
    static int tokenId = 0;

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Column (unique = true)
    private String lobbyToken;

    @Column (unique = true)
    private String lobbyName;

    private Long hostUserId;

    @OneToMany()
    @Fetch(FetchMode.JOIN)
    private List<User> users = null;


    //@OneToOne(targetEntity = LobbyState.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "lobbystate_id", referencedColumnName = "id")
    private LobbyState state;

    @Column
    private LobbyStatus stateType;

    @Column
    private GameMode mode;

    public LobbyContext(){
        super();
    }

    public LobbyContext(User host, GameMode mode) {
        super();
        this.stateType = LobbyStatus.LOBBY;
        this.mode = mode;
        addUser(host);
        setHostUserId(host.getId());
        setLobbyToken(UUID.randomUUID().toString().substring(0,7)+tokenId);
        tokenId++;
    }

    public void update(MessageContainer message){
       this.state.update(message);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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


    public void setState(LobbyState state) {
        this.state = state;
        this.stateType = state.type;
    }

    public List<User> getUsers() {
        return users;
    }

    public void addUser(User user){
        if (this.users == null) {
           this.users = new ArrayList<>();
        }
        else if (this.users.size() >= 4)
            throw new LobbyFullException();
        this.users.add(user);
    }

    public void removeUser(User user){
        this.users.remove(user);
    }

    public void setUsers(ArrayList<User> users) {
        this.users = users;
    }

    public GameMode getMode() {
        return mode;
    }

    public void setMode(GameMode mode) {
        this.mode = mode;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof LobbyContext)) {
            return false;
        }
        LobbyContext lobby = (LobbyContext)o;
        return this.getId().equals(lobby.getId());
    }

    @Override
    public int hashCode() {
        int result = 17;
        result = 31 * result + lobbyToken.hashCode();
        result = 31 * result + id.hashCode();
        return result;
    }

    public LobbyState getState() {
        return this.state;
    }

    public Long getHostUserId() {
        return hostUserId;
    }

    public void setHostUserId(Long hostUserId) {
        this.hostUserId = hostUserId;
    }

    public LobbyStatus getStateType() {
        return stateType;
    }

    public void setStateType(LobbyStatus stateType) {
        this.stateType = stateType;
    }
}
