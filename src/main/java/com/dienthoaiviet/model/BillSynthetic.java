package com.dienthoaiviet.model;


import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name= "find_bill",procedureName = "find_bill",
        parameters = {
                @StoredProcedureParameter(name = "phoneNumber",type = String.class, mode = ParameterMode.IN)},
                resultClasses = {BillSynthetic.class}
        ), @NamedStoredProcedureQuery(name= "findAll_bill",procedureName = "findAll_bill",
        parameters = {
                @StoredProcedureParameter(name = "status1",type = Integer.class, mode = ParameterMode.IN),
                @StoredProcedureParameter(name = "status2",type = Integer.class, mode = ParameterMode.IN)
        },
        resultClasses = {BillSynthetic.class}
)
})
@Entity
public class BillSynthetic {
    @Id
    private int id;
    private Date day;
    private int quantity;
    private int sumMoney;
    private int status;
    private String namecustomer;


    public BillSynthetic() {
    }

    public BillSynthetic(int id, Date day, int quantity, int sumMoney, int status) {
        this.id = id;
        this.day = day;
        this.quantity = quantity;
        this.sumMoney = sumMoney;
        this.status = status;
    }

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
        }else {
            return "Đơn Hàng Đã Hủy";
        }
    }
}
