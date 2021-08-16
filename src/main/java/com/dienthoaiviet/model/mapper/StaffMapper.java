package com.dienthoaiviet.model.mapper;

import com.dienthoaiviet.model.Staff;
import com.dienthoaiviet.model.dto.StaffDto;

public class StaffMapper {
    public static StaffDto toStaffDro(Staff staff){
        StaffDto tmp = new StaffDto();
        tmp.setId(staff.getId());
        tmp.setImage(staff.getImage());
        tmp.setFullname(staff.getFullname());
        tmp.setAddress(staff.getAddress());
        tmp.setEmail(staff.getEmail());
        tmp.setBirthday(staff.getBirthday());
        tmp.setPhonenumber(staff.getPhonenumber());
        tmp.setRole(staff.getRole());
        tmp.setGender(staff.isGender());
        tmp.setPassword(staff.getPassword());
        tmp.setSalary(staff.getSalary());
        tmp.setStatus(staff.isStatus());
        return tmp;
    }
    public static Staff toStaff(StaffDto staff){
        Staff tmp = new Staff();
        tmp.setId(staff.getId());
        tmp.setFullname(staff.getFullname());
        tmp.setImage(staff.getImage());
        tmp.setAddress(staff.getAddress());
        tmp.setEmail(staff.getEmail());
        tmp.setBirthday(staff.getBirthday());
        tmp.setPhonenumber(staff.getPhonenumber());
        tmp.setRole(staff.getRole());
        tmp.setGender(staff.isGender());
        tmp.setPassword(staff.getPassword());
        tmp.setSalary(staff.getSalary());
        tmp.setStatus(staff.isStatus());
        return tmp;
    }
}
