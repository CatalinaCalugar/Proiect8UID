package com.spr.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;
import java.util.Set;

/**
 * Created by Catalina on 24.03.2017.
 */
@Entity
@Table(name = "client")
public class Client {
    @Id
    @GeneratedValue
    private Integer id;
    private String fname;
    private String lname;
    private String email;
    private String CNP;
    private String address;
    private String username;
    private String password;

    public Client() {
    }

    public Client(String fname, String lname, String email, String CNP, String address) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.CNP = CNP;
        this.address = address;
    }

    public Client(String fname, String lname, String email, String CNP, String address, String username, String password) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.CNP = CNP;
        this.address = address;
        this.username = username;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getCNP() {
        return CNP;
    }

    public void setCNP(String CNP) {
        this.CNP = CNP;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
}
