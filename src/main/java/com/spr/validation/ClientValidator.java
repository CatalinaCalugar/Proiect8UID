package com.spr.validation;

import com.spr.model.Client;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Created by Catalina on 24.03.2017.
 */
@Component
public class ClientValidator implements Validator{

    private final static String CARD_NUMBER = "cardNumber";
    private final static String CNP = "cnp";

    @Override
    public boolean supports(Class<?> clazz) {
        return Client.class.isAssignableFrom(clazz);
    }


    /** The standard length of a CNP. */
    public static final int LENGTH = 13;

    private static final DateFormat CNP_DATE_FORMAT = new SimpleDateFormat("yyMMdd");

    private static byte[] CONTROL_VALUES = new byte[] {
            2, 7, 9, 1, 4, 6, 3, 5, 8, 2, 7, 9
    };

    private static int[] getDigits(String cnp) {
        int _cnp[] = new int[LENGTH];
        for (int i = 0; i < LENGTH; i++) {
            char c = cnp.charAt(i);
            if (!Character.isDigit(c)) {
                return null;
            }
            _cnp[i] = Character.digit(c, 10);
        }
        return _cnp;
    }

    private static int getControlSum(int[] twelveDigits) {
        int k = 0;
        for (int i = 0; i < 12; i++) {
            k += CONTROL_VALUES[i] * twelveDigits[i];
        }
        k %= 11;
        if (k == 10) {
            k = 1;
        }
        return k;
    }

    public static boolean validateCNP(String cnp) {
        return validateLength(cnp) && validateConsistency(cnp);
    }

    /** Returns if the given string represents a valid CNP conforming to length. */
    public static boolean validateLength(String cnp) {
        return cnp.length() == LENGTH;
    }

    /** Returns if the given string represents a valid CNP conforming to the control sum. */
    public static boolean validateConsistency(String cnp) {
        if (cnp.length() != LENGTH) {
            return false;
        }
        int[] _cnp = getDigits(cnp);
        if (_cnp == null) {
            return false;
        }
        int k = getControlSum(_cnp);
        if (_cnp[LENGTH - 1] != k) {
            return false;
        }
        return true;
    }

    /** Returns if the given string represents a valid CNP for the given birthdate.
     * The 2nd and the 3rd digits represent the last two digits from the year birthdate,
     * the 4th and 5th represent the month and the 7th and 8th the day.
     */
    public static boolean validateBirthdate(String cnp, Date birthdate) {
        return cnp.length() > 6 && cnp.substring(1, 7).equals(CNP_DATE_FORMAT.format(birthdate));
    }

    /** Returns if the given string represents a valid CNP. */
    public static boolean validateGender(String cnp, boolean male, Date birthdate) {
        if (cnp == null || cnp.length() < 1 || !Character.isDigit(cnp.charAt(0)))
            return false;
        int g1 = Character.digit(cnp.charAt(0), 10);
        Calendar c = new GregorianCalendar();
        c.setTime(birthdate);
        int g2 = c.get(Calendar.YEAR) < 2000
                ? male ? 1 : 2
                : male ? 5 : 6;
        return g1 == g2;
    }

    public boolean isValid(String cardNumber) {
        int sum = 0;
        boolean alternate = false;
        for (int i = cardNumber.length() - 1; i >= 0; i--) {
            int n = Integer.parseInt(cardNumber.substring(i, i + 1));
            if (alternate) {
                n *= 2;
                if (n > 9) {
                    n = (n % 10) + 1;
                }
            }
            sum += n;
            alternate = !alternate;
        }
        return (sum % 10 == 0);
    }

    public int countCharacters(String s){
        int k = 0;
        for(int i = 0; i< s.length();i++){
            k++;
        }
        return k;
    }

    @Override
    public void validate(Object target, Errors errors) {
        Client client = (Client) target;

        String cnp = client.getCNP();

        ValidationUtils.rejectIfEmpty(errors, "fname", "client.fname.empty");
        ValidationUtils.rejectIfEmpty(errors, "lname", "client.lname.empty");
        ValidationUtils.rejectIfEmpty(errors, "CNP", "client.CNP.empty");
        ValidationUtils.rejectIfEmpty(errors, "address", "client.address.empty");
        ValidationUtils.rejectIfEmpty(errors, "email", "client.email.empty");
        ValidationUtils.rejectIfEmpty(errors, "username", "client.username.empty");
        ValidationUtils.rejectIfEmpty(errors, "password", "client.password.empty");

        if(!validateCNP(cnp))
            errors.rejectValue(CNP,"client.CNP.notValid");
          }
}
