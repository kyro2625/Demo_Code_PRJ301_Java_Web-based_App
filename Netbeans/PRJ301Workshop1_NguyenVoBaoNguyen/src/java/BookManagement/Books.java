/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookManagement;

/**
 *
 * @author Kyro
 */
public class Books {

    private String bookID;
    private String bookName;
    private String author;
    private int publishYear;
    private String shortDescription;
    private String status;
    private String cateID;

    public Books(String bookID, String bookName, String author, int pulishYear, String shortDescription, String status, String cateID) {
        this.bookID = bookID;
        this.bookName = bookName;
        this.author = author;
        this.publishYear = pulishYear;
        this.shortDescription = shortDescription;
        this.status = status;
        this.cateID = cateID;

    }

    public Books() {

    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
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

    public void setPublishYear(int publishYear) {
        this.publishYear = publishYear;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
    }

    
}
