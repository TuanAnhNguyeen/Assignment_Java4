package com.dienthoaiviet.dao;

import com.dienthoaiviet.model.Bill_details;

import java.util.List;

public interface IBill_DetailsDao extends GenegicDao<Bill_details>{
    List<Bill_details> findAllBill_Details(Integer id);
    void insertBill_Details(Bill_details bill_details);
    void updateBill_Details(Bill_details bill_details);
    void deleteBIll_Details(Bill_details bill_details);
}
