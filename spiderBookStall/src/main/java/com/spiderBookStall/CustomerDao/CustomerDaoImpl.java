package com.spiderBookStall.CustomerDao;

import com.spiderBookStall.CustomerController.CustomerController;
import com.spiderBookStall.CustomerDto.CustomerDetail;
import com.spiderBookStall.CustomerDto.Order;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 * implementation for {@link CustomerDao}
 */
public class CustomerDaoImpl implements CustomerDao {

    private static final Logger logger = LogManager.getLogger(CustomerController.class);

    private JdbcTemplate jdbcTemplate;

    public CustomerDaoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public int saveRegisteredCustomer(CustomerDetail register) {
        BasicConfigurator.configure();
        int result = 0;
        String query = "insert into customerregistration(firstName,lastName,email,password,rePassword,contact,dob,addressLine1,addressLine2,city,state,pinCode,role) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            result = this.jdbcTemplate.update(query, register.getFirstName(), register.getLastName(), register.getEmail(), register.getPassword(), register.getRePassword(), register.getContact(), register.getDob(), register.getAddressLine1(), register.getAddressLine2(), register.getCity(), register.getState(), register.getPinCode(), register.getRole());
            return result;

        } catch (DataAccessException e) {
            logger.error("Exception:" + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public CustomerDetail getRecordById(String EmailID) {
        CustomerDetail customerDetail = null;
        MyRowMapper myRowMapper = new MyRowMapper();
        System.out.println(EmailID);
        String query = "select * from customerregistration where email=?";
        try {
            customerDetail = (CustomerDetail) this.jdbcTemplate.queryForObject(query, myRowMapper, EmailID);
            return customerDetail;
        } catch (DataAccessException e) {
            logger.error("Exception:" + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public int updateProfile(CustomerDetail detail) {
        int result = 0;
        String query = "update book.customerregistration set firstName=?,lastName=?,password=?,rePassword=?,contact=?,dob=?,addressLine1=?,addressLine2=?,city=?,state=?,pinCode=? where email=?";
        try {
            result = this.jdbcTemplate.update(query, detail.getFirstName(), detail.getLastName(), detail.getPassword(), detail.getRePassword(), detail.getContact(), detail.getDob(), detail.getAddressLine1(), detail.getAddressLine2(), detail.getCity(), detail.getState(), detail.getPinCode(), detail.getEmail());
            return result;
        } catch (DataAccessException e) {
            logger.error("Exception:" + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int saveOrder(Order order) {
        int result = 0;
        String query = "insert into book.order values(?,?,?,?)";
        try {
            result = this.jdbcTemplate.update(query, order.getUserId(), order.getOderId(), order.getProductID(), order.getPaymentMethod());
            return result;
        } catch (DataAccessException e) {
            logger.error("Exception:" + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public CustomerDetail getProfile(String EmailId) {
        MyRowMapper myRowMapper = new MyRowMapper();
        String query = "select * from customerregistration where email=?";
        return (CustomerDetail) this.jdbcTemplate.queryForObject(query, myRowMapper, EmailId);
    }

    @Override
    public int duplicateEntry(String email) {
        int result = 0;
        String query = "select count(*) from book.customerregistration where email='" + email + "'";
        try {
            result = this.jdbcTemplate.queryForObject(query, Integer.class);
            return result;
        } catch (DataAccessException e) {
            logger.error("Exception:" + e.getMessage());
            e.printStackTrace();
        }
        return result;

    }
}
