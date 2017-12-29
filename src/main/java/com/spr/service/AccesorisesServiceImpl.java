package com.spr.service;

import com.spr.exception.AccesorisesNotFound;
import com.spr.model.Accessorises;
import com.spr.repository.AccesorisesRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Catalina on 5/10/2017.
 */
@Service
public class AccesorisesServiceImpl implements AccesorisesService {

    @Resource
    private AccesorisesRepository accesorisesRepository;

    @Override
    @Transactional
    public Accessorises create(Accessorises accessorises) {
        Accessorises createdAccessorises = accessorises;
        return accesorisesRepository.save(createdAccessorises);
    }

    @Override
    @Transactional
    public Accessorises delete(int id) throws AccesorisesNotFound {
        Accessorises deletedAccessorises = accesorisesRepository.findOne(id);
        if (deletedAccessorises == null) {
            throw new AccesorisesNotFound();
        }
        accesorisesRepository.delete(deletedAccessorises);
        return deletedAccessorises;
    }

    @Override
    @Transactional
    public List<Accessorises> findAllInStock() {
        List<Accessorises> all = accesorisesRepository.findAll();
        List<Accessorises> inStock = new ArrayList<>();
        for (Accessorises a : all) {
            if (a.getStockNumber() > 0) {
                inStock.add(a);
            }
        }
        return inStock;
    }

    @Override
    @Transactional
    public List<Accessorises> findAll() {
        return accesorisesRepository.findAll();
    }

    @Override
    @Transactional
    public Accessorises update(Accessorises accessorises) throws AccesorisesNotFound {
        Accessorises updatedAccessorises = accesorisesRepository.findOne(accessorises.getId());
        if (updatedAccessorises == null)
            return null;
        updatedAccessorises.setName(accessorises.getName());
        updatedAccessorises.setPrice(accessorises.getPrice());
        updatedAccessorises.setStockNumber(accessorises.getStockNumber());
        updatedAccessorises.setImage(accessorises.getImage());
        updatedAccessorises.setType(accessorises.getType());
        updatedAccessorises.setPetType(accessorises.getPetType());
        return updatedAccessorises;
    }

    @Override
    @Transactional
    public Accessorises findById(int id) {
        return accesorisesRepository.findOne(id);
    }

    @Override
    @Transactional
    public boolean checkStock(List<Accessorises> accessorisesList, Accessorises accessorises) {
        Accessorises a = new Accessorises();
        for (int i = 0; i < accessorisesList.size(); i++) {
            if (accessorisesList.get(i).getId().equals(accessorises.getId())) {
                if (accessorises.getStockNumber() > a.getStockNumber()) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    @Transactional
    public List<Accessorises> addAccessorises(List<Accessorises> accessorisesList, Accessorises accessorises) {
        Accessorises a = new Accessorises();
        Accessorises a2 = new Accessorises();
        boolean exists = false;

        for (int i = 0; i < accessorisesList.size(); i++) {
            if (accessorisesList.get(i).getId().equals(accessorises.getId())) {
                exists = true;
                a = accessorisesList.get(i);
                a2 = accessorisesList.get(i);
                if (accessorises.getStockNumber() > a.getStockNumber()) {
                    a.setStockNumber(a.getStockNumber() + 1);
                }
            }
        }
        if (!exists) {
            accessorises.setStockNumber(1);
            accessorisesList.add(accessorises);
        } else {
            if (accessorises.getStockNumber() >= a.getStockNumber()) {
                accessorisesList.remove(a2);
                accessorisesList.add(a);
            }
        }
        return accessorisesList;
    }

    @Override
    @Transactional
    public List<Accessorises> deleteAccessorises(List<Accessorises> accessorisesList, Accessorises accessorises) {
        Accessorises a = new Accessorises();
        Accessorises a2 = new Accessorises();

        for (int i = 0; i < accessorisesList.size(); i++) {
            if (accessorisesList.get(i).getId().equals(accessorises.getId())) {
                a = accessorisesList.get(i);
                a2 = accessorisesList.get(i);
                if (a.getStockNumber() > 0) {
                    a.setStockNumber(a.getStockNumber() - 1);
                }
            }
        }
        if (a.getStockNumber() == 0) {
            accessorisesList.remove(a);
        } else {
            accessorisesList.remove(a2);
            accessorisesList.add(a);
        }
        return accessorisesList;
    }

    @Override
    @Transactional
    public boolean modifyStock(List<Accessorises> accessorisesList) throws AccesorisesNotFound {
        Accessorises a;
        for (Accessorises acc : accessorisesList) {
            a = accesorisesRepository.findOne(acc.getId());
            if (a.getStockNumber() - acc.getStockNumber() >= 0)
                a.setStockNumber(a.getStockNumber() - acc.getStockNumber());
            else return false;
            Accessorises check = update(a);
            if (check == null) {
                return false;
            }
        }
        return true;
    }

    @Override
    public String email(List<Accessorises> accessorisesList) {
        String message = "You purchased: \n\n";
        float total = 0;
        for (Accessorises acc : accessorisesList) {
            message += acc.getId() + " " + acc.getName() + " " + acc.getPrice() + "lei " + acc.getStockNumber() + "\n";
            total += acc.getPrice();
        }
        message += "\nTotal:  " + total;
        return message;
    }
}

