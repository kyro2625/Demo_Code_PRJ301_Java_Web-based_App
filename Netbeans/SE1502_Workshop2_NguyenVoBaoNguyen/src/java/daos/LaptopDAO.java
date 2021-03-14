/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.LaptopDTO;
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

/**
 *
 * @author nguyen
 */
public class LaptopDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public LaptopDAO() {
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

    public List<LaptopDTO> getAllLaptop() throws Exception {
        List<LaptopDTO> result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM LaptopsTBL\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("LaptopID");
                String name = rs.getString("LaptopName");
                String technicalInfo = rs.getString("TechnicalInformation");
                String yearOfManu = rs.getString("YearOfManufacture");
                String producer = rs.getString("Producer");
                String status = rs.getString("LaptopStatus");
                String supplierID = rs.getString("SupplierID");
                SuppliersDAO dao = new SuppliersDAO();
                SuppliersDTO supplier = dao.getSuppliersByID(supplierID);
                LaptopDTO laptop = new LaptopDTO(id, name, technicalInfo, yearOfManu, producer, status, supplier);
                result.add(laptop);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean delete(String id) throws Exception {
        boolean check = false;
        try {
            String sql = "DELETE FROM LaptopsTBL\n"
                    + "WHERE LaptopID=?";
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
    public boolean insert(LaptopDTO laptop) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO LaptopsTBL(LaptopID, LaptopName, TechnicalInformation, YearOfManufacture, Producer, LaptopStatus, SupplierID)\n"
                    + "VALUES(?,?,?,?,?,?,?)";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, laptop.getId());
            preStm.setString(2, laptop.getName());
            preStm.setString(3, laptop.getTechnicalInformation());
            preStm.setString(4, laptop.getYearOfManufacture());
            preStm.setString(5, laptop.getProducer());
            preStm.setString(6, laptop.getStatus());
            preStm.setString(7, laptop.getSupplier().getId());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean update(LaptopDTO laptop) throws SQLException, NamingException, Exception {
        boolean check = false;

        try {
            String sql = "UPDATE LaptopsTBL SET  LaptopName=?, TechnicalInformation=?,YearOfManufacture=?, Producer=?, LaptopStatus=?, SupplierID=? "
                    + " WHERE LaptopID=? ";
            DBContext db = new DBContext();
            conn = db.getConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);

                preStm.setString(1, laptop.getName());
                preStm.setString(2, laptop.getTechnicalInformation());
                preStm.setString(3, laptop.getYearOfManufacture());
                preStm.setString(4, laptop.getProducer());
                preStm.setString(5, laptop.getStatus());
                preStm.setString(6, laptop.getSupplier().getId());
                preStm.setString(7, laptop.getId());

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

    public LaptopDTO getLaptopByID(String id) throws Exception {
        LaptopDTO result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM LaptopsTBL\n"
                    + "WHERE LaptopID = ?\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("LaptopName");
                String technicalInfo = rs.getString("TechnicalInformation");
                String yearOfManu = rs.getString("YearOfManufacture");
                String producer = rs.getString("Producer");
                String status = rs.getString("LaptopStatus");
                String supplierID = rs.getString("SupplierID");
                SuppliersDAO dao = new SuppliersDAO();
                SuppliersDTO supplier = dao.getSuppliersByID(supplierID);
                result = new LaptopDTO(id, name, technicalInfo, yearOfManu, producer, status, supplier);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<LaptopDTO> getLaptopBySupplierID(String id) throws Exception {

        List<LaptopDTO> result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM LaptopsTBL\n"
                    + "WHERE SupplierID = ?\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);

            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String laptopID = rs.getString("LaptopID");
                String name = rs.getString("LaptopName");
                String technicalInfo = rs.getString("TechnicalInformation");
                String yearOfManu = rs.getString("YearOfManufacture");
                String producer = rs.getString("Producer");
                String status = rs.getString("LaptopStatus");
                String supplierID = rs.getString("SupplierID");
                SuppliersDAO dao = new SuppliersDAO();
                SuppliersDTO supplier = dao.getSuppliersByID(supplierID);
                LaptopDTO laptop = new LaptopDTO(laptopID, name, technicalInfo, yearOfManu, producer, status, supplier);
                result.add(laptop);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
