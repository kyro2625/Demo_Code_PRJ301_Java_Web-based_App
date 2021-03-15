/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.LaptopDAO;
import dtos.LaptopDTO;
import dtos.LaptopErrorObject;
import dtos.SuppliersDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nguye
 */
public class UpdateController extends HttpServlet {

    private static final String SUCCESS = "LoadBySupplierNameController";
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "LoadByIDController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String idURL = "?id=" + request.getParameter("txtID");
        try {

            String id = request.getParameter("txtID");
            String name = request.getParameter("txtName");
            String techInfo = request.getParameter("txtTechInfo");
            String year = request.getParameter("txtYearOfManu");
            String producer = request.getParameter("txtProducer");
            String status = request.getParameter("txtStatus");
            String supplier = request.getParameter("cboSupplier");
            boolean valid = true;
            LaptopErrorObject errorObj = new LaptopErrorObject();
            if (id.trim().isEmpty()) {
                errorObj.setIdError("ID is not supposed to be empty");
                valid = false;
            }
            if (!id.trim().isEmpty() && !id.matches("[0-9]{2}")) {
                errorObj.setIdError("Computer ID must be numberical, 2 digits");
                valid = false;
            }
            if (name.trim().isEmpty()) {
                errorObj.setNameError("Laptop Name is not supposed to be empty");
                valid = false;
            }
            if (!name.trim().isEmpty() && name.length() < 6) {
                errorObj.setNameError("Laptop Name information of computer is greater than 6 characters");
                valid = false;
            }
            if (techInfo.trim().isEmpty()) {
                errorObj.setTechnicalInformationError("Technical Information is not supposed to be empty");
                valid = false;
            }
            if (year.trim().isEmpty()) {
                errorObj.setYearofManufactureError("Year of Manufacture is not supposed to be empty");
                valid = false;
            }
            if (!year.trim().isEmpty() && !year.matches("^(19|20)\\d{2}$")) {
                errorObj.setYearofManufactureError("Year of Manufacture must be number and in range: 1900-2099");
                valid = false;
            }
            if (producer.trim().isEmpty()) {
                errorObj.setProducerError("Producer is not supposed to be empty");
                valid = false;
            }
            if (status.trim().isEmpty()) {
                errorObj.setStatusError("Laptop Status is not supposed to be empty");
                valid = false;
            }
            LaptopDAO dao = new LaptopDAO();
//            if (dao.getComputerByID(id) != null) {
//                errorObj.setIdError("ID is existed");
//                valid = false;
//            }
            SuppliersDTO supplierToDB = new SuppliersDTO(supplier.split("-")[0].trim(), supplier.split("-")[1].trim(), "");
            LaptopDTO laptop = new LaptopDTO(id, name, techInfo, year, producer, status, supplierToDB);

            if (valid) {
                if (dao.update(laptop)) {
                    url = SUCCESS;
                    idURL = "?id=" + supplierToDB.getId();
                } else {
                    request.setAttribute("ERROR", "Update failed, please go back and try again");
                }
            } else {
                url = INVALID + "?id=" + id;
                request.setAttribute("INVALID", errorObj);
                request.getRequestDispatcher(url).forward(request, response);

            }
        } catch (Exception e) {
            log("ERROR at CreateController: " + e.getMessage());
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url + idURL).forward(request, response);
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
