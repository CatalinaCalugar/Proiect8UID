package com.spr.repository;

import com.spr.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Catalina on 24.03.2017.
 */
public interface ClientRepository extends JpaRepository<Client,Integer> {
}
