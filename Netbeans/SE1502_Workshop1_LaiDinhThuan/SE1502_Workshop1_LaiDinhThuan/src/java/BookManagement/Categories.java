/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookManagement;

/**
 *
 * @author Baby Bear
 */
public class Categories {
    private int cateID;
    private String name;
    private String Des;

    public Categories(int cateID, String name, String Des) {
        this.cateID = cateID;
        this.name = name;
        this.Des = Des;
    }

    public int getCateID() {
        return cateID;
    }

    public Categories() {
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return Des;
    }

    public void setDes(String Des) {
        this.Des = Des;
    }
    
    
}
