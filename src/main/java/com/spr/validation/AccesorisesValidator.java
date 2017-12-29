package com.spr.validation;

import com.spr.model.Accessorises;
import com.spr.model.Employee;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by Catalina on 5/10/2017.
 */
@Component
public class AccesorisesValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return Accessorises.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Accessorises accessorises = (Accessorises) target;
        final String CAT_TYPE = "cat";
        final String DOG_TYPE = "dog";

        Float price = accessorises.getPrice();
        Integer stock = accessorises.getStockNumber();
        String petType = accessorises.getPetType();

        ValidationUtils.rejectIfEmpty(errors, "name", "accessorises.name.empty");
        ValidationUtils.rejectIfEmpty(errors, "price", "accessorises.price.empty");
        ValidationUtils.rejectIfEmpty(errors, "type", "accessorises.type.empty");
        ValidationUtils.rejectIfEmpty(errors, "petType", "accessorises.petType.empty");
        ValidationUtils.rejectIfEmpty(errors, "stockNumber", "accessorises.stockNumber.empty");

        if (price < 0) {
            errors.rejectValue("price", "accessorises.price.notValid");
        }
        if (stock < 0) {
            errors.rejectValue("stockNumber", "accessorises.stockNumber.notValid");
        }

        if(!(petType.equals(CAT_TYPE) || petType.equals(DOG_TYPE))){
            errors.rejectValue("petType", "accessorises.petType.notValid");
        }

    }
}
