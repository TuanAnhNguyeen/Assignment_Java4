package com.dienthoaiviet.dao.impl;

import com.dienthoaiviet.dao.IPropertiesDao;
import com.dienthoaiviet.model.Properties;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import java.util.List;

public class PropretiesDao extends AbstractDao<Properties> implements IPropertiesDao {
    @Override
    public List<Properties> findAll() {
        List<Properties> list = excuteQuery("findAllProperties",Properties.class);
        return list.isEmpty() ? null : list;
    }

    @Override
    public void insertPropreties(Properties properties) {
        excuteUpate(properties, MethodconstantDao.INSERT);
    }

    @Override
    public void updateProperties(Properties properties) {
        excuteUpate(properties, MethodconstantDao.UPDATE);
    }

    @Override
    public void deleteProperties(Properties properties) {
        excuteUpate(properties, MethodconstantDao.DELETE);
    }

    @Override
    public Properties findById(Integer id) {
        List<Properties> list = excuteQuery("findByIdProperties",Properties.class,id);
        return list.isEmpty() ? null : list.get(0);
    }
}
