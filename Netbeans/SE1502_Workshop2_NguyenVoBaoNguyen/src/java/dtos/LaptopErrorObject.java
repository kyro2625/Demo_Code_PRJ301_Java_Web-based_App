/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class LaptopErrorObject implements Serializable{
    private String idError, nameError, technicalInformationError, yearofManufactureError, producerError, statusError;

    public LaptopErrorObject() {
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

    public String getTechnicalInformationError() {
        return technicalInformationError;
    }

    public void setTechnicalInformationError(String technicalInformationError) {
        this.technicalInformationError = technicalInformationError;
    }

    public String getYearofManufactureError() {
        return yearofManufactureError;
    }

    public void setYearofManufactureError(String yearofManufactureError) {
        this.yearofManufactureError = yearofManufactureError;
    }

    public String getProducerError() {
        return producerError;
    }

    public void setProducerError(String producerError) {
        this.producerError = producerError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }

  
    
    
}
