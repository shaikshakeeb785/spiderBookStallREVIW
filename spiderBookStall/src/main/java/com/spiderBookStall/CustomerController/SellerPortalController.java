package com.spiderBookStall.CustomerController;


import com.spiderBookStall.CustomerDto.Book;
import com.spiderBookStall.CustomerService.CustomerService;
import com.spiderBookStall.RestService.BookRestApiService;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestClientException;


import javax.validation.Valid;
import java.security.Principal;
import java.util.List;


@Controller
public class SellerPortalController extends abstractController {

    @Autowired
    private BookRestApiService bookRestApiService;
   /* @Autowired
    private CustomerService customerService;*/

    /*@InitBinder
    public void InitBinder(WebDataBinder binder) {
        StringTrimmerEditor trimmerEditor = new StringTrimmerEditor(false);
        binder.registerCustomEditor(String.class, "bookPrice", trimmerEditor);
        binder.registerCustomEditor(String.class, "bookName", trimmerEditor);
        binder.registerCustomEditor(String.class, "bookAuthor", trimmerEditor);
        binder.registerCustomEditor(String.class, "bookPublishDate", trimmerEditor);
        binder.registerCustomEditor(String.class, "sellerName", trimmerEditor);
        binder.registerCustomEditor(String.class, "publication", trimmerEditor);
    }*/
    @RequestMapping(value = "/sellerPortal", method = RequestMethod.GET)
    public String sellerBookPortal(Principal principal,Model model) {
        /*model.addAttribute("objCustomer1", customerService.getRecordById(principal.getName()));*/
        logger.info("Inside sellerBookPortal Method");

        return "sellerPortal";
    }
    @RequestMapping(value = "/addBook", method = RequestMethod.GET)
    public String addBook(Principal principal, Model model) {
        /*model.addAttribute("objCustomer", customerService.getRecordById(principal.getName()));*/
        logger.info("Inside addBook Method");
        Book book = new Book();
        model.addAttribute("book", book);
        model.addAttribute("principalObject", principal.getName());

        return "addBookPage";
    }
    @RequestMapping(value = "/clientBookObject", method = RequestMethod.POST)
    public String saveBook(@Valid @ModelAttribute("book") Book book, BindingResult result, Principal principal, Model model) {

        logger.info("Inside saveBook Method");
        if (result.hasErrors()) {
            /*model.addAttribute("objCustomer", customerService.getRecordById(principal.getName()));*/
            return "addBookPage";
        } else {
            System.out.println(book.toString());
            int result1 = bookRestApiService.saveClientBook(book);
            /*int result2 = bookRestApiService.saveClientBook2(book);*/
            if (result1 >= 1) {
                String sellerName = principal.getName();
                model.addAttribute("sellerName", sellerName);

                return "redirect:/listOfBook/{sellerName}";
            } else {
                model.addAttribute("notSaved","book is not saved");
                return "errorPage";
            }

        }
    }
    @RequestMapping(value = "/listOfBook/{sellerName}", method = RequestMethod.GET)
    public String getListOfBook(@PathVariable("sellerName") String sellerName,Principal principal, Model model) {
        logger.info("Inside getListOfBook Method");
        if((sellerName+".com").equals(principal.getName())) {
            List<Book> book = bookRestApiService.getAllSellerBook(sellerName);
            /*List<Book> book2 = bookRestApiService.getAllSellerBook2(sellerName);*/
            System.out.println(book + ": CLIENT SIDE :sellerBooks");
            model.addAttribute("sellerBook", book);
            /*model.addAttribute("sellerBook", book2);*/
            /*model.addAttribute("objCustomer2", customerService.getRecordById(principal.getName()));*/
            if (book.isEmpty()) {
                return "noSellerBook";
            } else {
                return "listOfSellerBook";
            }
        }else {
            model.addAttribute("msg","you do not access the data of this seller id'"+(sellerName+".com")+"");
            return "errorPage";
        }
    }
    @RequestMapping(value = "/deleteSellerBook/{bookId}", method = RequestMethod.GET)
    public String deleteSellerBook(@PathVariable("bookId") String bookId, Principal principal, Model model) {

        logger.info("Inside deleteSellerBook Method");
        int result = bookRestApiService.deleteSellerBook(bookId);
        /*int result2 = bookRestApiService.deleteSellerBook2(bookId);*/
        String sellerName = principal.getName();
        model.addAttribute("sellerName", sellerName);
        if (result >= 1) {
            return "redirect:/listOfBook/{sellerName}";

        } else {
            return "error";
        }
    }
    @RequestMapping(value = "/updateSellerBook/{bookId}", method = RequestMethod.GET)
    public String updateSellerBook(@PathVariable("bookId") String bookId, Model model) {

        logger.info("Inside updateSellerBook Method");
        try{
            Book book1=bookRestApiService.getBookById(bookId);
            if(book1!=null)
            {
                model.addAttribute("bookObject",book1 );
                return "updateSellerBookPage";
            }
            model.addAttribute("msg","hey you not edit book for this id:'"+bookId+"'" );
           return "errorPage";

        } catch (NullPointerException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
            return "errorPage";
        }
    }
    @RequestMapping(value = "/updatedClientBook", method = RequestMethod.POST)
    public String updatedClientBook(@Valid @ModelAttribute("bookObject") Book book,BindingResult bindingResult, Principal principal, Model model) {
        if (bindingResult.hasErrors()) {
            /*model.addAttribute("objCustomer", customerService.getRecordById(principal.getName()));*/
            return "updateSellerBookPage";
        }
        try {
            int result = bookRestApiService.updateClientBook(book);
            /*int result2 = bookRestApiService.updateClientBook2(book);*/
            if (result >= 1) {
                model.addAttribute("sellerId", principal.getName());
                return "redirect:/listOfBook/{sellerId}";
            }
        } catch (EmptyResultDataAccessException|NullPointerException e) {
            logger.error("EmptyResultDataAccessException" + e.getMessage());
        }
        return "error";

    }
}
