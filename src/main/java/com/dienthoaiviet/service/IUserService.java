package com.dienthoaiviet.service;

import com.dienthoaiviet.model.Staff;
import com.dienthoaiviet.model.dto.StaffDto;

import java.util.List;

public interface IUserService {
    List<StaffDto> findAll();
    void insertUser(StaffDto staff);
    void updateUser(StaffDto staff);
    void deleteUser(Integer id);
    StaffDto findByIdAndPassword(Integer id , String password);
    StaffDto findById(Integer id);
    StaffDto findByEmail(String email);
    StaffDto findByPhone(String phone);
    List<StaffDto> findByKeyworf (String keyWord);
}
