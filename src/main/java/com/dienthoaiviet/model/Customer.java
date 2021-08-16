package com.dienthoaiviet.model;

import javax.persistence.*;
import java.util.List;

@NamedQueries({
        @NamedQuery(name = "findAllCustomer", query = "select o from Customer o where o.status=true"),
        @NamedQuery(name = "findByPhoneCustomer", query = "select o from Customer o where o.phoneNumber= ?1  and o.status = true"),
}
)
@Entity
@Table(name = "customer")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "fullname")
    private String fullname;
    @Column(name = "address")
    private String address;
    @Column(name = "email", nullable = true)
    private String email;
    @Column(name = "phonenumber")
    private String phoneNumber;
    @Column(name = "status")
    private boolean status;
    @OneToMany (mappedBy = "customer")
    private List<Bill> list;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
