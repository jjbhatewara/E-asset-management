package com.easset.model;

import java.util.Date;

public class Messages {
    private int id;
    @Override
    public String toString() {
        return "Messages [id=" + id + ", message=" + message + ", timeAdded=" + timeAdded + ", uid=" + uid + "]";
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public User getUid() {
        return uid;
    }
    public void setUid(User uid) {
        this.uid = uid;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public String getTimeAdded() {
        return timeAdded;
    }
    public void setTimeAdded(String timeAdded) {
        this.timeAdded = timeAdded;
    }
    private User uid;
    private String message;
    private String timeAdded;
}
