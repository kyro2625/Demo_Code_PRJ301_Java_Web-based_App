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
public class Books {
    private int id;
    private String name;
    private String author;
    private int publishYear;
    private String ShortDes;
    private String Sta;
    private String catename;
   
 
    public Books(int id, String name, String author, int pulishYear, String ShortDes, String Sta, String catename) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.publishYear = pulishYear;
        this.ShortDes = ShortDes;
        this.Sta = Sta;
        this.catename= catename;
       
    }

    public Books() {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getPublishYear() {
        return publishYear;
    }

    public void setPublishYear(int pulishYear) {
        this.publishYear = pulishYear;
    }

    public String getShortDes() {
        return ShortDes;
    }

    public void setShortDes(String ShortDes) {
        this.ShortDes = ShortDes;
    }

    public String getSta() {
        return Sta;
    }

    public void setSta(String Sta) {
        this.Sta = Sta;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }

    
}