package com.spr.validation;

import com.spr.model.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by Dan on 26.03.2017.
 */
@Component
public class UserValidator implements Validator {

    final String EMPLOYEE_TYPE = "user";
    final String ADMIN_TYPE = "admin";
    final String CLIENT_TYPE = "client";
    final String DUMMY_TYPE = "client";

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        String type = user.getRole();

        ValidationUtils.rejectIfEmpty(errors, "name", "user.name.empty");
        ValidationUtils.rejectIfEmpty(errors, "username", "user.username.empty");
        ValidationUtils.rejectIfEmpty(errors, "password", "user.password.empty");

        if (!(type.equals(EMPLOYEE_TYPE) || type.equals(CLIENT_TYPE) || type.equals(ADMIN_TYPE) || type.equals(DUMMY_TYPE))) {
            errors.rejectValue("type", "user.type.notValid");

        }
    }

}