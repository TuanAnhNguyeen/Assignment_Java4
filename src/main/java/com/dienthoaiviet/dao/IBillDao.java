package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.Bill;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface IBillDao extends  GenegicDao<Bill>{
    List<Bill> findAllBill(int status);
    void insertBill(Bill bill);
    void updateBill(Bill bill);
    void deleteBill(Bill bill);
    List<Bill> findByIdBill(String phone);
    Bill findByIdBillUpdate(Integer id);
}
