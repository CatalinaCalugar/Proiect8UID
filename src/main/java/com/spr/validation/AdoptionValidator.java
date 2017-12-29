package com.spr.validation;

import com.spr.model.Adoption;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by Catalina on 5/10/2017.
 */
@Component
public class AdoptionValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return Adoption.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Adoption adoption = (Adoption) target;

        ValidationUtils.rejectIfEmpty(errors, "idPet", "adoption.idPet.empty");
        ValidationUtils.rejectIfEmpty(errors, "idClient", "adoption.idClient.empty");
        ValidationUtils.rejectIfEmpty(errors, "adoptionDate", "adoption.adoptionDate.empty");
        ValidationUtils.rejectIfEmpty(errors, "idEmployee", "adoption.idEmployee.empty");

    }
}
