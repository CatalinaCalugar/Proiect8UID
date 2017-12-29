package com.spr.utils;


import com.spr.model.Contract;
import com.spr.model.Employee;

/**
 * Created by Catalina on 14.04.2017.
 */
public interface Report {
    public void generate(Contract contract, Employee client, Float total);
}
