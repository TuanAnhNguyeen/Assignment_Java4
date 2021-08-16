package com.dienthoaiviet.model;


import javax.persistence.*;
import java.util.List;

@NamedQueries({
        @NamedQuery(name = "findAllProperties",query = "select o from Properties o where o.status = true "),
        @NamedQuery(name = "findByIdProperties",query = "select o from Properties o where o.status=true")
})
@Entity
@Table(name="properties")
public class Properties {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private boolean status;
    @OneToMany (mappedBy = "properties",fetch = FetchType.LAZY)
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
}
