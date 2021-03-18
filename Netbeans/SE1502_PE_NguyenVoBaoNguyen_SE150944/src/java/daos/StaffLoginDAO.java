/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.StaffAccountDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utils.DBContext;

public class StaffLoginDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public StaffLoginDAO() {
    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (conn != null) {
            conn.close();
        }
        if (preStm != null) {
            preStm.close();
        }
    }

    public StaffAccountDTO checkLogin(String username, String password) throws Exception {
        StaffAccountDTO result = null;
        try {
            String sql = "SELECT FullName\n"
                    + "FROM StaffAccount\n"
                    + "WHERE UserName=? AND UserPassword=?";

            DBContext db = new DBContext();

            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String fullName = rs.getString("FullName");
                result = new StaffAccountDTO(username, fullName);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

}
