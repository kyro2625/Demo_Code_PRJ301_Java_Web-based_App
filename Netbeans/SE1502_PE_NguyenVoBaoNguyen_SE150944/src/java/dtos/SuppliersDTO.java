/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author Nguyen
 */
public class SuppliersDTO {

    private String id, name, address, collaborating;

    public SuppliersDTO() {
    }

    public SuppliersDTO(String id, String name, String address, String collaborating) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.collaborating = collaborating;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCollaborating() {
        return collaborating;
    }

    public void setCollaborating(String collaborating) {
        this.collaborating = collaborating;
    }

}
