package com.dienthoaiviet.dao.impl;

import com.dienthoaiviet.dao.IProductsDao;
import com.dienthoaiviet.model.Products;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import java.util.ArrayList;
import java.util.List;

public class ProductsDao extends AbstractDao<Products> implements IProductsDao {
    @Override
    public List<Products> findAll() {
        List<Products> list = excuteQuery("findAllProducts",Products.class);
        return list.isEmpty() ? null:list;
    }

    @Override
    public void insertProduct(Products products) {
        excuteUpate(products, MethodconstantDao.INSERT);
    }

    @Override
    public void updateProduct(Products products) {
        excuteUpate(products, MethodconstantDao.UPDATE);

    }

    @Override
    public void deleteProduct(Products products) {
        excuteUpate(products, MethodconstantDao.DELETE);

    }

    @Override
    public Products findByKeyProduct(String key) {
        List<Products> list = excuteQuery("findByKeyNameProduct",Products.class,key);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public Products findByIdProduct(String id) {
        List<Products> list = excuteQuery("findByKeyIdProduct",Products.class,id);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public List<Products> findByCategory(int id) {
        List<Products> list = excuteQuery("findByCategory",Products.class,id);
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Products> findByAllPrice(int priceLower,int expensive) {
        List<Products> list = excuteQuery("findAllByPrice",Products.class,priceLower,expensive);
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Products> findHotSale() {
        List<Products> list = excuteQuery("findAllHotSale",Products.class);
        List<Products> listHotSale = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            listHotSale.add(list.get(i));
        }
        return listHotSale.isEmpty() ? null : list;
    }

    @Override
    public List<Products> findAllSortAsc(int id) {
        List<Products> list = excuteQuery("findAllSortAsc",Products.class,id);
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Products> findAllSortDesc(int id) {
        List<Products> list = excuteQuery("findAllSortDesc",Products.class,id);
        return list.isEmpty() ? null : list;
    }

    @Override
    public List<Products> findByKeyword(String key) {
        String keyWord = "%"+key+"%";
        List<Products> list = excuteQuery("findAllByKeyword",Products.class,keyWord);
        return list.isEmpty() ? null : list;
    }
}
