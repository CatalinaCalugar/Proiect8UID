package com.spr.service;

import com.spr.exception.AdoptionNotFound;
import com.spr.model.Adoption;
import com.spr.repository.AdoptionRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Catalina on 5/10/2017.
 */
@Service
public class AdoptionServiceImpl implements AdoptionService {
    @Resource
    private AdoptionRepository adoptionRepository;

    @Override
    @Transactional
    public Adoption create(Adoption adoption) {
        Adoption createdAdoption= adoption;
        return adoptionRepository.save(createdAdoption);
    }

    @Override
    @Transactional
    public Adoption delete(int id) throws AdoptionNotFound {
        Adoption deletedAdoption=adoptionRepository.findOne(id);
        if(deletedAdoption==null){
            throw new AdoptionNotFound();
        }
        adoptionRepository.delete(deletedAdoption);
        return deletedAdoption;
    }

    @Override
    @Transactional
    public List<Adoption> findAll() {
        return adoptionRepository.findAll();
    }

    @Override
    @Transactional
    public Adoption update(Adoption adoption) throws AdoptionNotFound {
        Adoption updatedAdoption= adoptionRepository.findOne(adoption.getId());
        if(updatedAdoption==null)
            throw new AdoptionNotFound();
        updatedAdoption.setIdClient(adoption.getIdClient());
        updatedAdoption.setIdEmployee(adoption.getIdEmployee());
        updatedAdoption.setIdPet(adoption.getIdPet());
        updatedAdoption.setAdoptionDate(adoption.getAdoptionDate());
        updatedAdoption.setIdContract(adoption.getIdContract());
        updatedAdoption.setPaymentId(adoption.getPaymentId());
        return updatedAdoption;
    }

    @Override
    @Transactional
    public Adoption findById(int id) {
        return adoptionRepository.findOne(id);
    }

    @Override
    @Transactional
    public List<Adoption> findAllWithoutContract(){
        List<Adoption> allAdopt = adoptionRepository.findAll();
        List<Adoption> withoutContr = new ArrayList<>();
        for (Adoption a : allAdopt){
            if(a.getIdContract()== 99999 || a.getIdEmployee()== 99999){
                withoutContr.add(a);
            }
        }
        return withoutContr;
    }
}
