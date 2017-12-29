package com.spr.service;

import com.spr.exception.PetNotFound;
import com.spr.model.Pet;
import com.spr.repository.PetRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Catalina on 5/10/2017.
 */
@Service
public class PetServiceImpl implements PetService {
    @Resource
    private PetRepository petRepository;

    @Override
    @Transactional
    public Pet create(Pet pet) {
        Pet createdPet = pet;
        return petRepository.save(createdPet);
    }

    @Override
    @Transactional
    public Pet delete(int id) throws PetNotFound {
        Pet deletedPet = petRepository.findOne(id);
        if (deletedPet == null) {
            throw new PetNotFound();
        }
        petRepository.delete(deletedPet);
        return deletedPet;
    }

    @Override
    @Transactional
    public List<Pet> findAll() {
        return petRepository.findAll();
    }

    @Override
    @Transactional
    public List<Pet> findAllUnavailable() {
        List<Pet> petList = petRepository.findAll();
        List<Pet> unavailable = new ArrayList<>();
        for (Pet p : petList) {
            if (!p.isAvailable()) {
                unavailable.add(p);
            }
        }
        return unavailable;
    }

    @Override
    @Transactional
    public Pet update(Pet pet) throws PetNotFound {
        Pet updatedPet = petRepository.findOne(pet.getIdPet());
        if (updatedPet == null)
            throw new PetNotFound();
        updatedPet.setName(pet.getName());
        updatedPet.setRace(pet.getRace());
        updatedPet.setAvailable(pet.isAvailable());
        updatedPet.setPrice(pet.getPrice());
        updatedPet.setImage(pet.getImage());
        return updatedPet;
    }

    @Override
    @Transactional
    public Pet findById(int id) {
        return petRepository.findOne(id);
    }

    @Override
    @Transactional
    public List<Pet> findByType(String type) {
        List<Pet> pets = petRepository.findAll();
        List<Pet> sortedList = new ArrayList<>();
        for (Pet p : pets) {
            if (p.getType().equals(type)) {
                sortedList.add(p);
            }
        }
        return sortedList;
    }
}
