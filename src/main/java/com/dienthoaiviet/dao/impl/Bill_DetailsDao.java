package com.dienthoaiviet.dao.impl;

import com.dienthoaiviet.dao.IBill_DetailsDao;
import com.dienthoaiviet.model.Bill_details;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import java.util.List;

public class Bill_DetailsDao extends AbstractDao<Bill_details> implements IBill_DetailsDao {
    @Override
    public List<Bill_details> findAllBill_Details(Integer id) {
        List<Bill_details> list = excuteQuery("findAllBill_Details", Bill_details.class,id);
        return list.isEmpty() ? null : list;
    }

    @Override
    public void insertBill_Details(Bill_details bill_details) {
        excuteUpate(bill_details, MethodconstantDao.INSERT);
    }

    @Override
    public void updateBill_Details(Bill_details bill_details) {
        excuteUpate(bill_details, MethodconstantDao.UPDATE);
    }

    @Override
    public void deleteBIll_Details(Bill_details bill_details) {
        excuteUpate(bill_details, MethodconstantDao.DELETE);
    }
//
//    @Override
//    public List<Bill_details> findByIdBillToDetals(Integer id) {
//        List<Bill_details> list =excuteQuery("findByIdBillToDetals",Bill_details.class,id);
//        return list.isEmpty() ? null : list;
//    }
}
