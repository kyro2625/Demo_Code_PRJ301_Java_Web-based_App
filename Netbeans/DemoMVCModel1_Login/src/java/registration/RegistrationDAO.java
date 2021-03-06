package registration;

import beans.LoginBean;
import utils.DBUtils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Van Vo
 */
public class RegistrationDAO implements Serializable {

    private List<LoginBean> listAccounts;

    public List<LoginBean> getListAccounts() {
        return listAccounts;
    }

    public void searchName(String strName) throws NamingException, SQLException, Exception {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT * from UserInformation where FullName like '%" + strName + "%'";

        try {
            //con = DBUtils.makeConnection();
            con = DBUtils.getConnection();
            if (con != null) {

                pstm = con.prepareStatement(sql);
                //pstm.setString(1, "'%" + strName + "%'");

                rs = pstm.executeQuery();

                while (rs.next()) {
                    String u = rs.getString("UserName");
                    String p = rs.getString("UserPassword");
                    String fname = rs.getString("FullName");
                    boolean r = false;

                    if (rs.getInt("UserRole") == 1) {
                        r = true;
                    }

                    LoginBean userInfo = new LoginBean(u, p, fname, r);
                    if (this.listAccounts == null) {
                        this.listAccounts = new ArrayList<LoginBean>();
                    }
                    this.listAccounts.add(userInfo);

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
    }
 
    public boolean checkLogin(String u, String p) throws SQLException, NamingException, Exception {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT * from UserInformation where UserName=? And UserPassword=?";

        try {
            con = DBUtils.getConnection();
            //con = DBUtils.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, u);
                pstm.setString(2, p);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    return true;
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
        return false;
    }

    public boolean deleteUser(String u) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "DELETE FROM UserInformation WHERE UserName=?";

        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, u);

                rs = pstm.executeQuery();
                if (rs.next()) {
                    return true;
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
        return false;
    }

    
}
