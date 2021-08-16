package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.Products;

import java.util.List;

public interface IProductsDao extends GenegicDao<Products> {
    List<Products> findAll();
    void insertProduct(Products products);
    void updateProduct(Products products);
    void deleteProduct(Products products);
    Products findByKeyProduct(String key);
    Products findByIdProduct(String id);
    List<Products> findHotSale();
    List<Products> findByCategory(int id);
    List<Products> findByAllPrice(int priceLower,int expensive);
    List<Products> findAllSortAsc(int id );
    List<Products> findAllSortDesc(int id );
    List<Products> findByKeyword(String key);
}
