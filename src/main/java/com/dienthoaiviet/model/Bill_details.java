package com.dienthoaiviet.model;

import javax.persistence.*;
import java.math.BigDecimal;

@NamedQueries({
        @NamedQuery(name = "findAllBill_Details", query = "select o from Bill_details o where o.bill.id= ?1"),
}
)
@Entity
@Table(name = "bill_details",uniqueConstraints = {
        @UniqueConstraint(columnNames = "billid"),
        @UniqueConstraint(columnNames = "products_detailsid")
})
public class Bill_details {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private int quantity;
    @ManyToOne @JoinColumn(name="billid")
    private Bill bill;
    @ManyToOne @JoinColumn(name="products_detailsid")
    private Products_details products_details;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public Products_details getProducts_details() {
        return products_details;
    }

    public void setProducts_details(Products_details products_details) {
        this.products_details = products_details;
    }
}
