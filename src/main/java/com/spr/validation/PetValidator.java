package com.spr.validation;

import com.spr.model.Pet;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by Catalina on 5/10/2017.
 */
@Component
public class PetValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return Pet.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Pet pet = (Pet) target;
        final String CAT_TYPE = "cat";
        final String DOG_TYPE = "dog";

        Float price = pet.getPrice();

        ValidationUtils.rejectIfEmpty(errors, "name", "pet.name.empty");
        ValidationUtils.rejectIfEmpty(errors, "price", "pet.price.empty");
        ValidationUtils.rejectIfEmpty(errors, "race", "pet.race.empty");
        ValidationUtils.rejectIfEmpty(errors, "available", "pet.available.empty");
        ValidationUtils.rejectIfEmpty(errors, "type", "pet.type.empty");

        if (price < 0) {
            errors.rejectValue("price", "pet.price.notValid");
        }
        if (!(pet.getType().equals(CAT_TYPE) || pet.getType().equals(DOG_TYPE))) {
            errors.rejectValue("petType", "accessorises.petType.notValid");
        }

    }
}
