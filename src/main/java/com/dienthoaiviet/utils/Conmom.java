package com.dienthoaiviet.utils;

import com.dienthoaiviet.dao.IContactDao;
import com.dienthoaiviet.dao.impl.ContactDao;
import com.dienthoaiviet.model.Contact;

import java.util.List;

public class Conmom {
    public static int CoutMail(){
        IContactDao contactDao = new ContactDao();
        List<Contact> listContact =  contactDao.findAllContact();
        int cout = 0;
        for (Contact x : listContact){
            if(x.isStatus()){
                cout=+1;
            }
        }
        return cout;
    }
}
