package com.easset.model;

import java.util.Date;

public class Asset {
    private int id;
    private String name;
    private AssetType type;
    private String description;
    private String dateAdded;
    private boolean isAvailable;
    public Asset(int id, String name, AssetType type, String description, String dateAdded, boolean isAvailable) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.description = description;
        this.dateAdded = dateAdded;
        this.isAvailable = isAvailable;
    }
    @Override
    public String toString() {
        return "Asset [Description=" + description + ", dateAdded=" + dateAdded + ", id=" + id + ", isAvailable="
                + isAvailable + ", name=" + name + ", type=" + type + "]";
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public AssetType getType() {
        return type;
    }
    public void setType(AssetType type) {
        this.type = type;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        description = description;
    }
    public String getDateAdded() {
        return dateAdded;
    }
    public void setDateAdded(String dateAdded) {
        this.dateAdded = dateAdded;
    }
    public boolean isAvailable() {
        return isAvailable;
    }
    public void setAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }
}
