package com.spr.repository;

import com.spr.model.Adoption;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Catalina on 5/10/2017.
 */
public interface AdoptionRepository extends JpaRepository<Adoption,Integer> {
}
