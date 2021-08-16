package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.Contact;

import java.util.List;

public interface IContactDao extends GenegicDao<Contact> {
    List<Contact> findAllContact();
    void insertContact(Contact contact);
    void updateContact(Contact contact);
    void deleteContact(Contact contact);
    Contact findByIdContact(Integer id);
}
