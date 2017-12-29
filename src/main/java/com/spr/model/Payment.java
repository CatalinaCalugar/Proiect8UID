package com.spr.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Catalina on 5/12/2017.
 */

@Entity
@Table(name = "payment")
public class Payment {
    @Id
    @GeneratedValue
    private Integer id;
    private String type;
    private Float transportMoney;
    private Float total;

    public Payment() {
    }

    public Payment(String type, Float transportMoney, Float total) {
        this.type = type;
        this.transportMoney = transportMoney;
        this.total = total;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Float getTransportMoney() {
        return transportMoney;
    }

    public void setTransportMoney(Float transportMoney) {
        this.transportMoney = transportMoney;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }
}

