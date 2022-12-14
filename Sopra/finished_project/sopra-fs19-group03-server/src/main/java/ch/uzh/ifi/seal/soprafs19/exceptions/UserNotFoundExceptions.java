package ch.uzh.ifi.seal.soprafs19.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class UserNotFoundExceptions extends RuntimeException {
    public UserNotFoundExceptions (String name) {
        super("Could not find user " + name);
    }
}