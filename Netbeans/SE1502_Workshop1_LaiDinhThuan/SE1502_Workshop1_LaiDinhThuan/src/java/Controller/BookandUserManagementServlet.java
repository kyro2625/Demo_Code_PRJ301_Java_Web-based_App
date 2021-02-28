/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import BookManagement.Books;
import BookManagement.Categories;
import DAO.BookDAO;
import DAO.UserDAO;
import UserManagerment.User;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Baby Bear
 */
public class BookandUserManagementServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        String welcome = (String) request.getAttribute("name");
        String displayView = "view.jsp";
        String formView = "bookform.jsp";
        String updateView = "updateform.jsp";
        String addCate = "addCate.jsp";

        String controllerServlet = "BookandUserManagementServlet";

        try {
            if (action == null) {
     
                ArrayList<Categories> cate = new ArrayList();

                BookDAO dao = new BookDAO();
                
                cate = dao.getAllCate();

                request.setAttribute("data2", cate);
                request.setAttribute("hello", welcome);
                RequestDispatcher rd = request.getRequestDispatcher(displayView);
                rd.forward(request, response);

            } else if (action.equals("log")) {
                String uname = request.getParameter("name");
                String pass = request.getParameter("pass");
                UserDAO dao = new UserDAO();
                User us1 = new User(uname, pass);
                User us = dao.getUser(pass);
                if (us == null) {
                    RequestDispatcher rd = request.getRequestDispatcher("error.html");
                    rd.forward(request, response);
                }
                if (us1.getName().equals(us.getName()) && us1.getPass().equalsIgnoreCase(us.getPass())) {
                    request.setAttribute("name", uname);
                    RequestDispatcher rd = request.getRequestDispatcher("greet.jsp");
                    rd.forward(request, response);
                }
            } else if (action.equals("addu")) {
                User u = new User();
                request.setAttribute("pObject", u);
                request.setAttribute("msg", "Register a user");
                request.setAttribute("action", "addUser");
                RequestDispatcher rd = request.getRequestDispatcher("userform.jsp");
                rd.forward(request, response);
            } else if (action.endsWith("addUser")) {
                String name = request.getParameter("uname");
                String pass = request.getParameter("pass");
                UserDAO dao = new UserDAO();
                User u = new User(name, pass);
                dao.addUser(u);
                response.sendRedirect("Login.html");
            } else if (action.equals("addform")) { // Hiển thị form để tạo mới sản phẩm

                Books p = new Books();//Tạo đ/t product chưa có thong tin
                request.setAttribute("pObject", p);
                request.setAttribute("msg", "Add new Book");
                request.setAttribute("action", "Create");
                RequestDispatcher rd = request.getRequestDispatcher(formView);
                rd.forward(request, response);
            } else if (action.equals("Create")) {
                try {
                    BookDAO dao = new BookDAO();
                    Books b = dao.getBookById(request.getParameter("id"));

                    String id = request.getParameter("id");
                    String name = request.getParameter("name");
                    String description = request.getParameter("description");
                    String author = request.getParameter("author");
                    String PublishYear = request.getParameter("PY");
                    String Status = request.getParameter("sta");
                    String cateid = request.getParameter("catID");

                    Books p = new Books(Integer.parseInt(id), name, author, Integer.parseInt(PublishYear), description, Status, cateid);

                    dao.createBook(p);

                    response.sendRedirect(controllerServlet);

                } catch (Exception e) {
                    request.setAttribute("msg", "Please enter the right format");
                    RequestDispatcher rd = request.getRequestDispatcher("BookandUserManagementServlet?action=addform");
                    rd.forward(request, response);
                }

            } else if (action.equals("updateform")) {
                String id = request.getParameter("pid");

                BookDAO dao = new BookDAO();
                Books p = dao.getBookById(id);

                request.setAttribute("pObject", p);
                request.setAttribute("msg", "Update book");
                request.setAttribute("action", "Update");
                RequestDispatcher rd = request.getRequestDispatcher(updateView);
                rd.forward(request, response);

            } else if (action.equals("Update")) {
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                String author = request.getParameter("author");
                String PublishYear = request.getParameter("PY");
                String Status = request.getParameter("sta");
                String cateid = request.getParameter("catID");

                BookDAO dao = new BookDAO();

                Books p = new Books(Integer.parseInt(id), name, author, Integer.parseInt(PublishYear), description, Status, cateid);

                dao.updateBook(p);

                response.sendRedirect(controllerServlet);

            } else if (action.equals("delete")) {
                String id = request.getParameter("pid");

                BookDAO dao = new BookDAO();
                dao.deleteBook(id);
                response.sendRedirect(controllerServlet);
            } else if (action.equals("find")) {
               
                 
                
                    String id = request.getParameter("cid");
                    BookDAO dao = new BookDAO();
                    ArrayList<Books> b= new ArrayList();
                     b = dao.getBookByCateId(id);
                     
                      request.setAttribute("bObject", b);
                    RequestDispatcher rd = request.getRequestDispatcher("viewbook.jsp");
                    rd.forward(request, response);
                     
            }

        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
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
