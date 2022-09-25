package com.easset.model;

import java.util.Date;

public class User {
    
    private int id;
    private  String name,telephone,email,username;
    private Role role;
    private  String firstLogin;
    public User(int id, String name, String telephone, String email, String username, Role role, String lastLogin) {
        this.id = id;
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.username = username;
        this.role = role;
        this.lastLogin = lastLogin;
    }
    private String lastLogin;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public User(String name, String telephone, String email, String username) {
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.username = username;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getTelephone() {
        return telephone;
    }
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public Role getRole() {
        return role;
    }
    public void setRole(Role role) {
        this.role = role;
    }
    public String getFirstLogin() {
        return firstLogin;
    }
    public void setFirstLogin(String firstLogin) {
        this.firstLogin = firstLogin;
    }
    public String getLastLogin() {
        return lastLogin;
    }
    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;
    }
    @Override
    public String toString() {
        return "User [email=" + email + ", firstLogin=" + firstLogin + ", id=" + id + ", lastLogin=" + lastLogin
                + ", name=" + name + ", role=" + role + ", telephone=" + telephone + ", username=" + username + "]";
    }
}
