package com.dienthoaiviet.dao;


import com.dienthoaiviet.model.Top10Total;
import com.dienthoaiviet.model.dto.BillSyntheticDto;

import java.util.List;

public interface IStoredProcedureDao {
    List<BillSyntheticDto> findBillCustomer(String phone);
    List<BillSyntheticDto> findBillAll_Status(Integer status1,Integer status2);
    List<Top10Total> findTop10();
}
