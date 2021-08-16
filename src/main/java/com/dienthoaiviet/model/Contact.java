package com.dienthoaiviet.model;

import javax.persistence.*;
import java.util.Date;

@NamedQueries({
        @NamedQuery(name = "findAllContact", query = "select o from Contact o order by o.id desc"),
        @NamedQuery(name = "findByIdContact", query = "select o from Contact o where o.id=?1"),
}
)
@Entity
@Table(name = "contact")
public class Contact {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String email;
    private Date day = new Date();
    private String fullname;
    private boolean status;
    private String note;
    private String subject;



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}
