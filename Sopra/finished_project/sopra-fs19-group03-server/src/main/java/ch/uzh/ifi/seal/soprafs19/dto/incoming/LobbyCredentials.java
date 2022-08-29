package ch.uzh.ifi.seal.soprafs19.dto.incoming;


import java.io.Serializable;

public class LobbyCredentials implements Serializable, Message {
    private String token;
    private String mode;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }
}