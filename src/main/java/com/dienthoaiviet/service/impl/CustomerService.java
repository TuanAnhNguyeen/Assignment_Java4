package com.dienthoaiviet.service.impl;

import com.dienthoaiviet.dao.ICustomerDao;
import com.dienthoaiviet.dao.impl.CustomerDao;
import com.dienthoaiviet.model.Customer;
import com.dienthoaiviet.model.dto.CustomerDto;
import com.dienthoaiviet.model.mapper.CustomerMapper;
import com.dienthoaiviet.service.ICustomerService;

import java.util.ArrayList;
import java.util.List;

public class CustomerService implements ICustomerService {
    private static ICustomerDao customerDao = new CustomerDao();
    @Override
    public List<CustomerDto> findAll() {
        List<Customer> list = customerDao.findAll();
        List<CustomerDto> listDto = new ArrayList<>();
        for(Customer x : list){
            listDto.add(CustomerMapper.toCustomerDto(x));
        }
        return listDto.isEmpty() ? null : listDto;
    }

    @Override
    public void insertCustomer(CustomerDto customerDto) {
        customerDao.insertCustomer(CustomerMapper.toCustomer(customerDto));
    }

    @Override
    public void updateCustomer(CustomerDto customerDto) {
        customerDao.updateCustomer(CustomerMapper.toCustomer(customerDto));
    }

    @Override
    public void deleteCustomer(CustomerDto customerDto) {
        customerDao.deleteCustomer(CustomerMapper.toCustomer(customerDto));
    }

    @Override
    public CustomerDto findByPhone(String phone) {
        Customer customer = customerDao.findByPhone(phone);
        return customer == null ? null : CustomerMapper.toCustomerDto(customer);
    }

    @Override
    public List<CustomerDto> findByKyword(String keyWord) {
        List<Customer> list = customerDao.findByKeyworf(keyWord);
        List<CustomerDto> listDto = new ArrayList<>();
        for(Customer x : list){
            listDto.add(CustomerMapper.toCustomerDto(x));
        }
        return listDto.isEmpty() ? null : listDto;
    }
}
