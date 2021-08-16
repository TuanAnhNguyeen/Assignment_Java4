package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.Properties;

import java.util.List;

public interface IPropertiesDao extends GenegicDao<Properties>{
    List<Properties> findAll();
    void insertPropreties(Properties properties);
    void updateProperties(Properties properties);
    void deleteProperties(Properties properties);
    Properties findById(Integer id);
}
