package ch.uzh.ifi.seal.soprafs19.dto.incoming;

import ch.uzh.ifi.seal.soprafs19.dto.outgoing.ChatMessage;

public class ChatMessageContainer {
    private AuthorizationCredentials authorization;
    private ChatMessage chatMessage;

    public AuthorizationCredentials getAuthorization() {
        return authorization;
    }

    public void setAuthorization(AuthorizationCredentials authorization) {
        this.authorization = authorization;
    }

    public ChatMessage getChatMessage() {
        return chatMessage;
    }

    public void setChatMessage(ChatMessage chatMessage) {
        this.chatMessage = chatMessage;
    }
}
