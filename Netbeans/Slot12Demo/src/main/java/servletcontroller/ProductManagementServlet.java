/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletcontroller;

import daos.ProductDAO;
import entities.Product;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Van Vo
 */
@WebServlet(name = "ProductManagementServlet", urlPatterns = {"/ProductManagementServlet"})
public class ProductManagementServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        String displayView = "index.jsp";
        String formView = "productform.jsp";
        
        //String errorView = "errorpage.jsp";
        
        String controllerServlet = "ProductManagementServlet";

        try {
            if (action == null) { // Liệt kê danh sách sản phẩm 
                ArrayList<Product> listProducts = new ArrayList<>();
                ProductDAO dao = new ProductDAO();
                listProducts = dao.getAllProducts();
                request.setAttribute("data", listProducts);
                RequestDispatcher rd = request.getRequestDispatcher(displayView);
                rd.forward(request, response);
                
            } else if (action.equals("addform")) { // Hiển thị form để tạo mới sản phẩm
                Product p = new Product();
                
                request.setAttribute("pObject", p);
                request.setAttribute("msg", "Add new product");
                request.setAttribute("action", "Create");
                
            } else if (action.equals("updateform")) {
                String id = request.getParameter("pid");
                ProductDAO dao = new ProductDAO();
                Product p = dao.getProductById(id);
                request.setAttribute("pObject", p);
                request.setAttribute("msg", "Update product (ID: "+ id + " )");
                request.setAttribute("action", "Update");
                
                RequestDispatcher rd = request.getRequestDispatcher(formView);
            } else if (action.equals("delete")) {
                String id = request.getParameter("pid");
                ProductDAO dao = new ProductDAO();
                dao.deleteProduct(id);
                response.sendRedirect(controllerServlet);

            } 
            else if (action.equals("Update")) {
               
            } else if (action.equals("Create")) {
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                String quantity = request.getParameter("quantity");
                String price = request.getParameter("price");
                String url = request.getParameter("url");

                ProductDAO dao = new ProductDAO();

                Product p = new Product(id, name, description, Integer.parseInt(quantity),
                        Double.parseDouble(price), url);

                dao.createProduct(p);

                response.sendRedirect(controllerServlet);
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
