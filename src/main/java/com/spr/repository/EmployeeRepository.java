package com.spr.repository;

import com.spr.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Dan on 26.03.2017.
 */
public interface EmployeeRepository  extends JpaRepository<Employee,Integer> {
}
