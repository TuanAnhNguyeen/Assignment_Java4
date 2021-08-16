package com.dienthoaiviet.model.mapper;

import com.dienthoaiviet.model.Customer;
import com.dienthoaiviet.model.dto.CustomerDto;

public class CustomerMapper {
    public static CustomerDto toCustomerDto(Customer customer){
        CustomerDto tmp = new CustomerDto();
        tmp.setId(customer.getId());
        tmp.setAddress(customer.getAddress());
        tmp.setEmail(customer.getEmail());
        tmp.setFullname(customer.getFullname());
        tmp.setPhoneNumber(customer.getPhoneNumber());
        tmp.setStatus(customer.isStatus());
        return tmp;
    }
    public static Customer toCustomer(CustomerDto customer){
        Customer tmp = new Customer();
        tmp.setId(customer.getId());
        tmp.setAddress(customer.getAddress());
        tmp.setEmail(customer.getEmail());
        tmp.setFullname(customer.getFullname());
        tmp.setPhoneNumber(customer.getPhoneNumber());
        tmp.setStatus(customer.isStatus());
        return tmp;
    }
}
