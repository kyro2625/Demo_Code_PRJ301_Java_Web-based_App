/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author Admin
 */
public class LaptopDTO {
    private String id, name, technicalInformation, yearOfManufacture, producer, status;
    private SuppliersDTO supplier;

    public LaptopDTO() {
    }

    public LaptopDTO(String id, String name, String technicalInformation, String yearOfManufacture, String producer, String status, SuppliersDTO supplier) {
        this.id = id;
        this.name = name;
        this.technicalInformation = technicalInformation;
        this.yearOfManufacture = yearOfManufacture;
        this.producer = producer;
        this.status = status;
        this.supplier = supplier;
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

    public String getTechnicalInformation() {
        return technicalInformation;
    }

    public void setTechnicalInformation(String technicalInformation) {
        this.technicalInformation = technicalInformation;
    }

    public String getYearOfManufacture() {
        return yearOfManufacture;
    }

    public void setYearOfManufacture(String yearOfManufacture) {
        this.yearOfManufacture = yearOfManufacture;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public SuppliersDTO getSupplier() {
        return supplier;
    }

    public void setSupplier(SuppliersDTO supplier) {
        this.supplier = supplier;
    }

  
    
}
