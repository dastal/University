package ch.uzh.ifi.seal.soprafs19.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.UNAUTHORIZED)
public class LobbyNotExistsException extends RuntimeException {
    public LobbyNotExistsException() {
        super("This Lobby does not exist!");
    }
}