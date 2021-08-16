package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.Category;

import java.util.List;

public interface ICategoryDao extends GenegicDao<Category> {
    List<Category> findAll();
    void insertCategory(Category category);
    void updateCategory(Category category);
    void deleteCategory(Category category);
    Category findById(Integer id);
}
