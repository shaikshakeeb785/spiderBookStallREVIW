package com.spiderBookStall.CustomerService;

import com.spiderBookStall.CustomerDto.CustomerDetail;
import com.spiderBookStall.CustomerDto.Order;
import org.springframework.dao.EmptyResultDataAccessException;

import java.security.Principal;


public interface CustomerService {
    /**
     * saveRegisteredCustomer method is used to saved the data into the database and return no of record is effected
     *
     * @return no of record is effected
     */
    public int saveRegisteredCustomer(CustomerDetail customerRegistration);

    /**
     * @param EmailId get record by using Email id from the database
     * @return CustomerDetail
     */
    public CustomerDetail getRecordById(String EmailId) throws EmptyResultDataAccessException;

    /**
     * updating customerProfile by using email
     *
     * @param detail customer updated detail
     * @return no of record is effected
     */
    public int updateProfile(CustomerDetail detail);

    /**
     * @param order it is object of ORDER which is saved into the database
     * @return no of record is effected;
     */
    public int saveOrder(Order order, String bookId, Principal principal);

    /**
     * @param EmailId using id getting customerProfile detail
     * @return customerProfile
     */
    public CustomerDetail getProfile(String EmailId) throws EmptyResultDataAccessException;

    /**
     * if customer adding duplicating entry again in database then it will not store in database
     *
     * @param email
     * @return no of duplicate email id
     */
    public int duplicateEntry(String email);
}
