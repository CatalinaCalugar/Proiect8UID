package com.spr.model;

import java.sql.Time;
import java.util.List;
import java.util.Map;

/**
 * Created by cata_ on 1/5/2018.
 */
public class CoworkingSpace {
    private int id;
    private String name;
    private String description;
    private String ownerEmail;
    private String ownerPhone;
    private String webURL;
    private String facebookUrl;
    private String twitterUrl;
    private List<String> generalAmenities;
    private String longitude;
    private String latitude;
    private List<Office> officeList;
    private String openingHour;
    private String closingHour;
    private List<String> generalPhotos;
    private String ISBN;

    public CoworkingSpace() {
    }

    public CoworkingSpace(String name, String description, String ownerEmail, String ownerPhone, String webURL, String facebookUrl, String twitterUrl, List<String> generalAmenities, String longitude, String latitude, List<Office> officeList, String openingHour, String closingHour, List<String> generalPhotos, String ISBN) {
        this.name = name;
        this.description = description;
        this.ownerEmail = ownerEmail;
        this.ownerPhone = ownerPhone;
        this.webURL = webURL;
        this.facebookUrl = facebookUrl;
        this.twitterUrl = twitterUrl;
        this.generalAmenities = generalAmenities;
        this.longitude = longitude;
        this.latitude = latitude;
        this.officeList = officeList;
        this.openingHour = openingHour;
        this.closingHour = closingHour;
        this.generalPhotos = generalPhotos;
        this.ISBN = ISBN;
    }

    public CoworkingSpace(int id, String name, String description, String ownerEmail, String ownerPhone, String webURL, String facebookUrl, String twitterUrl, List<String> generalAmenities, String longitude, String latitude, List<Office> officeList, String openingHour, String closingHour, List<String> generalPhotos, String ISBN) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.ownerEmail = ownerEmail;
        this.ownerPhone = ownerPhone;
        this.webURL = webURL;
        this.facebookUrl = facebookUrl;
        this.twitterUrl = twitterUrl;
        this.generalAmenities = generalAmenities;
        this.longitude = longitude;
        this.latitude = latitude;
        this.officeList = officeList;
        this.openingHour = openingHour;
        this.closingHour = closingHour;
        this.generalPhotos = generalPhotos;
        this.ISBN = ISBN;
    }

    public CoworkingSpace(int id, String name, String description, List<String> generalAmenities, String ownerEmail, String ownerPhone, String webURL) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.ownerEmail = ownerEmail;
        this.ownerPhone = ownerPhone;
        this.webURL = webURL;
        this.generalAmenities = generalAmenities;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOwnerEmail() {
        return ownerEmail;
    }

    public void setOwnerEmail(String ownerEmail) {
        this.ownerEmail = ownerEmail;
    }

    public String getOwnerPhone() {
        return ownerPhone;
    }

    public void setOwnerPhone(String ownerPhone) {
        this.ownerPhone = ownerPhone;
    }

    public String getWebURL() {
        return webURL;
    }

    public void setWebURL(String webURL) {
        this.webURL = webURL;
    }

    public String getFacebookUrl() {
        return facebookUrl;
    }

    public void setFacebookUrl(String facebookUrl) {
        this.facebookUrl = facebookUrl;
    }

    public String getTwitterUrl() {
        return twitterUrl;
    }

    public void setTwitterUrl(String twitterUrl) {
        this.twitterUrl = twitterUrl;
    }

    public List<String> getGeneralAmenities() {
        return generalAmenities;
    }

    public void setGeneralAmenities(List<String> generalAmenities) {
        this.generalAmenities = generalAmenities;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public List<Office> getOfficeList() {
        return officeList;
    }

    public void setOfficeList(List<Office> officeList) {
        this.officeList = officeList;
    }

    public String getOpeningHour() {
        return openingHour;
    }

    public void setOpeningHour(String openingHour) {
        this.openingHour = openingHour;
    }

    public String getClosingHour() {
        return closingHour;
    }

    public void setClosingHour(String closingHour) {
        this.closingHour = closingHour;
    }

    public List<String> getGeneralPhotos() {
        return generalPhotos;
    }

    public void setGeneralPhotos(List<String> generalPhotos) {
        this.generalPhotos = generalPhotos;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }
}
