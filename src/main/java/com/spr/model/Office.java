package com.spr.model;

import java.util.List;

/**
 * Created by cata_ on 1/5/2018.
 */
public class Office {
    private int id;
    private String name;
    private String type;
    private int capacity;
    private String photo;
    private List<String> amenities;
    private double price;

    public Office() {
    }

    public Office(String name, String type, int capacity, String photo, List<String> amenities, double price) {
        this.name = name;
        this.type = type;
        this.capacity = capacity;
        this.photo = photo;
        this.amenities = amenities;
        this.price = price;
    }

    public Office(int id, String name, String type, int capacity, String photo, List<String> amenities, double price) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.capacity = capacity;
        this.photo = photo;
        this.amenities = amenities;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public List<String> getAmenities() {
        return amenities;
    }

    public void setAmenities(List<String> amenities) {
        this.amenities = amenities;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
