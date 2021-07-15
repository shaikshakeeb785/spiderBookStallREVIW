package com.spiderBookStall.ServerBookDataDao;

import com.spiderBookStall.CustomerController.CustomerController;
import com.spiderBookStall.CustomerDto.Book;
import com.spiderBookStall.RowMapper.MyRowMapper;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class ServerDaoImpl implements ServerDao{

    private static final Logger logger = LogManager.getLogger(CustomerController.class);

    private JdbcTemplate ServerJdbcTemplate;
    @Override
    public List<Book> getALLBookRestData2() {
        logger.info("get All Record ");
        String query = "select * from book1";
        try{
            List<Book> listBook = this.ServerJdbcTemplate.query(query, new MyRowMapper());
            return listBook;
        } catch (DataAccessException e) {
            logger.error("DataAccessException"+e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Book getBookById2(String bookId) {
        logger.info("Getting Single Record by BookId:" + bookId);
        String query = "select * from book1 where bookId=?";
        try {
            Book book = (Book) this.ServerJdbcTemplate.queryForObject(query, new MyRowMapper(), bookId);
            return book;
        } catch (DataAccessException e) {
            logger.error("DataAccessException"+e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int saveClientBook2(Book book) {
        int result=0;
        String query = "insert into book1(bookId,bookName,bookAuthor,bookPrice,bookPublishDate,sellerName,publication) values(?,?,?,?,?,?,?)";
        try{
            result = this.ServerJdbcTemplate.update(query, book.getBookId(), book.getBookName(), book.getBookAuthor(), book.getBookPrice(), book.getBookPublishDate(), book.getSellerName(), book.getPublication());
            logger.info(" value of i:" + result);
            return result;
        }catch (DataAccessException e)
        {
            e.printStackTrace();
            logger.error("DataAccessException"+e.getMessage());
        }
        return result;
    }

    @Override
    public List<Book> getAllSellerBook2(String sellerName) {
        logger.info("get All Record ");
        String query = "select * from book1 where sellerName=?";
        try{
            List<Book> listBook = this.ServerJdbcTemplate.query(query, new MyRowMapper(),sellerName+".com");
            return listBook;
        } catch (DataAccessException e) {
            logger.error("DataAccessException"+e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int deleteSellerBook2(String bookId) {
        int result=0;
        logger.info("Delete Record By Id ");
        String query = "delete from book1 where bookId=?";
        try {
            result = this.ServerJdbcTemplate.update(query, bookId);
            return result;
        } catch (DataAccessException e) {
            logger.error("DataAccessException"+e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int updateClientBook2(Book book) {
        int result=0;
        logger.info("Updating Book By BookId ");
        String query="update book1 set bookName=?,bookAuthor=?,bookPrice=?,bookPublishDate=?,sellerName=?,publication=? where bookId=?";
        try{
            result= this.ServerJdbcTemplate.update(query,book.getBookName(),book.getBookAuthor(),book.getBookPrice(),book.getBookPublishDate(),book.getSellerName(),book.getPublication(),book.getBookId());
            return result;
        } catch (DataAccessException e) {
            logger.error("DataAccessException"+e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    public JdbcTemplate getServerJdbcTemplate() {
        return ServerJdbcTemplate;
    }
   @Required
    public void setServerJdbcTemplate(JdbcTemplate serverJdbcTemplate) {
        ServerJdbcTemplate = serverJdbcTemplate;
    }
}
