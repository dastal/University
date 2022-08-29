package ch.uzh.ifi.seal.soprafs19.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.UNAUTHORIZED)
public class InvalidMoveException extends RuntimeException {
    public InvalidMoveException() {
        super("This move is not valid!");
    }
    public InvalidMoveException(String message) {
        super("This move is not valid! - " + message);
    }
}