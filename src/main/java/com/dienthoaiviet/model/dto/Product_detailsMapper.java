package com.dienthoaiviet.model.dto;

import com.dienthoaiviet.model.Products_details;

public class Product_detailsMapper {
    public static Product_detailsDto toProduct_detailsDto(Products_details products_details){
        Product_detailsDto tmp = new Product_detailsDto();
        tmp.setId(products_details.getId());
        tmp.setColor(products_details.getColor());
        tmp.setProducts(products_details.getProducts());
        tmp.setQuantity(products_details.getQuantity());
        return tmp;
    }
    public static Products_details toProduct_details(Product_detailsDto products_details){
        Products_details tmp = new Products_details();
        tmp.setId(products_details.getId());
        tmp.setColor(products_details.getColor());
        tmp.setProducts(products_details.getProducts());
        tmp.setQuantity(products_details.getQuantity());
        return tmp;
    }
}
