package com.dienthoaiviet.dao.impl;

import com.dienthoaiviet.dao.IStoredProcedureDao;
import com.dienthoaiviet.model.BillSynthetic;
import com.dienthoaiviet.model.Top10Total;
import com.dienthoaiviet.model.dto.BillSyntheticDto;
import com.dienthoaiviet.model.mapper.BillSyntheticMapper;

import javax.persistence.StoredProcedureQuery;
import java.util.ArrayList;
import java.util.List;

public class StoredProcedureDao extends AbstractDao implements IStoredProcedureDao {
    @Override
    public List<BillSyntheticDto> findBillCustomer(String phone) {
        StoredProcedureQuery query = em.createNamedStoredProcedureQuery("find_bill");
        query.setParameter("phoneNumber",phone);
        List<BillSynthetic> list =query.getResultList();
        List<BillSyntheticDto> dtoList = new ArrayList<>();
        for(BillSynthetic x : list){
            dtoList.add(BillSyntheticMapper.toBillSyntheticDto(x));
        }
        return list.isEmpty() ? null : dtoList;
    }

    @Override
    public List<BillSyntheticDto> findBillAll_Status(Integer status1,Integer status2) {
        StoredProcedureQuery query = em.createNamedStoredProcedureQuery("findAll_bill");
        query.setParameter("status1",status1);
        query.setParameter("status2",status2);
        List<BillSynthetic> list =query.getResultList();
        List<BillSyntheticDto> dtoList = new ArrayList<>();
        for(BillSynthetic x : list){
            dtoList.add(BillSyntheticMapper.toBillSyntheticDto(x));
        }
        return list.isEmpty() ? null : dtoList;
    }

    @Override
    public List<Top10Total> findTop10() {
        StoredProcedureQuery query = em.createNamedStoredProcedureQuery("findTop10_productTotal");
        query.setParameter("day",1);
        List<Top10Total> list = query.getResultList();
        return list.isEmpty() ? null : list;
    }
}
