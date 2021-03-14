/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.SuppliersDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBContext;

/**
 *
 * @author Admin
 */
public class SuppliersDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public SuppliersDAO() {
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

    public SuppliersDTO getSuppliersByID(String id) throws Exception {
        SuppliersDTO result = null;
        try {
            String sql = "SELECT SupplierName, SupplierDescription\n"
                    + "FROM SuppliersTBL\n"
                    + "WHERE SupplierID=?";
            
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if(rs.next()){
                String name = rs.getString("SupplierName");
                String description = rs.getString("SupplierDescription");
                result = new SuppliersDTO(id, name, description);
            }
        }
        finally{
            closeConnection();
        }
        return result;
    }
    
    public List<SuppliersDTO> getAllSuppliers() throws Exception{
        List<SuppliersDTO> result = null;
        try{
            String sql = "SELECT SupplierID, SupplierName, SupplierDescription\n"
                    + "FROM SuppliersTBL\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while(rs.next()){
                String id = rs.getString("SupplierID");
                String name = rs.getString("SupplierName");
                String description = rs.getString("SupplierDescription");
                
                SuppliersDTO dto = new SuppliersDTO(id, name, description);
                result.add(dto);
            }
        }
        finally{
            closeConnection();
        }
        return result;
    }
}
