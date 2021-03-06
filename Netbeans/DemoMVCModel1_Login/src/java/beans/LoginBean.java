/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.Serializable;
import registration.RegistrationDAO;

/**
 *
 * @author Van Vo
 */
public class LoginBean implements Serializable{
    private String userName;
    private String userPassword;
    private String fullName;
    private boolean userRole; 

    public LoginBean() {
        this.userName = "";
        this.userPassword = "";
        this.fullName = "";
        this.userRole = false;
    }

    public LoginBean(String userName, String userPassword, String fullName, boolean userRole) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.fullName = fullName;
        this.userRole = userRole;
    }

    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public boolean isUserRole() {
        return userRole;
    }

    public void setUserRole(boolean userRole) {
        this.userRole = userRole;
    }
    
    public boolean checkLogin(String u, String p) {
        RegistrationDAO dao = new RegistrationDAO();
        boolean res = false;
        try {
            res = dao.checkLogin(u, p);
            return res;
        } catch (Exception e) {
        }
        return res;
    }

}
