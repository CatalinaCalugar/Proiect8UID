package com.spr.service;

import com.spr.exception.AccesorisesNotFound;
import com.spr.model.Accessorises;

import java.util.List;

/**
 * Created by Catalina on 5/10/2017.
 */
public interface AccesorisesService {
    public Accessorises create(Accessorises accessorises);
    public Accessorises delete(int id) throws AccesorisesNotFound;
    public List<Accessorises> findAll();
    public List<Accessorises> findAllInStock();
    public Accessorises update(Accessorises Accessorises) throws AccesorisesNotFound;
    public Accessorises findById(int id);
    public List<Accessorises> addAccessorises(List<Accessorises> accessorisesList, Accessorises accessorises);
    public List<Accessorises> deleteAccessorises(List<Accessorises> accessorisesList, Accessorises accessorises);
    public boolean checkStock(List<Accessorises> accessorisesList, Accessorises accessorises);
    public boolean modifyStock(List<Accessorises> accessorisesList) throws AccesorisesNotFound;
    public String email(List<Accessorises> accessorisesList);
}
