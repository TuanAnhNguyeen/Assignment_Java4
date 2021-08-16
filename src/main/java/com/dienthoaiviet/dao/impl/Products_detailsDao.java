package com.dienthoaiviet.dao.impl;

import com.dienthoaiviet.dao.IProducts_detailsDao;
import com.dienthoaiviet.model.Products_details;
import com.dienthoaiviet.model.dto.Product_detailsDto;
import com.dienthoaiviet.model.dto.Product_detailsMapper;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import java.util.ArrayList;
import java.util.List;

public class Products_detailsDao extends AbstractDao<Products_details> implements IProducts_detailsDao {
    @Override
    public List<Product_detailsDto> findAll() {
        List<Products_details> list = excuteQuery("findAllProduct_detals",Products_details.class);
        List<Product_detailsDto> dtoList = new ArrayList<>();
        for (Products_details x : list){
            dtoList.add(Product_detailsMapper.toProduct_detailsDto(x));
        }
        return list.isEmpty() ? null : dtoList;
    }

    @Override
    public void insertProducts_details(Product_detailsDto products_details) {
        excuteUpate(Product_detailsMapper.toProduct_details(products_details), MethodconstantDao.INSERT);
    }

    @Override
    public void updateProducts_details(Product_detailsDto products_details) {
        excuteUpate(Product_detailsMapper.toProduct_details(products_details), MethodconstantDao.UPDATE);
    }

    @Override
    public void deleteProducts_details(Product_detailsDto products_details) {
        excuteUpate(Product_detailsMapper.toProduct_details(products_details), MethodconstantDao.DELETE);
    }

    @Override
    public Product_detailsDto findByIdProduct_details(String id) {
        List<Products_details> list = excuteQuery("findByIdProduct_details",Products_details.class,id);
        return list.isEmpty() ? null : Product_detailsMapper.toProduct_detailsDto(list.get(0));
    }

    @Override
    public List<Product_detailsDto> findByProduct_details(String id) {
        List <Products_details> list = excuteQuery("findByIdProduct_details_list",Products_details.class,id);
        List<Product_detailsDto> dtoList = new ArrayList<>();
        for (Products_details x : list){
            dtoList.add(Product_detailsMapper.toProduct_detailsDto(x));
        }
        return list.isEmpty() ? null : dtoList;
    }


}
