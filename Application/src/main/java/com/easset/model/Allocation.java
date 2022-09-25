package com.easset.model;

public class Allocation {
    private int id;
    User user;
    Asset asset;
    @Override
    public String toString() {
        return "Allocation [asset=" + asset + ", id=" + id + ", user=" + user + "]";
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Asset getAsset() {
        return asset;
    }
    public void setAsset(Asset asset) {
        this.asset = asset;
    }

}
