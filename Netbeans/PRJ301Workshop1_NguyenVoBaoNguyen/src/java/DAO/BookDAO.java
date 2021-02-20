/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import BookManagement.Books;
import BookManagement.Categories;
import UTILS.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author Baby Bear
 */
public class BookDAO {
    public boolean addCate(Categories cd) throws NamingException, SQLException{
         Connection con = null;
        PreparedStatement pstm = null;
        String sql = "INSERT INTO Categories(CategoryID,CategoryName,CategoryDescription) "
                + "VALUES (?, ?, ?)";

        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, cd.getCateID());
                pstm.setString(2, cd.getCateName());
                pstm.setString(3, cd.getDescription());
               
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
     public ArrayList<Categories> getAllCate() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT c.* FROM Categories c ORDER BY c.CategoryID";

        ArrayList<Categories> lst = new ArrayList<>();

        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                rs = pstm.executeQuery();

                while (rs.next()) {
                    String id = rs.getString("CategoryID");
                    String name = rs.getString("CategoryName");
                    String Des = rs.getString("CategoryDescription");
                   
                    Categories c = new Categories(id, name, Des); //DTO

                    lst.add(c);
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
        return lst;
    }

    public ArrayList<Books> getAllBooks() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT b.BookID, b.Name, b.Author, b.PublishYear, b.ShortDescription, b.Status, c.CategoryName  FROM Books b, Categories c WHERE b.CategoryID=c.CategoryID ORDER BY c.CategoryID";

        ArrayList<Books> lst = new ArrayList<>();

        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                rs = pstm.executeQuery();

                while (rs.next()) {
                    String id = rs.getString("BookID");
                    String name = rs.getString("Name");
                    String author = rs.getString("Author");
                    int publishYear = rs.getInt("PublishYear");
                    String ShortDes = rs.getString("ShortDescription");
                    String Sta = rs.getString("Status");
                    String cate = rs.getString("CategoryName");

                    Books p = new Books(id, name, author, publishYear, ShortDes, Sta, cate); //DTO

                    lst.add(p);
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
        return lst;
    }

    public Books getBookById(String pid) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT b.*, c.CategoryID FROM Books b, Categories c WHERE BookID=?";
        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, pid);
                rs = pstm.executeQuery();

                if (rs.next()) {
                    String id = rs.getString("BookID");
                    String name = rs.getString("Name");
                    String author = rs.getString("Author");
                    int publishYear = rs.getInt("PublishYear");
                    String ShortDes = rs.getString("ShortDescription");
                    String Sta = rs.getString("Status");
                    String cate = rs.getString("CategoryID");

                    Books p = new Books(id, name, author, publishYear, ShortDes, Sta, cate); //DTO

                    return p;
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

    public boolean deleteBook(String id) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pstm = null;
        String sql = "DELETE FROM Books WHERE BookID=?";

        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, id);

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

    public boolean createBook(Books pd) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pstm = null;
        String sql = "INSERT INTO Books(BookID, Name, Author, PublishYear, ShortDescription, Status, CategoryID) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, pd.getBookID());
                pstm.setString(2, pd.getBookName());
                pstm.setString(3, pd.getAuthor());
                pstm.setInt(4, pd.getPublishYear());
                pstm.setString(5, pd.getShortDescription());
                pstm.setString(6, pd.getStatus());
                pstm.setString(7, pd.getCateID());
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

    public boolean updateBook(Books pd) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pstm = null;
        String sql = "UPDATE Books SET  Name=?, Author=?,PublishYear=?, ShortDescription=?, Status=?, CategoryID=? "
                + " WHERE BookID=? ";
        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);

                pstm.setString(1, pd.getBookName());
                pstm.setString(2, pd.getAuthor());
                pstm.setInt(3, pd.getPublishYear());
                pstm.setString(4, pd.getShortDescription());
                pstm.setString(5, pd.getStatus());
                pstm.setString(6, pd.getCateID());
                pstm.setString(7, pd.getBookID());

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
}
