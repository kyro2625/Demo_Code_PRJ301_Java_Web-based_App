/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Exercise;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kyro
 */
public class DemoSignUpForm extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String age = request.getParameter("age");
        String bio = request.getParameter("biolography");
        String job = request.getParameter("job");
        String[] interest = request.getParameterValues("interest");
        out.println("<h1> You have entered values (using POST method): </h1>");
        out.println("Name: " + name + "<br/>");
        out.println("Email: " + email + "<br/>");
        out.println("Password: " + password + "<br/>");
        out.println("Age: " + age + "<br/>");
        out.println("Biolography: " + bio + "<br/>");
        out.println("Job Role: " + job + "<br/> Your Interest: ");
        for (String s : interest) {
            out.println(s + "  ");
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
