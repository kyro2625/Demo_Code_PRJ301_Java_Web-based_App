/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;

/**
 *
 * @author Nguyen
 */
public class ItemErrorObject implements Serializable {

    private String idError, nameError, priceError, unitError, supplyingError;

    public ItemErrorObject() {
    }

    public String getIdError() {
        return idError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getUnitError() {
        return unitError;
    }

    public void setUnitError(String unitError) {
        this.unitError = unitError;
    }

    public String getSupplyingError() {
        return supplyingError;
    }

    public void setSupplyingError(String supplyingError) {
        this.supplyingError = supplyingError;
    }

}
