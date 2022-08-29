package ch.uzh.ifi.seal.soprafs19.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.FORBIDDEN)
public class LobbyFullException extends RuntimeException {
    public LobbyFullException() {
        super("This Lobby is already full!");
    }
}