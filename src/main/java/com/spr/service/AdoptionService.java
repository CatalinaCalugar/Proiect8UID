package com.spr.service;

import com.spr.exception.AdoptionNotFound;
import com.spr.model.Adoption;

import java.util.List;

/**
 * Created by Catalina on 5/10/2017.
 */
public interface AdoptionService {
    public Adoption create(Adoption adoption);
    public Adoption delete(int id) throws AdoptionNotFound;
    public List<Adoption> findAll();
    public Adoption update(Adoption Adoption) throws AdoptionNotFound;
    public Adoption findById(int id);
    public List<Adoption> findAllWithoutContract();
}
