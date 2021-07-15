package com.spiderBookStall.CustomerDao;

import com.spiderBookStall.CustomerDto.CustomerDetail;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MyRowMapper implements RowMapper {
    @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {
        CustomerDetail detail = new CustomerDetail();
        detail.setFirstName(resultSet.getString(1));
        detail.setLastName(resultSet.getString(2));
        detail.setEmail(resultSet.getString(3));
        detail.setPassword(resultSet.getString(4));
        detail.setRePassword(resultSet.getString(5));
        detail.setContact(resultSet.getString(6));
        detail.setDob(resultSet.getString(7));
        detail.setAddressLine1(resultSet.getString(8));
        detail.setAddressLine2(resultSet.getString(9));
        detail.setCity(resultSet.getString(10));
        detail.setState(resultSet.getString(11));
        detail.setPinCode(resultSet.getString(12));

        return detail;
    }
}
