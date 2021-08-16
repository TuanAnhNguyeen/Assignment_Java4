package com.dienthoaiviet.model.mapper;

import com.dienthoaiviet.model.BillSynthetic;
import com.dienthoaiviet.model.dto.BillSyntheticDto;

public class BillSyntheticMapper {
    public  static BillSyntheticDto toBillSyntheticDto(BillSynthetic billSynthetic){
        BillSyntheticDto billSyntheticDto = new BillSyntheticDto();
        billSyntheticDto.setId(billSynthetic.getId());
        billSyntheticDto.setStatus(billSynthetic.getStatus());
        billSyntheticDto.setDay(billSynthetic.getDay());
        billSyntheticDto.setNamecustomer(billSynthetic.getNamecustomer());
        billSyntheticDto.setSumMoney(billSynthetic.getSumMoney());
        billSyntheticDto.setQuantity(billSynthetic.getQuantity());
        return billSyntheticDto;
    }
}
