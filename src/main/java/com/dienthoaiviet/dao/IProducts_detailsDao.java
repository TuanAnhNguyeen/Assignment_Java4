package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.Products_details;
import com.dienthoaiviet.model.dto.Product_detailsDto;

import java.util.List;

public interface IProducts_detailsDao extends GenegicDao<Products_details> {
    List<Product_detailsDto> findAll();
    void insertProducts_details(Product_detailsDto products_details);
    void updateProducts_details(Product_detailsDto products_details);
    void deleteProducts_details(Product_detailsDto products_details);
    Product_detailsDto findByIdProduct_details(String id);
    List<Product_detailsDto> findByProduct_details(String id);
}
