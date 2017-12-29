package com.spr.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Catalina on 5/10/2017.
 */
@Entity
@Table(name = "pet")
public class Pet {
    @Id
    @GeneratedValue
    private Integer idPet;
    private String name;
    private Float price;
    private boolean available;
    private String race;
    private String type;
    private String image;

    public Pet() {
    }

    public Pet(String name, Float price, boolean available, String race, String type, String image) {
        this.name = name;
        this.price = price;
        this.available = available;
        this.race = race;
        this.type = type;
        this.image = image;
    }

    public Integer getIdPet() {
        return idPet;
    }

    public void setIdPet(Integer idPet) {
        this.idPet = idPet;
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

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public String getRace() {
        return race;
    }

    public void setRace(String race) {
        this.race = race;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
