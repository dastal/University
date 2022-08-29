package ch.uzh.ifi.seal.soprafs19.dto.incoming;

import java.io.Serializable;

public class AuthorizationCredentials implements Serializable, Message {
    private String token;
    private Long id;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}