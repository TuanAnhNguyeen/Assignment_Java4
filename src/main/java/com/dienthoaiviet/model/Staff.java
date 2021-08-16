package com.dienthoaiviet.model;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@NamedQueries({
        @NamedQuery(name = "findAll",query = "select o from Staff o where o.status = true "),
        @NamedQuery(name = "findByRole", query = "select o from Staff o where o.role = :role  and o.status = true"),
        @NamedQuery(name = "findByIdAndPassword",query = "select o from Staff o where o.id= ?1 and o.password= ?2  and o.status = true"),
        @NamedQuery(name = "findById", query = "select o from Staff o where  o.id= ?1  and o.status = true"),
        @NamedQuery(name = "findByEmail", query =  "select  o from Staff  o where  o.email= ?1  and o.status = true"),
        @NamedQuery(name ="findByPhone", query = "select o from Staff o where o.phonenumber= ?1  and o.status = true"),
        @NamedQuery(name = "findByKeyWord", query = "select o from Staff o where  o.fullname like ?1  and o.status = true")
})
@Entity
@Table(name = "Staff",uniqueConstraints = {
        @UniqueConstraint(columnNames = {"roleid"})
})
public class Staff {
    private Integer id;
    private String fullname;
    private String password;
    private boolean status;
    private Date birthday;
    private String address;
    private String email;
    private String phonenumber;
    private String image;
    private long salary;
    private boolean gender;
    private Role role;
    @OneToMany (mappedBy = "staff")
    private List<Bill> list;


    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "fullname", nullable = false, length = 50)
    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    @Basic
    @Column(name = "password",nullable = false)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "birthday", nullable = false)
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @Basic
    @Column(name = "address", nullable = false, length = 200)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "email", nullable = false, length = 100)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "phonenumber", nullable = false, length = 25)
    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    @Basic
    @Column(name = "image", nullable = false, length = 100)
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Basic
    @Column(name = "salary", nullable = false)
    public long getSalary() {
        return salary;
    }

    public void setSalary(long salary) {
        this.salary = salary;
    }
    @Basic
    @Column(name = "status" , nullable = false)
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    @Basic
    @Column(name = "gender",nullable = false)
    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    @ManyToOne @JoinColumn(name = "roleid")
    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }


}
