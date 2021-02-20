/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserManagement;

/**
 *
 * @author Kyro
 */
public class User {

    private String accountName;
    private String password;
    private String firstName;
    private String lastName;

    public User() {
    }

    public User(String accountName, String password) {
        this.accountName = accountName;
        this.password = password;
    }

    public User(String accountName, String password, String firstName, String lastName) {
        this.accountName = accountName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
   

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

}
