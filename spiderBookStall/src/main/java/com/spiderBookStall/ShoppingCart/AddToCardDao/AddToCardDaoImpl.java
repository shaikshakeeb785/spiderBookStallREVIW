package com.spiderBookStall.ShoppingCart.AddToCardDao;


import com.spiderBookStall.CustomerDto.Book;
import com.spiderBookStall.CustomerDto.Order;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import java.security.Principal;
import java.util.List;

public class AddToCardDaoImpl implements AddToCardDao {
    private JdbcTemplate jdbcTemplate;
    @Override
    public int saveBookToCart(Book book) {
        int result=0;
        String query = "insert into book(bookId,bookName,bookAuthor,bookPrice,bookPublishDate,sellerName,publication) values(?,?,?,?,?,?,?)";
        try{
            result = this.jdbcTemplate.update(query, book.getBookId(), book.getBookName(), book.getBookAuthor(), book.getBookPrice(), book.getBookPublishDate(), book.getSellerName(), book.getPublication());
            return result;
        }catch (DataAccessException e)
        {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public List<Book> getListBookFromTheCart(String sellerName) {
        String query = "select * from book where sellerName='"+sellerName+"'";
        try{
            List<Book> listBook = this.jdbcTemplate.query(query, new RowMapperBook());
            return listBook;
        } catch (DataAccessException e) {

            e.printStackTrace();
        }
        return null;    }

    @Override
    public int deleteCartBook(String BookId) {
        int result=0;
        String query = "delete from book where bookId=?";
        try {
            result = this.jdbcTemplate.update(query, BookId);
            return result;
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public Order saveOrder(Order order, Principal principal) {
        int result = 0;
        String query = "insert into book.order values(?,?,?,?)";
        try {
            result = this.jdbcTemplate.update(query, order.getUserId(), order.getOderId(), order.getProductID(), order.getPaymentMethod());
            return order;
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int deleteAllCardBook(String mailId) {
        int result=0;
        String query = "delete from book where sellerName=?";
        try {
            result = this.jdbcTemplate.update(query,mailId);
            return result;
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        return result;    }

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
