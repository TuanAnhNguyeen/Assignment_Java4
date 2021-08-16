package com.dienthoaiviet.model;


import javax.persistence.*;
import java.util.Date;
import java.util.List;

@NamedQueries({
        @NamedQuery(name = "findAllBill", query = "select o from Bill o where o.status= ?1 order by o.id desc "),
        @NamedQuery(name = "findByIdBill",query = "select o from Bill o where o.customer.phoneNumber= ?1"),
        @NamedQuery(name="findBillByIdBill",query = "select o from Bill o where o.id = ?1 ")
}
)
@Entity
@Table(name="bill", uniqueConstraints = {
        @UniqueConstraint(columnNames = "customerid"),
        @UniqueConstraint(columnNames = "staffid")
})
public class Bill {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne @JoinColumn(name = "staffid",nullable = true)
    private Staff staff;
    @ManyToOne @JoinColumn(name = "customerid")
    private Customer customer;
    private Date day = new Date();
    private int status;
    @OneToMany(mappedBy = "bill",fetch = FetchType.LAZY)
    List<Bill_details> list;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
//    public String converStatus(){
//        if(status ==0){
//            return "Đàng Chờ Xác Nhận";
//        }else if(status==1){
//            return "Đang Vận Chuyển";
//        }else if(status==2) {
//            return "Đã Hoàn Thành";
//        }else {
//            return "Đơn Hàng Đã Hủy";
//        }
//    }
}
