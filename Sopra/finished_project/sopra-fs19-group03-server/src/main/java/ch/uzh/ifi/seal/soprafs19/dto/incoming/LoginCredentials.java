package ch.uzh.ifi.seal.soprafs19.dto.incoming;

import java.io.Serializable;

public class LoginCredentials implements Serializable, Message {
    private String username;
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}