package com.spr.service;

import com.spr.exception.EmployeeNotFound;
import com.spr.model.Employee;

import java.util.List;

/**
 * Created by Dan on 26.03.2017.
 */
public interface EmployeeService {
    public Employee create(Employee employee);
    public Employee delete(int id) throws EmployeeNotFound;
    public List<Employee> findAll();
    public Employee update(Employee Employee) throws EmployeeNotFound;
    public Employee findById(int id);
    public Employee findByUsername(String username);
    public Boolean dupplicateEmployee(Employee employee);
}
