package com.dienthoaiviet.model;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@NamedQueries(
        @NamedQuery(name = "findAllByIdProduct", query = "select o from CustomerViews o where o.products.id = ?1")
)
@Entity
@Table(name = "customerviews")
public class CustomerViews {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String note;
//    @Temporal(TemporalType.TIMESTAMP)
    private Date date = new Date();
    private String name;
    @ManyToOne @JoinColumn(name = "idproduct")
    private Products products;
    private String phonenumber;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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

    public String getPhone() {
        return phonenumber;
    }

    public void setPhone(String phonenumber) {
        this.phonenumber = phonenumber;
    }
    public String convertDateTime(){
        SimpleDateFormat sdf = new SimpleDateFormat(" dd-MM-yyyy hh:mm:ss");
        return sdf.format(date);
    }
}
