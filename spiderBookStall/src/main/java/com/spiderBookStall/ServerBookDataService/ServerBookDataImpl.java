package com.spiderBookStall.ServerBookDataService;

import com.spiderBookStall.CustomerDto.Book;
import com.spiderBookStall.RestService.BookRestApiService;
import com.spiderBookStall.ServerBookDataDao.ServerDao;
import org.springframework.beans.factory.annotation.Required;

import java.util.List;
import java.util.Random;

public class ServerBookDataImpl implements BookRestApiService {

    private ServerDao serverDao;


    @Override
    public List<Book> getALLBookRestData() {
        return serverDao.getALLBookRestData2();
    }

    @Override
    public Book getBookById(String bookId) {
        return serverDao.getBookById2(bookId);
    }

    @Override
    public int saveClientBook(Book book) {
        Random random = new Random();
        int bookId = random.nextInt();
        String bookId1 = "cusBookId" + bookId;
        book.setBookId(bookId1);
        return serverDao.saveClientBook2(book);
    }

    @Override
    public List<Book> getAllSellerBook(String sellerName) {
        return serverDao.getAllSellerBook2(sellerName);
    }

    @Override
    public int deleteSellerBook(String bookId) {
        return serverDao.deleteSellerBook2(bookId);
    }

    @Override
    public int updateClientBook(Book book) {
        return serverDao.updateClientBook2(book);
    }

    public ServerDao getServerDao() {
        return serverDao;
    }
      @Required
    public void setServerDao(ServerDao serverDao) {
        this.serverDao = serverDao;
    }
}
