package com.dienthoaiviet.dao.impl;

import com.dienthoaiviet.dao.IContactDao;
import com.dienthoaiviet.model.Contact;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import java.util.List;

public class ContactDao extends AbstractDao<Contact> implements IContactDao {
    @Override
    public List<Contact> findAllContact() {
        List<Contact> list = excuteQuery("findAllContact", Contact.class);
        return list.isEmpty() ? null : list;
    }

    @Override
    public void insertContact(Contact contact) {
        excuteUpate(contact, MethodconstantDao.INSERT);
    }

    @Override
    public void updateContact(Contact contact) {
        excuteUpate(contact, MethodconstantDao.UPDATE);

    }

    @Override
    public void deleteContact(Contact contact) {
        excuteUpate(contact,MethodconstantDao.DELETE);
    }

    @Override
    public Contact findByIdContact(Integer id) {
        List<Contact> list = excuteQuery("findByIdContact", Contact.class, id);
        return list.isEmpty() ? null : list.get(0);
    }
}
