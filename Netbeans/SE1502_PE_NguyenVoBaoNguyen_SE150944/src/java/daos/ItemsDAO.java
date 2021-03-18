/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.ItemsDTO;
import dtos.SuppliersDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBContext;

public class ItemsDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public ItemsDAO() {
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

    public List<ItemsDTO> getAllItems() throws Exception {
        List<ItemsDTO> result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM Items\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("ItemCode");
                String name = rs.getString("ItemName");
                String unit = rs.getString("Unit");
                String price = rs.getString("Price");
                String supplying = rs.getString("Supplying");
                String supp = null;
                if (supplying.equals("1")) {
                    supp = "True";
                } else {
                    supp = "False";

                }
                String supCode = rs.getString("SupCode");
                SuppliersDAO dao = new SuppliersDAO();
                SuppliersDTO supplier = dao.getSuppliersByID(supCode);
                ItemsDTO item = new ItemsDTO(id, name, unit, price, supp, supplier);
                result.add(item);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean delete(String id) throws Exception {
        boolean check = false;
        try {
            String sql = "DELETE FROM Items\n"
                    + "WHERE ItemCode=?";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

//    public boolean search(String roomId) throws Exception {
//        boolean check = false;
//        try {
//            String sql = " "
//        }
//    }
    public boolean insert(ItemsDTO item) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO Items(ItemCode, ItemName, Unit, Price, Supplying, SupCode)\n"
                    + "VALUES(?,?,?,?,?,?)";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, item.getId());
            preStm.setString(2, item.getName());
            preStm.setString(3, item.getUnit());
            preStm.setString(4, item.getPrice());
            preStm.setString(5, item.getSupplying());
            preStm.setString(6, item.getSupplier().getId());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean update(ItemsDTO item) throws SQLException, NamingException, Exception {
        boolean check = false;

        try {
            String sql = "UPDATE Items SET  ItemName=?, Unit=?,Price=?, Supplying=?, SupCode=? "
                    + " WHERE ItemCode=? ";
            DBContext db = new DBContext();
            conn = db.getConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);

                preStm.setString(1, item.getName());
                preStm.setString(2, item.getUnit());
                preStm.setString(3, item.getPrice());
                preStm.setString(4, item.getSupplying());
                preStm.setString(5, item.getSupplier().getId());
                preStm.setString(6, item.getId());

                check = preStm.executeUpdate() > 0;
            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
        } finally {
            closeConnection();
        }
        return check;
    }

    public ItemsDTO getItemByID(String id) throws Exception {
        ItemsDTO result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM Items\n"
                    + "WHERE ItemCode = ?\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {

                String name = rs.getString("ItemName");
                String unit = rs.getString("Unit");
                String price = rs.getString("Price");
                String supplying = rs.getString("Supplying");
                String supCode = rs.getString("SupCode");
                SuppliersDAO dao = new SuppliersDAO();
                SuppliersDTO supplier = dao.getSuppliersByID(supCode);

                result = new ItemsDTO(id, name, unit, price, supplying, supplier);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ItemsDTO> getItemBySupplierID(String id) throws Exception {

        List<ItemsDTO> result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM Item\n"
                    + "WHERE SupCode = ?\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);

            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String name = rs.getString("ItemName");
                String unit = rs.getString("Unit");
                String price = rs.getString("Price");
                String supplying = rs.getString("Supplying");
                String supCode = rs.getString("SupCode");
                SuppliersDAO dao = new SuppliersDAO();
                SuppliersDTO supplier = dao.getSuppliersByID(supCode);
                ItemsDTO item = new ItemsDTO(id, name, unit, price, supplying, supplier);
                result.add(item);

            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
