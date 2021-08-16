package com.dienthoaiviet.service;

import com.dienthoaiviet.model.Customer;
import com.dienthoaiviet.model.dto.CustomerDto;

import java.util.List;

public interface ICustomerService {
    List<CustomerDto> findAll();
    void insertCustomer(CustomerDto customerDto);
    void updateCustomer(CustomerDto customerDto);
    void deleteCustomer(CustomerDto customerDto);
    CustomerDto findByPhone(String phone);
    List<CustomerDto> findByKyword(String keyWord);
}
