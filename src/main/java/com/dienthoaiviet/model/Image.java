package com.dienthoaiviet.model;


import javax.persistence.*;

@NamedQueries({
        @NamedQuery(name = "findAllImage", query = "select o from Image o"),
        @NamedQuery(name = "findByIdAllImage", query = "select o from Image o where o.products.id= ?1")
}
)
@Entity
@Table(name = "image", uniqueConstraints = {
        @UniqueConstraint(columnNames = "productid")
})
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    @ManyToOne
    @JoinColumn(name = "productid")
    private Products products;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }
}
