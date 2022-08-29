package ch.uzh.ifi.seal.soprafs19.dto.incoming;

import ch.uzh.ifi.seal.soprafs19.constant.MessageType;

public class MessageContainer{

    private MessageType type;

    private Message message;

    public MessageContainer(Message message, MessageType type) {
        this.message = message;
        this.type = type;
    }
    public MessageType getType() {
        return type;
    }

    public Message getMessage() {
        return message;
    }
}
