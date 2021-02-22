/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import UTILS.DBConnect;
import UserManagement.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Kyro
 */
public class UserDAO {

    public boolean addUser(User u) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        String sql = "INSERT INTO Users(Username,Password,Names,Email)"
                + "VALUES (?, ?, ?, ?)";

        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, u.getAccountName());
                pstm.setString(2, u.getPassword());
                pstm.setString(3, u.getName());
                pstm.setString(4, u.getEmail());
                pstm.executeUpdate();
                return true;
            }
        } catch (SQLException e) {
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
        String sql = "SELECT Username,Password,Names,Email FROM Users WHERE Password=?";
        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, pass);
                rs = pstm.executeQuery();

                if (rs.next()) {
                    String accountName = rs.getString("Username");
                    String password = rs.getString("Password");
                    String name = rs.getString("Names");
                    String email = rs.getString("Email");

                    User u = new User(accountName, password, name, email);
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
