package com.spiderBookStall.RestService;

import com.spiderBookStall.CustomerController.CustomerController;
import com.spiderBookStall.CustomerDto.Book;
import com.spiderBookStall.ServerBookDataDao.ServerDao;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.annotation.Primary;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;


import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

/**
 * implementation for {@link BookRestApiService}
 */

public class BookRestApiServiceImpl implements BookRestApiService {

    private static String REST_SERVICE_URL="http://localhost:8081/SpiderBookStore_war_exploded";
    private static final Logger logger = LogManager.getLogger(CustomerController.class);
    private RestTemplate restTemplate;
    /*private ServerDao serverDao;*/

    @Override
    public List<Book> getALLBookRestData() {

        BasicConfigurator.configure();
        logger.info("Inside getALLBookRestData Method which written All Server Side Book in Json Form");
        String url = REST_SERVICE_URL+"/getAllBooksJson";
        try {
            ResponseEntity<Book[]> responseEntity = restTemplate.getForEntity(url, Book[].class);
            if (responseEntity.getBody() != null) {
                return Arrays.asList(responseEntity.getBody());
            }
        } catch (RestClientException e) {
            logger.error("Exception while rest data:" + e.getMessage());
            e.printStackTrace();
        }
        return Collections.emptyList();
    }
    @Override
    public Book getBookById(String bookId) {
        Book book = null;
        logger.info("Inside getBookById Method which written Particular Book Based On BookId/BookName From server");
        String url = REST_SERVICE_URL+"/getByIdJsonData?bookId=" + bookId;
        try {
            book = restTemplate.getForObject(url, Book.class);
            return book;
        } catch (RestClientException e) {
            logger.error("Exception while rest data" + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
    @Override
    public int saveClientBook(Book book) {
        Random random = new Random();
        int bookId = random.nextInt();
        String bookId1 = "cusBookId" + bookId;
        book.setBookId(bookId1);
        int result = 0;
        logger.info("Inside saveClientBook Method Which Add The SellerBook To The Server");
        String url = REST_SERVICE_URL+"/clientBookObject";
        try {
            result = getRestTemplate().postForObject(url, book, Integer.class);
            logger.info("result" + result);
            return result;
        } catch (RestClientException e) {
            logger.error("Exception while rest data" + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }
    @Override
    public List<Book> getAllSellerBook(String sellerName) {

        logger.info("Inside getAllSellerBook Method Which Return Seller Book Which Add To Server Based On SellerName");
        String url = REST_SERVICE_URL+"/convertClientBookToJsonBySellerName/" + sellerName;
        try {
            ResponseEntity<Book[]> responseEntity = restTemplate.getForEntity(url, Book[].class);
            System.out.println(responseEntity.toString() + "return book detail");
            if (responseEntity.getBody() != null) {
                return Arrays.asList(responseEntity.getBody());
            }
        } catch (RestClientException e) {
            logger.error("Exception while rest data" + e.getMessage());
            e.printStackTrace();
        }
        return Collections.emptyList();
    }
    @Override
    public int deleteSellerBook(String bookId) {
        Integer result = 0;
        logger.info("Inside deleteSellerBook Method Which deleted Seller Book Based on BookId");
        String url = REST_SERVICE_URL+"/deleteClientBook/" + bookId;
        try {
            result = restTemplate.getForObject(url, Integer.class);
            return result;
        } catch (RestClientException e) {
            logger.error("Exception while rest data" + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }
    @Override
    public int updateClientBook(Book book){
        int result = 0;
        logger.info("Inside updateClientBook Method Which UpdateClientBook In server");
        String url = REST_SERVICE_URL+"/updateClientBook";
        try {
            ResponseEntity<Integer> entity = getRestTemplate().postForEntity(url, book, Integer.class);
            logger.info("no of record is effected" + entity.getBody());
            result = entity.getBody();
            return result;
        } catch (RestClientException e) {
            logger.error("Exception while rest data" + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }
 /*SERVER SHUTDOWN*/
   /* @Override
    public List<Book> getALLBookRestData2() {
        return serverDao.getALLBookRestData2();
    }

    @Override
    public Book getBookById2(String bookId) {
        return serverDao.getBookById2(bookId);
    }

    @Override
    public int saveClientBook2(Book book) {
        return serverDao.saveClientBook2(book);
    }

    @Override
    public List<Book> getAllSellerBook2(String sellerName) {
        return serverDao.getAllSellerBook2(sellerName);
    }

    @Override
    public int deleteSellerBook2(String bookId) {
        return serverDao.deleteSellerBook2(bookId);
    }

    @Override
    public int updateClientBook2(Book book) {
        return serverDao.updateClientBook2(book);
    }*/


    public RestTemplate getRestTemplate() {
        return restTemplate;
    }

    @Required
    public void setRestTemplate(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    /*public ServerDao getServerDao() {
        return serverDao;
    }
    @Required
    public void setServerDao(ServerDao serverDao) {
        this.serverDao = serverDao;
    }*/
}
