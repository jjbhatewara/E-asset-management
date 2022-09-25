package com.easset.model;

public class AssetType {
    private int id,period,fee,ban_days;
    private String type;
    public AssetType(int id, String type) {
        this.id = id;
        this.type = type;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getPeriod() {
        return period;
    }
    public void setPeriod(int period) {
        this.period = period;
    }
    public int getFee() {
        return fee;
    }
    public void setFee(int fee) {
        this.fee = fee;
    }
    public int getBan_days() {
        return ban_days;
    }
    public void setBan_days(int ban_days) {
        this.ban_days = ban_days;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    @Override
    public String toString() {
        return "AssetType [ban_days=" + ban_days + ", fee=" + fee + ", id=" + id + ", period=" + period + ", type="
                + type + "]";
    }
    
}
