package com.dienthoaiviet.model;

import javax.persistence.*;
import java.util.List;

@NamedQueries({
        @NamedQuery(name = "findAllProducs", query = "select o from Products o where o.status=true"),
        @NamedQuery(name = "findByKeyNameProduct",query = "select o from Products o where o.name = ?1 and o.status=true "),
        @NamedQuery(name = "findByKeyIdProduct",query = "select o from Products o where o.id = ?1 and o.status=true "),
        @NamedQuery(name="findAllHotSale",query = "select distinct o from Products o where o.status=true and o.discout >0 order by o.discout desc"),
        @NamedQuery(name="findAllSortDesc",query = "select distinct o from Products o where o.status=true and o.category.id= ?1 order by o.price desc "),
        @NamedQuery(name="findAllSortAsc",query = "select distinct o from Products o where o.status=true and o.category.id= ?1 order by o.price asc "),
        @NamedQuery(name = "findByCategory",query = "select o from Products o where o.category.id = ?1 and o.status=true"),
        @NamedQuery(name="findAllByPrice",query = "select o from Products o where o.price > ?1 and o.price < ?2 and o.status=true"),
        @NamedQuery(name="findAllByKeyword",query = "select o from Products o where o.status=true and o.name like?1"),
}
)
@Entity
@Table(name = "products",uniqueConstraints = {
        @UniqueConstraint(columnNames = "idcategory"),
        @UniqueConstraint(columnNames = "idproperties")
})
public class Products {
    @Id
    private String id;
    private String name;
    private String details;
    private int price;
    private double discout;
    private int importprice;
    private String image;
    private boolean status;
    @ManyToOne @JoinColumn(name = "idcategory")
    private Category category;
    @ManyToOne @JoinColumn(name="idproperties")
    private Properties properties;
    @OneToMany (mappedBy = "products",fetch = FetchType.LAZY)
    List<Image> list;
    @OneToMany(mappedBy = "products",fetch = FetchType.LAZY)
    List<Products_details> listProductDesc;
    @OneToMany (mappedBy = "products",fetch = FetchType.LAZY)
    List<CustomerViews> customerViewsList;

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

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public double getDiscout() {
        return discout;
    }

    public void setDiscout(double discout) {
        this.discout = discout;
    }

    public int getImportprice() {
        return importprice;
    }

    public void setImportprice(int importprice) {
        this.importprice = importprice;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Properties getProperties() {
        return properties;
    }

    public void setProperties(Properties properties) {
        this.properties = properties;
    }
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    public int convertPrice(){
        int price = (int) ((1-discout/100)*getPrice());
        return price;
    }
    public String showPrice(){
        return convertPrice()+"đ";
    }
    public String showPriceDiscout(){
        return price + "đ";
    }
    public String convertDiscout(){
        if (discout>0){
            return discout+"%";
        }
        return "";
    }
}
