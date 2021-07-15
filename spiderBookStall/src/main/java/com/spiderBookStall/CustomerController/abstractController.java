package com.spiderBookStall.CustomerController;

import com.spiderBookStall.CustomerDto.CustomerDetail;
import com.spiderBookStall.CustomerService.CustomerService;


import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.security.Principal;

public abstract class abstractController {
    public static final Logger logger = LogManager.getLogger(abstractController.class);

    @Autowired
    private CustomerService customerService;
    @ModelAttribute("customerDetail")
    public CustomerDetail getAllData(Principal principal)
    {
        BasicConfigurator.configure();
        if(principal!=null)
        {
        CustomerDetail customerDetail = customerService.getProfile(principal.getName());
        return customerDetail;
        }
        return null;
    }
    /*@ModelAttribute*/
    /*public void getBasicConfigurations(){BasicConfigurator.configure();}*/
    @InitBinder
    public void InitBinder(WebDataBinder binder) {
        StringTrimmerEditor trimmerEditor = new StringTrimmerEditor(false);
        binder.registerCustomEditor(String.class, "email", trimmerEditor);
        binder.registerCustomEditor(String.class, "password", trimmerEditor);
        binder.registerCustomEditor(String.class, "rePassword", trimmerEditor);
        binder.registerCustomEditor(String.class, "contact", trimmerEditor);
        binder.registerCustomEditor(String.class, "dob", trimmerEditor);
        binder.registerCustomEditor(String.class, "addressLine1", trimmerEditor);
        binder.registerCustomEditor(String.class, "addressLine2", trimmerEditor);
        binder.registerCustomEditor(String.class, "city", trimmerEditor);
        binder.registerCustomEditor(String.class, "state", trimmerEditor);
        binder.registerCustomEditor(String.class, "pinCode", trimmerEditor);
        binder.registerCustomEditor(String.class, "bookPrice", trimmerEditor);
        binder.registerCustomEditor(String.class, "bookName", trimmerEditor);
        binder.registerCustomEditor(String.class, "bookAuthor", trimmerEditor);
        binder.registerCustomEditor(String.class, "bookPublishDate", trimmerEditor);
        binder.registerCustomEditor(String.class, "sellerName", trimmerEditor);
        binder.registerCustomEditor(String.class, "publication", trimmerEditor);
    }


}
