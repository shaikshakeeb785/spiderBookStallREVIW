package com.spiderBookStall.CustomValidator;

import com.spiderBookStall.CustomerDto.Book;
import com.spiderBookStall.CustomerDto.CustomerDetail;
import com.spiderBookStall.CustomerService.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.security.Principal;


public class CustomerRegistrationValidator implements Validator {


    private CustomerService customerService;


    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }

    @Override
    public void validate(Object o, Errors errors) {
        CustomerDetail customerRegistration = (CustomerDetail) o;
        validateCustomerFirstName(customerRegistration.getFirstName(), errors);
        validateCustomerEmail(customerRegistration.getEmail(), errors);
        validateCustomerPassword(customerRegistration.getPassword(), errors);
        validateCustomerRePassword(customerRegistration.getRePassword(), customerRegistration.getPassword(), errors);
        validateCustomerContact(customerRegistration.getContact(), errors);
        validateCustomerDob(customerRegistration.getDob(), errors);
        validateCustomerAddressLine1(customerRegistration.getAddressLine1(), errors);
        validateCustomerCity(customerRegistration.getCity(), errors);
        validateCustomerState(customerRegistration.getState(), errors);
        validateCustomerPin(customerRegistration.getPinCode(), errors);



    }
    private void validateCustomerPin(String pinCode1, Errors errors) {

        if (pinCode1.isEmpty()) {
            errors.rejectValue("pinCode", "pinCode.errors", "pinCode should Not  empty");
        } else if (!pinCode1.matches("^[1-9][0-9]{5}$")) {
            errors.rejectValue("pinCode", "pinCode.errors", "INVALID pinCode");
        }
    }

    private void validateCustomerFirstName(String firstName, Errors errors) {
        if (firstName.isEmpty()) {
            errors.rejectValue("firstName", "firstName.errors", "firstName should Not  empty");
        } else if (!firstName.matches("[A-Za-z0-9_]+")) {
            errors.rejectValue("firstName", "firstName.errors");
        }
    }

    private void validateCustomerState(String state, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "state", "state.errors", "*state cannot be empty");
    }

    private void validateCustomerCity(String city, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "city", "city.errors", "*city cannot be empty");

    }

    private void validateCustomerAddressLine2(String addressLine2, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "addressLine2", "addressLine2.errors", "*addressLine2 cannot be empty");

    }

    private void validateCustomerAddressLine1(String addressLine1, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "addressLine1", "addressLine1.errors", "*addressLine1 cannot be empty");

    }

    private void validateCustomerDob(String dob, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dob", "dob.errors", "*dob cannot be empty");

    }

    private void validateCustomerContact(String contact, Errors errors) {
        if (contact.isEmpty()) {
            errors.rejectValue("contact", "contact.error", "contact should Not  empty");
        } else if (!contact.matches("^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$")) {
            errors.rejectValue("contact", "contact.errors", "INVALID contact");
        }
    }

    private void validateCustomerPassword(String password, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "password.errors", "*password cannot be empty");

    }

    private void validateCustomerRePassword(String rePassword, String Password, Errors errors) {
        if (!rePassword.equals(Password)) {
            errors.rejectValue("rePassword", "rePassword.errors", "*Password MisMatch please chech you password");

        }
    }

    private void validateCustomerEmail(String email, Errors errors) {
        int value = customerService.duplicateEntry(email);
        if (value > 0) {
            errors.rejectValue("email", "email.errors.invalid", "Duplicate Entry Is Not Allowed Here");
        }
        else if (email.isEmpty()) {
            errors.rejectValue("email", "email.error", "Email should Not  empty");
        } else if (!email.matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")) {
            errors.rejectValue("email", "email.errors", "INVALID MailId");
        }
    }


    public CustomerService getCustomerService() {
        return customerService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }
}
