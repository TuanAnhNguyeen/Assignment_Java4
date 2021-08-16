package com.dienthoaiviet.model;

import javax.persistence.*;
import java.util.List;

@NamedQueries({
        @NamedQuery(name ="Role.findAll",query = "select o from Role o"),
})
@Entity
@Table(name = "role")
public class Role {
    private int id;
    private String name;

    public Role() {
    }

    public Role(int id) {
        this.id = id;
    }

    @Id
    @Column(name = "Id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 100)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @OneToMany (mappedBy = "role", fetch = FetchType.LAZY)
    List<Staff> list;

}
