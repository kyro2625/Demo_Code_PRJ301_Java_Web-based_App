/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import UTILS.DBConnect;
import UserManagerment.User;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Baby Bear
 */
public class UserDAO {

    public boolean addUser(User u) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        String sql = "INSERT INTO Users(Username,Pass)"
                + "VALUES (?, ?)";

        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, u.getName());
                pstm.setString(2, u.getPass());

                pstm.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public User getUser(String pass) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT Username,Pass FROM Users WHERE Pass=?";
        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, pass);
                rs = pstm.executeQuery();

                if (rs.next()) {
                    String name = rs.getString("Username");
                    String upass = rs.getString("Pass");

                    User u = new User(name, upass);
                    return u;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }
}
