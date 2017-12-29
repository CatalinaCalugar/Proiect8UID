package com.spr.service;

import com.spr.exception.PaymentNotFound;
import com.spr.model.Payment;
import com.spr.repository.PaymentRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Catalina on 5/12/2017.
 */
@Service
public class PaymentServiceImpl implements PaymentService{
    @Resource
    private PaymentRepository paymentRepository;

    @Override
    @Transactional
    public Payment create(Payment payment) {
        Payment createdPayment= payment;
        return paymentRepository.save(createdPayment);
    }

    @Override
    @Transactional
    public Payment delete(int id) throws PaymentNotFound {
        Payment deletedPayment=paymentRepository.findOne(id);
        if(deletedPayment==null){
            throw new PaymentNotFound();
        }
        paymentRepository.delete(deletedPayment);
        return deletedPayment;
    }

    @Override
    @Transactional
    public List<Payment> findAll() {
        return paymentRepository.findAll();
    }

    @Override
    @Transactional
    public Payment update(Payment payment) throws PaymentNotFound {
        Payment updatedPayment= paymentRepository.findOne(payment.getId());
        if(updatedPayment==null)
            throw new PaymentNotFound();
        updatedPayment.setTotal(payment.getTotal());
        updatedPayment.setTransportMoney(payment.getTransportMoney());
        updatedPayment.setType(payment.getType());
        return updatedPayment;
    }

    @Override
    @Transactional
    public Payment findById(int id) {
        return paymentRepository.findOne(id);
    }
}
