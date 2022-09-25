package com.easset.dao;

import java.sql.*;
import java.util.*;

import com.easset.model.Role;
import com.easset.model.User;

public class UserDaoImpl implements UserDao {
    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT u.id,u.Name,u.Telephone,u.Email,u.Username,u.LastLogin,u.Role_id,r.Role from user u join role r on r.id=u.Role_id;";
        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
            pstmt = conn.prepareStatement(sql);
            User tempUser = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), new Role(rs.getInt(7), rs.getString(8)), rs.getString(6));
            users.add(tempUser);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public String addUser(User u, int role, String password) {
        String msg = "ERROR";
        String sql = "SELECT Username FROM user ";
        try {
            // String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                if ((rs.getString(1).toLowerCase()).equals(u.getUsername().toLowerCase())) {
                    return "Username Already Exists";
                }
            }
            sql = "INSERT INTO `user` (`Name`, `Role_id`, `Telephone`, `Email`, `Username`, `Password`, `LastLogin`, `FirstLogin`) VALUES ( ?, ?, ?, ?, ?, ?, current_timestamp(), current_timestamp());";            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, u.getName());
            pstmt.setInt(2, role);
            pstmt.setString(3, u.getTelephone());
            pstmt.setString(4, u.getEmail());
            pstmt.setString(5, u.getUsername());
            pstmt.setString(6, password);
            int i = pstmt.executeUpdate();
            if (i > 0) {
                return "User Sucessfully added";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return msg;
    }

    public UserDaoImpl() {
        conn = DBConnection.getConnection();
        try {
            stmt = conn.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int login(String username,String password){
        String sql = "SELECT u.id from user u WHERE u.Username = ? and u.Password = ? ";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        return -1;
    }
    
    
    public User getUserById(int id) {
        String sql = "SELECT u.id,u.Name,u.Telephone,u.Email,u.Username,u.LastLogin,u.Role_id,r.Role from user u join role r on r.id=u.Role_id where u.id = ?;";
        User u = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), new Role(rs.getInt(7), rs.getString(8)), rs.getString(6));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }
    // public static void main(String[] args) {
    //     UserDaoImpl ud = new UserDaoImpl();
    //     User u = new User("Bobby", "8845214782", "bobby@viit.ac.in", "bobby");
    //     System.out.println(ud.addUser(u, 2, "user@123"));
    //     System.out.println(ud.getAllUsers());
    //     System.out.println(ud.login("Jinesh","User@123"));
    //     System.out.println(ud.getUserById(1));
    // }
}
