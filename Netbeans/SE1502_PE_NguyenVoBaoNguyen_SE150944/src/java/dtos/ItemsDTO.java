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
public class ItemsDTO {

    private String id, name, unit, price, supplying;
    private SuppliersDTO supplier;

    public ItemsDTO() {
    }

    public ItemsDTO(String id, String name, String unit, String price, String supplying, SuppliersDTO supplier) {
        this.id = id;
        this.name = name;
        this.unit = unit;
        this.price = price;
        this.supplying = supplying;
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

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getSupplying() {
        return supplying;
    }

    public void setSupplying(String supplying) {
        this.supplying = supplying;
    }

    public SuppliersDTO getSupplier() {
        return supplier;
    }

    public void setSupplier(SuppliersDTO supplier) {
        this.supplier = supplier;
    }

}
