package com.dienthoaiviet.model;

import javax.persistence.*;
import java.util.List;

@NamedQueries({
        @NamedQuery(name = "findAllProduct_detals", query = "select o from Products_details o"),
        @NamedQuery(name = "findByIdProduct_details", query = "select o from Products_details o where o.id = ?1"),
        @NamedQuery(name = "findByIdProduct_details_list", query = "select o from Products_details o where o.products.id = ?1"),
        @NamedQuery(name = "findByProductCart",query = "select  o from Products_details o where o.products.id = ?1 and  o.color = ?2")
}
)
@Entity
@Table(name="products_details",uniqueConstraints = {
        @UniqueConstraint(columnNames = "idproduct")
})
public class Products_details {
    @Id
    private String id;
    private String color;
    private int quantity;
    @ManyToOne @JoinColumn(name = "idproduct")
    private Products products;
    @OneToMany (mappedBy = "products_details",fetch = FetchType.LAZY)
    List<Bill_details> list ;

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
