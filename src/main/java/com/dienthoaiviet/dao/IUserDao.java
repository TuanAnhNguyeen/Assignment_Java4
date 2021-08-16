package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.Staff;

import java.util.List;

public interface IUserDao extends GenegicDao<Staff> {
    List<Staff> findAll();
    void insertUser(Staff staff);
    void updateUser(Staff staff);
    void deleteUser(Staff staff);
    Staff findByIdAndPassword(Integer id , String password);
    Staff findById(Integer id);
    Staff findByEmail(String email);
    Staff findByPhone(String phone);
    List<Staff> findByKeyworf (String keyWord);
}
