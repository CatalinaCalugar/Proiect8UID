package com.spr.service;

import com.spr.exception.ContractNotFound;
import com.spr.model.Contract;
import com.spr.repository.ContractRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Catalina on 5/10/2017.
 */
@Service
public class ContractServiceImpl implements ContractService{
    @Resource
    private ContractRepository contractRepository;

    @Override
    @Transactional
    public Contract create(Contract contract) {
        Contract createdContract= contract;
        return contractRepository.save(createdContract);
    }

    @Override
    @Transactional
    public Contract delete(int id) throws ContractNotFound {
        Contract deletedContract=contractRepository.findOne(id);
        if(deletedContract==null){
            throw new ContractNotFound();
        }
        contractRepository.delete(deletedContract);
        return deletedContract;
    }

    @Override
    @Transactional
    public List<Contract> findAll() {
        return contractRepository.findAll();
    }

    @Override
    @Transactional
    public Contract update(Contract contract) throws ContractNotFound {
        Contract updatedContract= contractRepository.findOne(contract.getId());
        if(updatedContract==null)
            throw new ContractNotFound();
        updatedContract.setDate(contract.getDate());
        return updatedContract;
    }

    @Override
    @Transactional
    public Contract findById(int id) {
        return contractRepository.findOne(id);
    }
}
