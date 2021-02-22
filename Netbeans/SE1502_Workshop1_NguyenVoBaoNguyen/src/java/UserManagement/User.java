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
    private String name;
    private String email;

    public User() {
    }

    public User(String accountName, String password) {
        this.accountName = accountName;
        this.password = password;
    }

    public User(String accountName, String password, String name, String email) {
        this.accountName = accountName;
        this.password = password;
        this.name = name;
        this.email = email;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
