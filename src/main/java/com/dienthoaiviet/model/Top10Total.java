package com.dienthoaiviet.model;

import javax.persistence.*;

@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name= "findTop10_productTotal",procedureName = "findTop10_productTotal",
                parameters = {
                        @StoredProcedureParameter(name = "day",type = Integer.class, mode = ParameterMode.IN)},
                resultClasses = {Top10Total.class}
        )
})
@Entity
public class Top10Total {
    @Id
    private String id;
    private String name;
    private int sumtotal;



    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSumtotal() {
        return sumtotal;
    }

    public void setSumtotal(int sumtotal) {
        this.sumtotal = sumtotal;
    }
}
