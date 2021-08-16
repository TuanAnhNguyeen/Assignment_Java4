package com.dienthoaiviet.dao.impl;

import com.dienthoaiviet.dao.ICustomerViews;
import com.dienthoaiviet.model.Customer;
import com.dienthoaiviet.model.CustomerViews;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import java.util.List;

public class CustomerViewsDao extends AbstractDao<CustomerViews> implements ICustomerViews {
    @Override
    public List<CustomerViews> findAll(String idProduct) {
        List<CustomerViews> list = excuteQuery("findAllByIdProduct",CustomerViews.class,idProduct);
        return list.isEmpty() ? null : list;
    }

    @Override
    public void inserViews(CustomerViews customerViews) {
        excuteUpate(customerViews, MethodconstantDao.INSERT);
    }
}
