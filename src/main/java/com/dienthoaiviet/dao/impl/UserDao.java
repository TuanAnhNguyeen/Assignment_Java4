package com.dienthoaiviet.dao.impl;

import com.dienthoaiviet.dao.IUserDao;
import com.dienthoaiviet.model.Staff;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import java.util.List;

public class UserDao extends AbstractDao<Staff> implements IUserDao {
    @Override
    public List<Staff> findAll() {
        List list = excuteQuery("findAll", Staff.class);
        return list.isEmpty() ? null : list;
    }

    @Override
    public void insertUser(Staff staff) {
        excuteUpate(staff, MethodconstantDao.INSERT);
    }

    @Override
    public void updateUser(Staff staff) {
        excuteUpate(staff, MethodconstantDao.UPDATE);
    }

    @Override
    public void deleteUser(Staff staff) {
        excuteUpate(staff, MethodconstantDao.DELETE);
    }

    @Override
    public Staff findByIdAndPassword(Integer id, String password) {
        List<Staff> list = excuteQuery("findByIdAndPassword", Staff.class, id, password);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public Staff findById(Integer id) {
        List<Staff> list = excuteQuery("findById", Staff.class, id);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public Staff findByEmail(String email) {
        List<Staff> list = excuteQuery("findByEmail", Staff.class, email);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public Staff findByPhone(String phone) {
        List<Staff> list = excuteQuery("findByPhone", Staff.class, phone);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public List<Staff> findByKeyworf(String keyWord) {
        String key = "%"+"KeyWord"+"%";
        List<Staff> list = excuteQuery("findByKeywor", Staff.class, key);
        return list.isEmpty() ? null : list;
    }
}
