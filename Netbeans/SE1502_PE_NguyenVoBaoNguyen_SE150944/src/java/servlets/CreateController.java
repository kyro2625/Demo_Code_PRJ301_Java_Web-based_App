/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.ItemsDAO;
import dtos.ItemsDTO;
import dtos.ItemErrorObject;
import dtos.SuppliersDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nguye
 */
public class CreateController extends HttpServlet {

    private static final String SUCCESS = "LoadListItemController";
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "AddNewController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String id = request.getParameter("txtID");
            String name = request.getParameter("txtName");
            String unit = request.getParameter("txtUnit");
            String price = request.getParameter("txtPrice");
            String supplying = request.getParameter("txtSupplying");
            if (supplying == null) {
                supplying = "0";
            }
            String supplier = request.getParameter("cboSupplier");
            boolean valid = true;
            ItemErrorObject errorObj = new ItemErrorObject();
            if (id.trim().isEmpty()) {
                errorObj.setIdError("Item ID is not supposed to be empty");
                valid = false;
            }
            if (!id.trim().isEmpty() && !id.matches("[0-9]{4}")) {
                errorObj.setIdError("Item ID must be numberical, 4 digits");
                valid = false;
            }
            if (name.trim().isEmpty()) {
                errorObj.setNameError("Item Name is not supposed to be empty");
                valid = false;
            }
            if (!name.trim().isEmpty() && name.length() < 6) {
                errorObj.setNameError("Item Name is greater than 6 characters");
                valid = false;
            }
            if (unit.trim().isEmpty()) {
                errorObj.setUnitError("Unit is not supposed to be empty");
                valid = false;
            }
            if (price.trim().isEmpty()) {
                errorObj.setPriceError("Price is not supposed to be empty");
                valid = false;
            }
            if (supplying.trim().isEmpty()) {
                errorObj.setSupplyingError("Supplying is not supposed to be empty");
                valid = false;
            }

            ItemsDAO dao = new ItemsDAO();
            if (dao.getItemByID(id) != null) {
                errorObj.setIdError("This Item ID is existed. Choose another one");
                valid = false;
            }
            SuppliersDTO supplierToDB = new SuppliersDTO(supplier.split("-")[0].trim(), supplier.split("-")[1].trim(), "", "");
            ItemsDTO item = new ItemsDTO(id, name, unit, price, supplying, supplierToDB);

            if (valid) {
                if (dao.insert(item)) {
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Insert failed, cannot find the Item ID: " + id + ", please go back and try again");
                }
            } else {
                url = INVALID;
                request.setAttribute("INVALID", errorObj);
            }
        } catch (Exception e) {
            log("ERROR at CreateController: " + e.getMessage());
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CreateController.class.getName()).log(Level.SEVERE, null, ex);
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
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CreateController.class.getName()).log(Level.SEVERE, null, ex);
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
