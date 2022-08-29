package ch.uzh.ifi.seal.soprafs19.dto.incoming;


public class ReadyStateMessage implements Message {
    private Long userId;
    private boolean ready;


    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public boolean isReady() {
        return ready;
    }

    public void setReady(boolean ready) {
        this.ready = ready;
    }
}
