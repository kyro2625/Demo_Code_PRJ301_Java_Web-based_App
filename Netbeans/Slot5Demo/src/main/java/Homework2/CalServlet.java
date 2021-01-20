/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Homework2;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kyro
 */
@WebServlet(name = "CalServlet", urlPatterns = {"/CalServlet"})
public class CalServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, int n)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title> Calculator</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<form action='CalServlet' method ='POST' name='homework'>");
            out.println("<table>");
            out.println("<tr><td>First:</td> <td> <input type='number' name='first' value='' /></td></tr> ");
            out.println("<tr><td>Second:</td> <td> <input type='number' name='second' value='' /></td></tr>");
            out.println("<tr><td>Operator:</td><td>");
            out.println("<select name='op'>");
            out.print("<option value='+'> + </option>");
            out.print("<option value='-'> - </option>");
            out.print("<option value='*'> * </option>");
            out.println("<option value='/'> / </option>");
            out.println("</select> </td></tr>");
            out.println("<tr><td></td><td> <input type='submit' value='Compute'></td></tr>");
            out.println("<tr><td>Result:</td> <td> <input type='text' name='result' value='" + n + "' /></td></tr>");
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
        processRequest(request, response, 0);
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
        PrintWriter out = response.getWriter();

        String first = request.getParameter("first");
        String second = request.getParameter("second");
        String operator = request.getParameter("op");
        String result = request.getParameter("result");
        int a = Integer.parseInt(first);
        int b = Integer.parseInt(second);
        int r = 0;
        if (a != 0 && b == 0 && operator.equals("/")) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title> Calculator</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<form action='CalServlet' method ='POST' name='homework'>");
            out.println("<table>");
            out.println("<tr><td>First:</td> <td> <input type='number' name='first' value='' /></td></tr> ");
            out.println("<tr><td>Second:</td> <td> <input type='number' name='second' value='' /></td></tr>");
            out.println("<tr><td>Operator:</td><td>");
            out.println("<select name='op'>");
            out.print("<option value='+'> + </option>");
            out.print("<option value='-'> - </option>");
            out.print("<option value='*'> * </option>");
            out.println("<option value='/'> / </option>");
            out.println("</select> </td></tr>");
            out.println("<tr><td></td><td> <input type='submit' value='Compute'></td></tr>");
            out.println("<tr><td>Result:</td> <td> <input type='text' name='result' value='Error' /></td></tr>");
            out.println("</table>");
            out.println("</form>");

            out.println("</body>");
            out.println("</html>");
        } else {
            switch (operator) {
                case "+":
                    r = a + b;
                    break;
                case "-":
                    r = a - b;
                    break;
                case "*":
                    r = a * b;
                    break;
                case "/":
                    r = a / b;
                    break;
            }
            processRequest(request, response, r);

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
