package com.spiderBookStall.CustomerController;

import com.spiderBookStall.CustomValidator.CustomerRegistrationValidator;
import com.spiderBookStall.CustomerDto.Book;
import com.spiderBookStall.CustomerDto.CustomerDetail;
import com.spiderBookStall.CustomerDto.Order;
import com.spiderBookStall.CustomerService.CustomerService;
import com.spiderBookStall.RestService.BookRestApiService;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;


@Controller
public class CustomerController extends abstractController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private BookRestApiService bookRestApiService;


    @Autowired
    @Qualifier("customerRegistrationValidator")
    private CustomerRegistrationValidator customerRegistrationValidator;

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String getProfile(Principal principal, Model model) {
            logger.info("Inside getRecordById Method");
            try {
                CustomerDetail customerDetail1 = customerService.getProfile(principal.getName());
                model.addAttribute("customerDetail1", customerDetail1);
                return "profilePage";

            } catch (EmptyResultDataAccessException|NullPointerException e) {
                model.addAttribute("error", "Profile is NotFound For searched Id");
                e.printStackTrace();
            }
            return "profilePage";
        }
    @RequestMapping(value = "/buyBook/{bookID}", method = RequestMethod.GET)
    public String buyBook(@PathVariable("bookID") String bookID, Principal principal, Model model) {

        logger.info("Inside buyBook method ");
        try {
            Book book=bookRestApiService.getBookById(bookID);
            /*Book book2=bookRestApiService.getBookById2(bookID);*/
            if(book!=null) {
               /* CustomerDetail customerDetail = customerService.getRecordById(principal.getName());
                model.addAttribute("customerDetail", customerDetail);*/
                model.addAttribute("bookId", bookID);
                model.addAttribute("order",new Order());
                return "checkOutPage";
            }
        } catch (NullPointerException e) {
            logger.error("orderedPlaced Failed");
            e.printStackTrace();
        }
        model.addAttribute("notFound", "hey, you doNot BUY this book(bookID:'"+bookID+"') from checkoutPage please go to home and try again!:'");
        return "error";
    }
    @RequestMapping("/orderPlaced/{bookId}")
    public String oderPlaced(@Valid @ModelAttribute("order") Order order,BindingResult bindingResult , @PathVariable("bookId") String bookId, Principal principal, Model model) {

        if(bindingResult.hasErrors())
        {
           /* CustomerDetail customerDetail = customerService.getRecordById(principal.getName());
            model.addAttribute("customerDetail", customerDetail);*/
            return "checkOutPage";
        }
        logger.info("Inside BuyBook Method ");
        Book book=bookRestApiService.getBookById(bookId);
        /*Book book2=bookRestApiService.getBookById2(bookId);*/
       if(book!=null) {
           model.addAttribute("order", order);
           model.addAttribute("bookObject1", bookRestApiService.getBookById(bookId));
           /*model.addAttribute("bookObject1", bookRestApiService.getBookById2(bookId));*/
           try {
               int result = customerService.saveOrder(order,bookId,principal);
               if (result >= 1) {
                   logger.info("orderedPlaced successfully");

                   return "orderPlacedPage";
               }
           } catch (EmptyResultDataAccessException e) {
               logger.error("orderedPlaced Failed");
               model.addAttribute("order", "orderedPlaced Failed");
               e.printStackTrace();
           }
           return "error";
       }
       else
       {
           model.addAttribute("notFound", "hey, you doNot BUY this book(bookID:'"+bookId+"') from checkoutPage please go to home and try again!:'");
           return "error";
       }
    }
    @RequestMapping("/editCustomer")
    public String updateProfile(Principal principal,Model model) {
            logger.info("Inside UpdateProfile Method ");
            try {
                CustomerDetail customerObject = customerService.getProfile(principal.getName());
                if (customerObject != null) {
                    model.addAttribute("customerObject", customerObject);
                    return "updatePage";
                }
            } catch (NullPointerException | EmptyResultDataAccessException e) {
                e.printStackTrace();
                logger.error("exception" + e.getMessage());
                model.addAttribute("mes5", "Profile data not found!!! FOR ID:'" + principal.getName() + "'");
            }
            return "error";
        }
    @RequestMapping(value = "/saveUpdate", method = RequestMethod.POST)
    public String updatedProfile(@ModelAttribute("customerObject") CustomerDetail detail,BindingResult result1,Principal principal, Model model) {
        detail.setEmail(principal.getName());
        logger.info("Inside saveRegisterCustomer Method");
        customerRegistrationValidator.validate(detail, result1);
        if (result1.hasErrors()) {

            return "updatePage";
        }
        try {
            logger.info(principal.getName());
            int result = customerService.updateProfile(detail);
            if (result >= 1) {
                logger.info("profile updated successFully");
                return "redirect:/profile";
            }
        } catch (EmptyResultDataAccessException e) {
            logger.error("profile not updated");
            model.addAttribute("mes5", "Profile Not Updated");
        }

        return "error";
    }

}
