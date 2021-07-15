package com.spiderBookStall.CustomerController;

import com.spiderBookStall.CustomValidator.CustomerRegistrationValidator;
import com.spiderBookStall.CustomerDto.Book;
import com.spiderBookStall.CustomerDto.CustomerDetail;
import com.spiderBookStall.CustomerService.CustomerService;
import com.spiderBookStall.RestService.BookRestApiService;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.List;

@Controller
public class HomeController extends abstractController {
    @Autowired
    private BookRestApiService bookRestApiService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    @Qualifier("customerRegistrationValidator")
    private CustomerRegistrationValidator customerRegistrationValidator;

   /* @InitBinder
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
    }*/
    @RequestMapping(value = "/homePage", method = RequestMethod.GET)
    public String home(Model model, Principal principal) {

        logger.info("Inside Home Method ");
        /*if (principal != null) {
            model.addAttribute("objCustomer", customerService.getRecordById(principal.getName()));
        }*/
        List<Book> book=bookRestApiService.getALLBookRestData();
        /*List<Book> book2=bookRestApiService.getALLBookRestData2();*/

       /* if(book.isEmpty())
        {
            model.addAttribute("book","Book Data Not Found");
        }else{*/
            if(book.isEmpty())            {
                model.addAttribute("book","Book Data Not Found");
                /*model.addAttribute("restObject",book2);*/
            }else {
                model.addAttribute("restObject", book);
            }
        return "homePage";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String aboutUs() {
        logger.info("Inside AboutUs Method");

        return "aboutPage";
    }

    @RequestMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "logout", required = false) String logout,
                        Model model) {
        logger.info("Inside Login Method");
        if (error != null) {
            model.addAttribute("error", "INVALID USERNAME OR PASSWORD!");
        }
        if (logout != null) {
            model.addAttribute("msg", "YOU HAVE LOGGED OUT SUCCESSFULLY.");
        }

        return "loginPage";
    }

   /* @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(Model model) {

        logger.info("inside logout method");
        model.addAttribute("logout", "logout");

        return "logoutPage";
    }*/

    @RequestMapping("/Register")
    public String customerRegistration(Model model) {

        BasicConfigurator.configure();
        logger.info("Inside CustomerRegistration Method");
        model.addAttribute("registerObject", new CustomerDetail());

        return "customerRegistrationPage";
    }

    @RequestMapping(value = "/saveRegister", method = RequestMethod.POST)
    public String saveRegisterCustomer(@ModelAttribute("registerObject") CustomerDetail customerRegistration, BindingResult result, Model model) {

        logger.info("Inside saveRegisterCustomer Method");
        customerRegistrationValidator.validate(customerRegistration, result);
       /* int value = customerService.duplicateEntry(customerRegistration.getEmail());
        if (value > 0) {
            result.rejectValue("email", "email.errors.invalid", "Duplicate Entry Is Not Allowed Here");
        }*/
        if (result.hasErrors()) {

            return "customerRegistrationPage";
        }
        else{
                int result2=customerService.saveRegisteredCustomer(customerRegistration);
                if(result2>=1) {
                    return "redirect:/login";
                }else
                {
                    return "registrationFailed";
                }
            }
    }
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accessDenied(Principal principal,Model model1) {
        logger.info("Whenever Client Enter WrongPassword");
        ModelAndView model = new ModelAndView();
        if (principal != null) {
            model.addObject("msg", "Hi " + principal.getName()
                    + ", You can not access this page!");
        }
        model1.addAttribute("objCustomer", customerService.getRecordById(principal.getName()));
        model.setViewName("notFoundPage");
        return model;
    }
    @RequestMapping(value = "/denied", method = RequestMethod.POST)
    public String wrongCredential() {
        System.out.println("under denied");
        return "deniedPage";
    }


}


