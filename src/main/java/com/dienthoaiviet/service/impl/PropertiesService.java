package com.dienthoaiviet.service.impl;

import com.dienthoaiviet.dao.IPropertiesDao;
import com.dienthoaiviet.dao.impl.PropretiesDao;
import com.dienthoaiviet.model.Properties;
import com.dienthoaiviet.service.IPropertiesService;

import java.util.List;

public class PropertiesService implements IPropertiesService {

    private static IPropertiesDao propertiesDao = new PropretiesDao();
    @Override
    public List<Properties> findAll() {
        return propertiesDao.findAll();
    }

    @Override
    public void insertPropreties(Properties properties) {
        propertiesDao.insertPropreties(properties);
    }

    @Override
    public void updateProperties(Properties properties) {
        propertiesDao.updateProperties(properties);
    }

    @Override
    public void deleteProperties(Properties properties) {
        propertiesDao.deleteProperties(properties);
    }

    @Override
    public Properties findById(Integer id) {
      return   propertiesDao.findById(id);
    }
}
