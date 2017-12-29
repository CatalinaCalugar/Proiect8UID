package com.spr.repository;

import com.spr.model.Pet;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Catalina on 5/10/2017.
 */
public interface PetRepository extends JpaRepository<Pet,Integer> {
}
