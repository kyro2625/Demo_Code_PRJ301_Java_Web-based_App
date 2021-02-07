package dbhelper;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {

   public static Connection makeConnection() throws SQLException {
        try {
            //1. 
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ProductManagement";
            //2.
            Connection con = DriverManager.getConnection(url, "demo", "123456789");
            return con;
        } catch (ClassNotFoundException | SQLException e) {
            // TODO: handle exception
            e.printStackTrace();
        }
       // TODO: handle exception
        return null;
    }
}
