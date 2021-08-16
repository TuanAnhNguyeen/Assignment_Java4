package com.dienthoaiviet.dao.impl;

import com.dienthoaiviet.dao.ICustomerDao;
import com.dienthoaiviet.model.Customer;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import java.util.List;

public class CustomerDao extends AbstractDao<Customer> implements ICustomerDao {

    @Override
    public List<Customer> findAll() {
        List list = excuteQuery("findAllCustomer", Customer.class);
        return list.isEmpty() ? null : list;
    }

    @Override
    public void insertCustomer(Customer customer) {
        excuteUpate(customer, MethodconstantDao.INSERT);
    }

    @Override
    public void updateCustomer(Customer customer) {
        excuteUpate(customer, MethodconstantDao.UPDATE);
    }

    @Override
    public void deleteCustomer(Customer customer) {
        excuteUpate(customer, MethodconstantDao.DELETE);
    }

    @Override
    public Customer findByPhone(String phone) {
       List<Customer> list = excuteQuery("findByPhoneCustomer",Customer.class,phone);
       return list.isEmpty()  ? null : list.get(0);
    }

    @Override
    public List<Customer> findByKeyworf(String keyWord) {
        List<Customer> list = excuteQuery("findByKeyWord",Customer.class,keyWord);
        return list;
    }
}
