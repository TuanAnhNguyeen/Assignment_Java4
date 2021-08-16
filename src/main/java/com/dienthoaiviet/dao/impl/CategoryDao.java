package com.dienthoaiviet.dao.impl;

import com.dienthoaiviet.dao.ICategoryDao;
import com.dienthoaiviet.model.Category;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import java.util.List;

public class CategoryDao extends AbstractDao<Category> implements ICategoryDao {
    @Override
    public List<Category> findAll() {
       List<Category> list = excuteQuery("findAllCategory",Category.class);
       return list.isEmpty() ? null : list;
    }

    @Override
    public void insertCategory(Category category) {
        excuteUpate(category, MethodconstantDao.INSERT);
    }

    @Override
    public void updateCategory(Category category) {
        excuteUpate(category,MethodconstantDao.UPDATE);
    }

    @Override
    public void deleteCategory(Category category) {
        excuteUpate(category,MethodconstantDao.DELETE);
    }

    @Override
    public Category findById(Integer id) {
        List<Category> list = excuteQuery("findByIdCategory",Category.class,id);
        return list.isEmpty() ? null : list.get(0);
    }
}
