/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Kyro
 */
public class DemoProductTableConnection {

    public static void main(String[] args) {
        try {
            //JDBC Driver Type 4: Native Protocol
            //1. Khai báo lớp Driver dùng để kết nối cơ sở dữ liệu
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //2. Tạo đối tượng kết nối CSDL gồm 3 tham số url, user, pass 
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ProductManagement";
            Connection c = DriverManager.getConnection(url, "sa", "123456789");

            //3. Tạo đối tượng thực thi câu truy vấn Statement/PreparedStatement
            String sql = "SELECT * FROM Products";
            PreparedStatement ps = c.prepareStatement(sql);

            //4. Đối tượng kết quả sau khi thực thi câu truy vấn
            ResultSet rs = ps.executeQuery();
            while (rs.next()) { //duyệt qua từng mẫu tin
                String id = rs.getString("ProductId");
                String name = rs.getString("ProductName");
                String description = rs.getString("ProductDescription");
                int quantity = rs.getInt("Quantity");
                double price = rs.getDouble("Price");
                String imageurl = rs.getString("ImageUrl");

                System.out.println("ID: " + id + " - " + name + " - " + description + " - " + quantity);
                System.out.println("");
            }
            //5. Đóng kết nối
            rs.close();
            ps.close();
            c.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
