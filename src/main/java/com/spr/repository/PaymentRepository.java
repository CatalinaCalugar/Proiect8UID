package com.spr.repository;

import com.spr.model.Accessorises;
import com.spr.model.Payment;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Catalina on 5/12/2017.
 */
public interface PaymentRepository extends JpaRepository<Payment,Integer> {
}
