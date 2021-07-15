package com.spiderBookStall.CustomerService;


import com.spiderBookStall.CustomerDao.CustomerDao;
import com.spiderBookStall.CustomerDto.CustomerDetail;
import com.spiderBookStall.CustomerDto.Order;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.dao.EmptyResultDataAccessException;

import java.security.Principal;
import java.util.Random;

/**
 * implementation for {@link CustomerService}
 */
public class CustomerServiceImpl implements CustomerService {
    private static final Logger logger = LogManager.getLogger(CustomerService.class);
    private CustomerDao customerDao;

    @Override
    public int saveRegisteredCustomer(CustomerDetail customerRegistration) {

        BasicConfigurator.configure();
        return customerDao.saveRegisteredCustomer(customerRegistration);
    }

    @Override
    public CustomerDetail getRecordById(String EmailId) {
        return customerDao.getRecordById(EmailId);
    }

    @Override
    public int updateProfile(CustomerDetail detail) {

        logger.info("Under Service UpdateProfile Method");

        return customerDao.updateProfile(detail);
    }

    @Override
    public int saveOrder(Order order, String bookId, Principal principal) {
        logger.info("Under Service saveOrder Method");
        Random random = new Random();
        int orderId = random.nextInt();
        order.setOderId(orderId);
        order.setProductID(bookId);
        String UserId = principal.getName();
        order.setUserId(UserId);
        return customerDao.saveOrder(order);
    }

    @Override
    public CustomerDetail getProfile(String EmailId) throws EmptyResultDataAccessException {
        return customerDao.getProfile(EmailId);
    }

    @Override
    public int duplicateEntry(String email) {
        return customerDao.duplicateEntry(email);
    }


    public CustomerDao getCustomerDao() {
        return customerDao;
    }

    @Required
    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }
}
