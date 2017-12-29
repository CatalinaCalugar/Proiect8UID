package com.spr.validation;

import com.spr.model.Contract;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by Catalina on 5/10/2017.
 */
@Component
public class ContractValidator implements Validator{

    @Override
    public boolean supports(Class<?> clazz) {
        return Contract.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Contract contract = (Contract) target;

        ValidationUtils.rejectIfEmpty(errors, "date", "contract.date.empty");
        ValidationUtils.rejectIfEmpty(errors, "description", "contract.description.empty");
    }
}
