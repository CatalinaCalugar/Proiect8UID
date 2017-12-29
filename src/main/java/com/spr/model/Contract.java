package com.spr.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Created by Catalina on 5/10/2017.
 */
@Entity
@Table(name = "contract")
public class Contract {
    @Id
    @GeneratedValue
    private Integer id;
    private java.sql.Date date;
    private String description;

    public Contract() {
    }

    public Contract(java.sql.Date date, String description) {
        this.date = date;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public java.sql.Date getDate() {
        return date;
    }

    public void setDate(java.sql.Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
