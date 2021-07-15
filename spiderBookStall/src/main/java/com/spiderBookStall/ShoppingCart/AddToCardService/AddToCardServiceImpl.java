package com.spiderBookStall.ShoppingCart.AddToCardService;

import com.spiderBookStall.CustomerDto.Book;
import com.spiderBookStall.CustomerDto.Order;
import com.spiderBookStall.ShoppingCart.AddToCardDao.AddToCardDao;
import org.springframework.beans.factory.annotation.Autowired;

import java.security.Principal;
import java.util.List;
import java.util.Random;

public class AddToCardServiceImpl implements AddToCardService {
    @Autowired
    private AddToCardDao addToCardDao;
    @Override
    public int saveBookToCart(Book book) {
        /*Random rn=new Random();
        int cardId=rn.nextInt();
        String CardId="Card"+cardId;
        book.setCardId(CardId);*/
        return addToCardDao.saveBookToCart(book);
    }

    @Override
    public List<Book> getListBookFromTheCart(String sellerName) {
        return addToCardDao.getListBookFromTheCart(sellerName);
    }

    @Override
    public int deleteCartBook(String BookId) {
        return addToCardDao.deleteCartBook(BookId);
    }

    @Override
    public Order saveOrder(Order order, Principal principal) {
        Random random = new Random();
        int orderId = random.nextInt();
        order.setOderId(orderId);
        String UserId = principal.getName();
        order.setUserId(UserId);
        return addToCardDao.saveOrder(order,principal);
    }

    @Override
    public int deleteAllCardBook(String mailId) {
        return addToCardDao.deleteAllCardBook(mailId);
    }
}
