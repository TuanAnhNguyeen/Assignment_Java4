package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.CustomerViews;

import java.util.List;

public interface ICustomerViews extends GenegicDao<CustomerViews>{
    List<CustomerViews> findAll(String idProduct);
    void inserViews(CustomerViews customerViews);
}
