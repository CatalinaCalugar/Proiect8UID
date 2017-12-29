package com.spr.repository;

import com.spr.model.Contract;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Catalina on 5/10/2017.
 */
public interface ContractRepository extends JpaRepository<Contract,Integer> {
}
