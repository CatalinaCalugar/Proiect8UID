package com.spr.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Catalina on 5/10/2017.
 */
@Entity
@Table(name = "accessorises")
public class Accessorises {
    @Id
    @GeneratedValue
    private Integer id;
    private String name;
    private String type;
    private String petType;
    private Float price;
    private String image;
    private Integer stockNumber;

    public Accessorises(){}

    public Accessorises(String name, String type,String petType,Float price,String image) {
        this.name = name;
        this.price = price;
        this.type = type;
        this.petType = petType;
    }

    public Accessorises(String name, String type, String petType, Float price, String image, Integer stockNumber) {
        this.name = name;
        this.type = type;
        this.petType = petType;
        this.price = price;
        this.image = image;
        this.stockNumber = stockNumber;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPetType() {
        return petType;
    }

    public Integer getStockNumber() {
        return stockNumber;
    }

    public void setStockNumber(Integer stockNumber) {
        this.stockNumber = stockNumber;
    }

    public void setPetType(String petType) {
        this.petType = petType;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
