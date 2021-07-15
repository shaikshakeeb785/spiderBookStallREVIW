package com.spiderBookStall.ShoppingCart.AddToCardDao;

import com.spiderBookStall.CustomerDto.Book;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RowMapperBook implements RowMapper {
    @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        Book book=new Book();
        book.setBookId(resultSet.getString(1));
        book.setBookName(resultSet.getString(2));
        book.setBookAuthor(resultSet.getString(3));
        book.setBookPrice(resultSet.getString(4));
        book.setBookPublishDate(resultSet.getString(5));
        book.setSellerName(resultSet.getString(6));
        book.setPublication(resultSet.getString(7));

      return book;
    }
}
