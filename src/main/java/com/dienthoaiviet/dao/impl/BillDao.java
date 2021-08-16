package com.dienthoaiviet.dao.impl;

import com.dienthoaiviet.dao.IBillDao;
import com.dienthoaiviet.model.Bill;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import java.util.List;

public class BillDao extends AbstractDao<Bill> implements IBillDao {
    @Override
    public List<Bill>  findByIdBill(String phone) {
        List<Bill> list = excuteQuery("findByIdBill",Bill.class,phone);
        return list.isEmpty() ? null : list;
    }

    @Override
    public void insertBill(Bill bill) {
        excuteUpate(bill, MethodconstantDao.INSERT);
    }

    @Override
    public void updateBill(Bill bill) {
        excuteUpate(bill,MethodconstantDao.UPDATE);
    }

    @Override
    public void deleteBill(Bill bill) {
        excuteUpate(bill,MethodconstantDao.DELETE);
    }

    @Override
    public List<Bill> findAllBill(int status) {
        List<Bill> list = excuteQuery("findAllBill",Bill.class,status);
        return list.isEmpty() ? null : list;
    }

    @Override
    public Bill findByIdBillUpdate(Integer id) {
        List<Bill> list = excuteQuery("findBillByIdBill",Bill.class,id);
        return list.isEmpty() ? null : list.get(0);
    }
}
