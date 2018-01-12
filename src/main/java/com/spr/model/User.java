package com.spr.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Dan on 26.03.2017.
 */
@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue
    private Integer id;

    private String name;

    private String username;

    private String password;

    private String type;

    private String description;

    private String birthDate;

    private String email;

    public User(){

    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String name, String username, String password, String type) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.type = type;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return type;
    }

    public void setRole(String type) {
        this.type = type;
    }
}
