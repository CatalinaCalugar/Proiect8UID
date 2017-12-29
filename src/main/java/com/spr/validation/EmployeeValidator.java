package com.spr.validation;

import com.spr.model.Employee;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by Dan on 26.03.2017.
 */
@Component
public class EmployeeValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return Employee.class.isAssignableFrom(clazz);
    }

    final String EMPLOYEE_TYPE = "user";
    final String ADMIN_TYPE = "admin";
    final String CLIENT_TYPE = "client";
    final String DUMMY_TYPE = "client";

    @Override
    public void validate(Object target, Errors errors) {
        Employee employee = (Employee) target;
        String type = employee.getRole();

        ValidationUtils.rejectIfEmpty(errors, "name", "employee.name.empty");
        ValidationUtils.rejectIfEmpty(errors, "username", "employee.username.empty");
        ValidationUtils.rejectIfEmpty(errors, "password", "employee.password.empty");

        if (!(type.equals(EMPLOYEE_TYPE) || type.equals(CLIENT_TYPE) || type.equals(ADMIN_TYPE) || type.equals(DUMMY_TYPE))){
            errors.rejectValue("type", "employee.type.notValid");

        }
    }

}