package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.Role;

import java.util.List;

public interface IRoleDao extends GenegicDao<Role> {
    List<Role> fillAll();
}
