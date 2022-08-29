package ch.uzh.ifi.seal.soprafs19.entity;

import java.util.Date;

public class OutputMessage {

    private String from;
    private String message;
    private String topic;
    private Date time = new Date();


    public OutputMessage(String from , String text, Date date){
        setFrom(from);
        setMessage(text);
        setTime(date);
    }
    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}