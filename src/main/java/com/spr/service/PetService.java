package com.spr.service;

import com.spr.exception.PetNotFound;
import com.spr.model.Pet;

import java.util.List;

/**
 * Created by Catalina on 5/10/2017.
 */
public interface PetService {
    public Pet create(Pet pet);
    public Pet delete(int id) throws PetNotFound;
    public List<Pet> findAll();
    public List<Pet> findAllUnavailable();
    public Pet update(Pet Pet) throws PetNotFound;
    public Pet findById(int id);
    public List<Pet> findByType(String type);
}
