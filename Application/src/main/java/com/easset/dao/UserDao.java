package com.easset.dao;

import java.util.*;

import com.easset.model.User;

public interface UserDao {
    public List<User> getAllUsers();
    public String addUser(User u, int role, String password);
    public int login(String username,String password);
    public User getUserById(int id);
    
}
