/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import DAO.ProductDAO;
import DTO.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kyro
 */
@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet UpdateServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String pid = request.getParameter("pid"); //1. Lấy ID của Product cần update
            ProductDAO dao = new ProductDAO(); //2.1. Kết nối CSDL
            Product p = dao.getProductByID(pid); //2.2 Lấy tất cả thông tin của Product cần update
            
            out.println("<form action='UpdateServlet' method='POST' name='fupdate'>");
            out.println("<table width='600px' border='0px solid'>");
                out.println("<td>ProductID</td>");
                //3. Gán data vào form
                out.println("<td>: <input type='text' name='id' value='"+p.getId()+"'readonly/> </td>");
            out.println("</tr>");
            out.println("<tr>");
                out.println("<td>Name</td>");
                out.println("<td>: <input type='text' name='name' value='"+p.getName()+"'/> </td>");
            out.println("</tr>");
            out.println("<tr>");
                out.println("<td>Description</td>");
                out.println("<td>: <textarea name='description' >"+p.getDescription()+"</textarea> </td>");
            out.println("</tr>");
            out.println("<tr>");
                out.println("<td>Quantity</td>");
                out.println("<td>: <input type='text' name='quantity' value='"+p.getQuantity()+"'/> </td>");
            out.println("</tr>");
            out.println("<tr>");
                out.println("<td>Price</td>");
                out.println("<td>: <input type='text' name='price' value='"+p.getPrice()+"'/> </td>");
            out.println("</tr>");
            out.println("<tr>");
                out.println("<td>Image URL</td>");
                out.println("<td>: <input type='text' name='url' value='"+p.getImgURL()+"'/> </td>");
            out.println("</tr>");
            out.println("<tr>");
                out.println("<td colspan='2' align='center'>");
                    out.println("<input type='submit' value='Update'/>");
                    out.println("<input type='reset' value='Reset'/>");
                out.println("</td>");
            out.println("</tr>");
            out.println("</table>");
            out.println("</form>");
            out.println("</body>");
            out.println("</html");
            
            
            
            
        } catch (NamingException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //1. Lấy thông tin từ form (không cho phép cập nhật ID)
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String quantity = request.getParameter("quantity");
            String price = request.getParameter("price");
            String url = request.getParameter("url");
            
            //2. Tạo đối tượng Product
            Product p = new Product(id, name, description, Integer.parseInt(quantity), Double.parseDouble(price), url);
            //3. Gọi tới lớp thao tác CSDL và thực thi hàm cập nhật
            ProductDAO dao = new ProductDAO();
            if (dao.updateProduct(p)) 
                response.sendRedirect("ProductManagementServlet");
            else 
                response.sendRedirect("invalid.html");
        } catch (SQLException | NamingException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
