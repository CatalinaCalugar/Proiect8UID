package com.spr.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Timestamp;

/**
 * Created by Catalina on 5/10/2017.
 */
@Entity
@Table(name = "adoption")
public class Adoption {
    @Id
    @GeneratedValue
    private Integer id;
    private Integer idPet;
    private Integer idClient;
    private Integer idEmployee;
    private Integer idContract;
    private Timestamp adoptionDate;
    private Integer paymentId;

    public Adoption() {
    }

    public Adoption(Integer idClient) {
        this.idClient = idClient;
    }

    public Adoption(Integer idPet, Integer idClient, Integer idEmployee, Integer idContract, Timestamp adoptionDate, Integer paymentId) {
        this.idPet = idPet;
        this.idClient = idClient;
        this.idEmployee = idEmployee;
        this.idContract = idContract;
        this.adoptionDate = adoptionDate;
        this.paymentId = paymentId;
    }

    public Adoption(Integer idPet, Timestamp adoptionDate, Integer idClient) {
        this.idPet = idPet;
        this.adoptionDate = adoptionDate;
        this.idClient = idClient;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIdPet() {
        return idPet;
    }

    public void setIdPet(Integer idPet) {
        this.idPet = idPet;
    }

    public Integer getIdClient() {
        return idClient;
    }

    public void setIdClient(Integer idClient) {
        this.idClient = idClient;
    }

    public Integer getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(Integer idEmployee) {
        this.idEmployee = idEmployee;
    }


    public Timestamp getAdoptionDate() {
        return adoptionDate;
    }

    public void setAdoptionDate(Timestamp adoptionDate) {
        this.adoptionDate = adoptionDate;
    }

    public Integer getIdContract() {
        return idContract;
    }

    public void setIdContract(Integer idContract) {
        this.idContract = idContract;
    }

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }
}
