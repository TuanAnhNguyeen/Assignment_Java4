package com.dienthoaiviet.model.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BillSyntheticDto {
    private int id;
    private Date day;
    private int quantity;
    private int sumMoney;
    private int status;
    private String namecustomer;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSumMoney() {
        return sumMoney;
    }

    public void setSumMoney(int sumMoney) {
        this.sumMoney = sumMoney;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getNamecustomer() {
        return namecustomer;
    }

    public void setNamecustomer(String namecustomer) {
        this.namecustomer = namecustomer;
    }
    public String convertDateTime(){
        SimpleDateFormat sdf = new SimpleDateFormat(" dd-MM-yyyy hh:mm:ss a");
        return sdf.format(day);
    }
    public String converStatus(){
        if(status ==0){
            return "Đàng Chờ Xác Nhận";
        }else if(status==1){
            return "Đang Vận Chuyển";
        }else if(status==2) {
            return "Đã Hoàn Thành";
        }else if(status==4){
            return "Đang Chờ Xác Nhận, Đã Thanh Toán";
        }else if(status==5){
            return "Đang Vận Chuyển , Đã Thanh Toán";
        }else {
            return "Đơn Hàng Đã Hủy";
        }
    }
}
