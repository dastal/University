package ch.uzh.ifi.seal.soprafs19.entity;

public class Message {

    private String from;
    private String text;


    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }
    // adding getters and setters here
}