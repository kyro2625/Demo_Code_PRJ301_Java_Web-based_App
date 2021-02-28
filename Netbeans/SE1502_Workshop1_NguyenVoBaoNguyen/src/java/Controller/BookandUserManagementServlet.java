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
import UserManagement.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kyro
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
        try (PrintWriter out = response.getWriter()) {

            String action = request.getParameter("action");
            String welcome = (String) request.getAttribute("name");
            String displayView = "mainPage.jsp";
            String formView = "bookform.jsp";
            String updateView = "updateform.jsp";
            String addCate = "addCate.jsp";
            String welcomePage = "login.html";
            String names = null;

            String controllerServlet = "BookandUserManagementServlet?action=mainPage";

            try {
                if (action.equals("log")) {
                    String accountName = request.getParameter("accountName");
                    String password = request.getParameter("password");
                    UserDAO dao = new UserDAO();
                    User user1 = new User(accountName, password);
                    User user = dao.getUser(password);
                    if (user == null) {
                        RequestDispatcher rd = request.getRequestDispatcher("error.html");
                        rd.forward(request, response);
                    }
                    if (user1.getAccountName().equals(user.getAccountName()) && user1.getPassword().equalsIgnoreCase(user.getPassword())) {
                        HttpSession session = request.getSession();
                        names = user.getName();
                        request.setAttribute("names", names);
                        RequestDispatcher rd = request.getRequestDispatcher("welcomePage.jsp");
                        rd.forward(request, response);

                    }

                } else if (action.equals("mainPage")) {
                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        ArrayList<Categories> listCate = new ArrayList<>();

                        BookDAO dao1 = new BookDAO();
                        listCate = dao1.getAllCate();

                        request.setAttribute("data2", listCate);
                        request.setAttribute("hello", welcome);
                        RequestDispatcher rd = request.getRequestDispatcher(displayView);
                        rd.forward(request, response);

                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("Login.html");

                        rd.forward(request, response);
                    }

                } else if (action.equals("logout")) {
                    HttpSession session = request.getSession();
                    session.invalidate();
                    RequestDispatcher rd = request.getRequestDispatcher("Login.html");
                    rd.forward(request, response);
                } else if (action.equals("addu")) {
                    User u = new User();
                    request.setAttribute("pObject", u);
                    request.setAttribute("msg", "Register a user");
                    request.setAttribute("action", "addUser");
                    RequestDispatcher rd = request.getRequestDispatcher("userform.jsp");
                    rd.forward(request, response);

                } else if (action.endsWith("addUser")) {
                    String name = request.getParameter("names");
                    String email = request.getParameter("email");

                    String accountName = request.getParameter("accountName");
                    String password = request.getParameter("password");
                    UserDAO dao = new UserDAO();
                    User u = new User(accountName, password, name, email);
                    dao.addUser(u);
                    response.sendRedirect("Login.html");

                } else if (action.equals("rollback")) {
                    response.sendRedirect("Login.html");

                } else if (action.equals("addform")) { // Hiển thị form để tạo mới sản phẩm
                    HttpSession session = request.getSession(false);
                    if (session != null) {

                        ArrayList<Categories> listCate = new ArrayList<>();
                        BookDAO dao = new BookDAO();

                        Books p = new Books();//Tạo đ/t product chưa có thong tin
                        listCate = dao.getAllCate();
                        request.setAttribute("data2", listCate);
                        request.setAttribute("pObject", p);
                        request.setAttribute("msg", "Add new Book");
                        request.setAttribute("action", "Create");
                        RequestDispatcher rd = request.getRequestDispatcher(formView);
                        rd.forward(request, response);
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("Login.html");

                        rd.forward(request, response);
                    }

                }else if (action.equals("Create")) {
                    HttpSession session = request.getSession(false);
                    if (session != null) {

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

                            Books p = new Books(id, name, author, Integer.parseInt(PublishYear), description, Status, cateid);

                            dao.createBook(p);

                            response.sendRedirect(controllerServlet);

                        } catch (Exception e) {
                            request.setAttribute("msg", "Please enter the right format");
                            RequestDispatcher rd = request.getRequestDispatcher("BookandUserManagementServlet?action=addform");
                            rd.forward(request, response);
                        }
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("Login.html");

                        rd.forward(request, response);
                    }

                } else if (action.equals("updateform")) {
                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        String id = request.getParameter("pid");
                        ArrayList<Categories> listCate = new ArrayList<>();
                        BookDAO dao = new BookDAO();
                        listCate = dao.getAllCate();
                        request.setAttribute("data2", listCate);

                        Books p = dao.getBookById(id);

                        request.setAttribute("pObject", p);
                        request.setAttribute("msg", "Update book");
                        request.setAttribute("action", "Update");
                        RequestDispatcher rd = request.getRequestDispatcher(updateView);
                        rd.forward(request, response);
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("Login.html");

                        rd.forward(request, response);
                    }

                } else if (action.equals("Update")) {
                    String id = request.getParameter("id");
                    String name = request.getParameter("name");
                    String description = request.getParameter("description");
                    String author = request.getParameter("author");
                    String PublishYear = request.getParameter("PY");
                    String Status = request.getParameter("sta");
                    String cateid = request.getParameter("catID");

                    BookDAO dao = new BookDAO();

                    Books p = new Books(id, name, author, Integer.parseInt(PublishYear), description, Status, cateid);

                    dao.updateBook(p);

                    response.sendRedirect(controllerServlet);

                } else if (action.equals("delete")) {
                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        String id = request.getParameter("pid");

                        BookDAO dao = new BookDAO();
                        dao.deleteBook(id);
                        response.sendRedirect(controllerServlet);
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("Login.html");

                        rd.forward(request, response);
                    }

                } else if (action.equals("search")) {
                    HttpSession session = request.getSession(false);
                    if (session != null) {

                        String id = request.getParameter("cid");
                        String name = request.getParameter("cname");
                        BookDAO dao = new BookDAO();
                        ArrayList<Books> b = dao.getBookByCateId(id);
                        request.setAttribute("cname", name);
                        request.setAttribute("bObject", b);
                        RequestDispatcher rd = request.getRequestDispatcher("viewbook.jsp");
                        rd.forward(request, response);

                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("Login.html");

                        rd.forward(request, response);
                    }
                }
            } catch (NamingException | SQLException e) {
                e.printStackTrace();
            }
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
