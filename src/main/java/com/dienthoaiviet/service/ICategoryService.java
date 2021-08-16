package com.dienthoaiviet.service;

import com.dienthoaiviet.model.Category;

import java.util.List;

public interface ICategoryService {
    List<Category> findAll();
    void insertCategory(Category category);
    void updateCategory(Category category);
    void deleteCategory(Category category);
    Category findById(Integer id);
}
