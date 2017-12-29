package com.spr.service;

import com.spr.exception.ContractNotFound;
import com.spr.model.Contract;

import java.util.List;

/**
 * Created by Catalina on 5/10/2017.
 */
public interface ContractService {
    public Contract create(Contract contract);
    public Contract delete(int id) throws ContractNotFound;
    public List<Contract> findAll();
    public Contract update(Contract Contract) throws ContractNotFound;
    public Contract findById(int id);
}
