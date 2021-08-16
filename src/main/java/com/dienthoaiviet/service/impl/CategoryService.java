package com.dienthoaiviet.service.impl;

import com.dienthoaiviet.dao.ICategoryDao;
import com.dienthoaiviet.dao.impl.CategoryDao;
import com.dienthoaiviet.model.Category;
import com.dienthoaiviet.service.ICategoryService;

import java.util.List;

public class CategoryService implements ICategoryService {
    private static ICategoryDao categoryDao = new CategoryDao();
    @Override
    public List<Category> findAll() {
        return categoryDao.findAll();
    }

    @Override
    public void insertCategory(Category category) {
        categoryDao.insertCategory(category);
    }

    @Override
    public void updateCategory(Category category) {
        categoryDao.updateCategory(category);
    }

    @Override
    public void deleteCategory(Category category) {
        categoryDao.deleteCategory(category);
    }

    @Override
    public Category findById(Integer id) {
        return categoryDao.findById(id);
    }
}
