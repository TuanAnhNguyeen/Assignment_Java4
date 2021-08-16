package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.Customer;

import java.util.List;

public interface ICustomerDao extends GenegicDao<Customer> {
    List<Customer> findAll();
    void insertCustomer(Customer customer);
    void updateCustomer(Customer customer);
    void deleteCustomer(Customer customer);
    Customer findByPhone(String phone);
    List<Customer> findByKeyworf (String keyWord);
}
