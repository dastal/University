package ch.uzh.ifi.seal.soprafs19.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.UNAUTHORIZED)
public class MessageInvalidException extends RuntimeException {
    public MessageInvalidException() {
        super("This is an invalid message!");
    }
    public MessageInvalidException(String message) {
        super("This is an invalid message! - " + message);
    }
}