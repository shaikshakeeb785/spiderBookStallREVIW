package com.spiderBookStall.ServerBookDataDao;

import com.spiderBookStall.CustomerDto.Book;

import java.util.List;

public interface ServerDao
{
    public List<Book> getALLBookRestData2();

    /**
     * @return book object
     */
    public Book getBookById2(String bookId);

    /**
     * customer can sell the book
     *
     * @param book book object of customer
     * @return no of record is effect in server side database and return Book Object
     */
    public int saveClientBook2(Book book);

    /**
     * getting all seller book by using sellerName
     *
     * @param sellerName id of seller
     * @return list of sellerBook by using sellerName
     */
    public List<Book> getAllSellerBook2(String sellerName);

    /**
     * delete seller Book by using BookId
     *
     * @param bookId seller BookId
     * @return
     */
    public int deleteSellerBook2(String bookId);

    /**
     * updating client Book by using BookId;
     *
     * @param book
     * @return no of record is effected into the server return integer value
     */
    public int updateClientBook2(Book book);
}
