package ch.uzh.ifi.seal.soprafs19.dto.incoming;

import java.io.Serializable;

public class MoveMessage implements Serializable, Message {
    private AuthorizationCredentials authorization;
    private Move move;

    public AuthorizationCredentials getAuthorization() {
        return authorization;
    }

    public void setAuthorization(AuthorizationCredentials authorization) {
        this.authorization = authorization;
    }

    public Move getMove() {
        return move;
    }

    public void setMove(Move move) {
        this.move = move;
    }
}
