package com.spiderBookStall.ShoppingCart.AddToCardDao;

import com.spiderBookStall.CustomerDto.Book;
import com.spiderBookStall.CustomerDto.Order;

import java.security.Principal;
import java.util.List;

public interface AddToCardDao {

    public int saveBookToCart(Book book);
    public List<Book> getListBookFromTheCart(String sellerName);
    public int deleteCartBook(String BookId);
    public Order saveOrder(Order order, Principal principal);
    public int deleteAllCardBook(String mailId);


}
