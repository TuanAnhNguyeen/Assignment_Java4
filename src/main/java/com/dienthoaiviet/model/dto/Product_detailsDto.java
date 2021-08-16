package com.dienthoaiviet.model.dto;

import com.dienthoaiviet.model.Products;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

public class Product_detailsDto {
    private String id;
    private String color;
    private int quantity;
    private Products products;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }
}
