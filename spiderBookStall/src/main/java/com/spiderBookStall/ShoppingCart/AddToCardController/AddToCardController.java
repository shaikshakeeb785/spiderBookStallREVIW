package com.spiderBookStall.ShoppingCart.AddToCardController;

import com.spiderBookStall.CustomerController.abstractController;
import com.spiderBookStall.CustomerDto.Book;
import com.spiderBookStall.CustomerDto.Order;
import com.spiderBookStall.CustomerService.CustomerService;
import com.spiderBookStall.RestService.BookRestApiService;
import com.spiderBookStall.ShoppingCart.AddToCardDto.Item;
import com.spiderBookStall.ShoppingCart.AddToCardDto.ShoppingCart;
import com.spiderBookStall.ShoppingCart.AddToCardService.AddToCardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
public class AddToCardController extends abstractController {
    @Autowired
    private BookRestApiService bookRestApiService;
    @Autowired
    private AddToCardService addToCardService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(@RequestParam("bookId") String bookId, Principal principal,Model model) {
        Book book = bookRestApiService.getBookById(bookId);
        try{
            book.setSellerName(principal.getName());
            addToCardService.saveBookToCart(book);
            model.addAttribute("book1",book);
            return "redirect:/getAllCartBook";
        } catch (NullPointerException e) {
            e.printStackTrace();
             model.addAttribute("bookInfo","DATA NOT FOUND");
        }
     return "error";
    }
    @RequestMapping(value = "/getAllCartBook",method = RequestMethod.GET)
    public String getALLCartBook(Principal principal, Model model)
    {
        try {
            List<Book> lstBook=addToCardService.getListBookFromTheCart(principal.getName());
            model.addAttribute("lstOfBook",lstBook);
            return "cart";
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        return "error";


    }

    @RequestMapping(value = "delete/{bookId}",method = RequestMethod.GET)
    public String deleteCartBook(@PathVariable("bookId") String bookId,Model model)
    {
        model.addAttribute("bookId",bookId);
        addToCardService.deleteCartBook(bookId);
        return "redirect:/getAllCartBook";
    }
    @RequestMapping(value = "/orderPlaced/{total}",method = RequestMethod.GET)
    public String orderPlaced(@ModelAttribute("order") Order order,@PathVariable("total") Integer total,Principal principal,Model model)
    {
        if(total!=0) {
            Order order1 = addToCardService.saveOrder(order, principal);
            model.addAttribute("order", order1);
            model.addAttribute("total", total);
            addToCardService.deleteAllCardBook(principal.getName());
            return "orderPlacedPageCart";
        }else {
            model.addAttribute("cardError","There Is No Book Added To Cart please add single item and place order");
            return "error";
        }
    }







}
