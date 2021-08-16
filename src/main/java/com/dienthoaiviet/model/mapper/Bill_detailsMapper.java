//package com.dienthoaiviet.model.mapper;
//
//import com.dienthoaiviet.model.Bill_details;
//import com.dienthoaiviet.model.dto.Bill_detailsDto;
//
//public class Bill_detailsMapper {
//    public static Bill_detailsDto toBill_detailsDto(Bill_details bill_details){
//        Bill_detailsDto tmp = new Bill_detailsDto();
//        tmp.setId(bill_details.getId());
//        tmp.setBill(bill_details.getBill());
//        tmp.setQuantity(bill_details.getQuantity());
//        tmp.setProducts_details(bill_details.getProducts_details());
//        return  tmp;
//    }
//    public  static Bill_details toBill_details(Bill_detailsDto bill_details){
//        Bill_details tmp = new Bill_details();
//        tmp.setId(bill_details.getId());
//        tmp.setBill(bill_details.getBill());
//        tmp.setQuantity(bill_details.getQuantity());
//        tmp.setProducts_details(bill_details.getProducts_details());
//        return  tmp;
//    }
//}
