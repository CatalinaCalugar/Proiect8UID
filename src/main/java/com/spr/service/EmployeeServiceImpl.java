package com.spr.service;

import com.spr.exception.EmployeeNotFound;
import com.spr.model.Employee;
import com.spr.repository.EmployeeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Dan on 26.03.2017.
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Resource
    private EmployeeRepository employeeRepository;

    @Override
    @Transactional
    public Employee create(Employee employee) {
        Employee createdEmployee= employee;
        return employeeRepository.save(createdEmployee);
    }

    @Override
    @Transactional
    public Employee delete(int id) throws EmployeeNotFound {
        Employee deletedEmployee=employeeRepository.findOne(id);
        if(deletedEmployee==null){
            throw new EmployeeNotFound();
        }
        employeeRepository.delete(deletedEmployee);
        return deletedEmployee;
    }

    @Override
    @Transactional
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    @Transactional
    public Employee update(Employee employee) throws EmployeeNotFound {
        Employee updatedEmployee= employeeRepository.findOne(employee.getId());
        if(updatedEmployee==null)
            throw new EmployeeNotFound();
        updatedEmployee.setName(employee.getName());
        updatedEmployee.setUsername(employee.getUsername());
        updatedEmployee.setPassword(employee.getPassword());
        return updatedEmployee;
    }

    @Override
    @Transactional
    public Employee findById(int id) {
        return employeeRepository.findOne(id);
    }

    @Override
    @Transactional
    public Employee findByUsername(String username) {
        List<Employee> employees= findAll();
        for(Employee employee:employees){
            if(employee.getUsername().equals(username))
                return employee;
        }
        return  null;
    }

    @Override
    public Boolean dupplicateEmployee(Employee employee) {
        List<Employee> allEmployees = employeeRepository.findAll();
        for (Employee e : allEmployees) {
            if (employee.getUsername().equals(e.getUsername())) {
                return true;
            }
        }
        return false;
    }
}