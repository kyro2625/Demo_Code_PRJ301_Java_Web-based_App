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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class UploadResultServlet extends HttpServlet {
 
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
 
            
            Product p = (Product)request.getAttribute("product"); 
            
            
                            
            out.println("<table width=\"600px\" border=\"0px solid\">");
                out.println("<tr>");
                    out.println("<td>Product ID </td>"); 
                    // 3. Gán data vào form
                    out.println("<td>: "  +p.getId() + " </td> ");
                out.println("</tr>");
                out.println("<tr>"); 
                    out.println("<td>Name </td>"); 
                    out.println("<td>: "+p.getName()+"</td> ");
                out.println("</tr>");
                out.println("<tr> ");
                    out.println("<td>Description </td> ");
                    out.println("<td>: "+ p.getDescription() +"</td>"); 
                out.println("</tr>");
                out.println("<tr> ");
                    out.println("<td>Quantity </td> ");
                   out.println(" <td>: "+p.getQuantity()+"</td>"); 
                out.println("</tr>");
                out.println("<tr>"); 
                    out.println("<td>Price</td> ");
                    out.println("<td>: "+p.getPrice()+"</td> ");
                out.println("</tr>");
                out.println("<tr> ");
                    out.println("<td>Image URL </td> ");
                    out.println("<td>: <img src=\"images/"+p.getImgURL()+"\" width=\"120\" height=\"150\">"+ "");
                out.println("</tr>");
                out.println("<tr> ");
                    out.println("<td colspan=\"2\" align=\"center\"> ");
                        out.println("<input type=\"submit\" value=\"Update\" /> ");
                        out.println("<input type=\"reset\" value=\"Reset\" />");
                    out.println("</td> ");
                out.println("</tr>");
 
            out.println("</table>");
            
            out.println("</form>");
            
            out.println("</body>");
            out.println("</html>");
        }
    }
 
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
        processRequest(request, response);
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
        processRequest(request, response);
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
