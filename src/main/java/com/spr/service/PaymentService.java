package com.spr.service;

import com.spr.exception.PaymentNotFound;
import com.spr.model.Payment;

import java.util.List;

/**
 * Created by Catalina on 5/12/2017.
 */
public interface PaymentService {
    public Payment create(Payment payment);
    public Payment delete(int id) throws PaymentNotFound;
    public List<Payment> findAll();
    public Payment update(Payment Payment) throws PaymentNotFound;
    public Payment findById(int id);
}
