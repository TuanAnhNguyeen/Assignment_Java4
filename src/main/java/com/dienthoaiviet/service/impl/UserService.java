package com.dienthoaiviet.service.impl;

import com.dienthoaiviet.dao.IUserDao;
import com.dienthoaiviet.dao.impl.UserDao;
import com.dienthoaiviet.model.Staff;
import com.dienthoaiviet.model.dto.StaffDto;
import com.dienthoaiviet.model.mapper.StaffMapper;
import com.dienthoaiviet.service.IUserService;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;

public class UserService implements IUserService {

    private static IUserDao userDao = new UserDao();

    @Override
    public List<StaffDto> findAll() {
        List<Staff> list = userDao.findAll();
        List<StaffDto> listDto = new ArrayList<>();
        for (Staff x : list) {
            listDto.add(StaffMapper.toStaffDro(x));
        }
        return listDto;
    }

    @Override
    public void insertUser(StaffDto staff) {
        userDao.insertUser(StaffMapper.toStaff(staff));
    }

    @Override
    public void updateUser(StaffDto staff) {
        userDao.updateUser(StaffMapper.toStaff(staff));
    }

    @Override
    public void deleteUser(Integer id) {
        Staff staff = userDao.findById(id);
        userDao.deleteUser(staff);
    }

    @Override
    public StaffDto findByIdAndPassword(Integer id, String password) {
        Staff staff =userDao.findByIdAndPassword(id, password);
        return staff ==null ? null : StaffMapper.toStaffDro(staff);
    }

    @Override
    public StaffDto findById(Integer id) {

        return StaffMapper.toStaffDro(userDao.findById(id));
    }

    @Override
    public StaffDto findByEmail(String email) {
        Staff staff = userDao.findByEmail(email);
        return staff == null ? null : StaffMapper.toStaffDro(staff);
    }

    @Override
    public StaffDto findByPhone(String phone) {
        Staff staff = userDao.findByPhone(phone);
        return staff == null ? null : StaffMapper.toStaffDro(staff);
    }

    @Override
    public List<StaffDto> findByKeyworf(String keyWord) {
        List<Staff> list = userDao.findByKeyworf(keyWord);
        List<StaffDto> listDto = new ArrayList<>();
        for (Staff x : list) {
            listDto.add(StaffMapper.toStaffDro(x));
        }
        return listDto;
    }
}
