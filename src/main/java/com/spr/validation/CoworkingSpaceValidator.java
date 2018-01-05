package com.spr.validation;

import com.spr.model.CoworkingSpace;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by cata_ on 1/5/2018.
 */
@Component
public class CoworkingSpaceValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return CoworkingSpace.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        CoworkingSpace coworkingSpace = (CoworkingSpace) target;

        //ValidationUtils.rejectIfEmpty(errors, "date", "coworkingSpace.date.empty");
       // ValidationUtils.rejectIfEmpty(errors, "description", "coworkingSpace.description.empty");
    }
}
