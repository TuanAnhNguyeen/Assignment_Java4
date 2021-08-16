package com.dienthoaiviet.model;

import javax.persistence.*;
import java.util.List;


@NamedQueries({
        @NamedQuery(name = "findAllCategory",query = "select o from Category o where o.status = true "),
        @NamedQuery(name ="findByIdCategory",query = "select o from Category o where o.id = ?1 and  o.status = true ")
})
@Entity
@Table(name="category")
public class Category {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private boolean status;
    @OneToMany (mappedBy = "category",fetch = FetchType.LAZY)
    List<Products> list;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    public String checkCategory(List<Integer> list){
        for(Integer x : list){
            if(id == x){
                return "checked";
            }
        }
        return "";
    }

}
