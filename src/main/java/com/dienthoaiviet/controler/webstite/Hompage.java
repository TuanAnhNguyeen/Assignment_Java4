package com.dienthoaiviet.controler.webstite;

import com.dienthoaiviet.dao.ICustomerViews;
import com.dienthoaiviet.dao.IImageDao;
import com.dienthoaiviet.dao.IProductsDao;
import com.dienthoaiviet.dao.IProducts_detailsDao;
import com.dienthoaiviet.dao.impl.CustomerViewsDao;
import com.dienthoaiviet.dao.impl.ImageDao;
import com.dienthoaiviet.dao.impl.ProductsDao;
import com.dienthoaiviet.dao.impl.Products_detailsDao;
import com.dienthoaiviet.model.*;
import com.dienthoaiviet.model.CustomerViews;
import com.dienthoaiviet.model.dto.Product_detailsDto;
import com.dienthoaiviet.service.ICategoryService;
import com.dienthoaiviet.service.IPropertiesService;
import com.dienthoaiviet.service.impl.CategoryService;
import com.dienthoaiviet.service.impl.PropertiesService;
import com.dienthoaiviet.utils.CookieUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/homepage/*","/homepage/dienthoai","/homepage/dienthoai/views","/homepage/hang",
      "/homepage/xoagio","/homepage/search"})
public class Hompage extends HttpServlet {
    private static IProducts_detailsDao products_detailsDao = new Products_detailsDao();
    private static ICategoryService categoryService = new CategoryService();
    private static IPropertiesService propertiesService = new PropertiesService();
    private static IProductsDao productsDao = new ProductsDao();
    private static IImageDao imageDao = new ImageDao();
    private static ICustomerViews customerViewsDao = new CustomerViewsDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri=req.getRequestURI();
        req.setAttribute("listCategory",categoryService.findAll());
        req.setAttribute("listProperties",propertiesService.findAll());
        List<Products> listHotSale =productsDao.findHotSale();
        req.setAttribute("listHotSale",listHotSale);
        req.setAttribute("listSamSung",productsDao.findByCategory(1));
        req.setAttribute("listIphone",productsDao.findByCategory(8));
        req.setAttribute("listXiaomi",productsDao.findByCategory(9));
        getCart(req,resp);
        if(uri.contains("dienthoai")){
            String nameProduct = req.getParameter("name");
            Products product = productsDao.findByKeyProduct(nameProduct);
            List<Image> listImage = imageDao.findByIdImage(product.getId());
            String id = product.getId().trim();
            List<Product_detailsDto> listProduct_details5 = products_detailsDao.findByProduct_details(id);
            req.setAttribute("listSimilarProduct",productsDao.findByAllPrice(product.getPrice()-1000,product.getPrice()+1000));
            if(customerViewsDao.findAll(product.getId())!= null){
                req.setAttribute("listViews",customerViewsDao.findAll(product.getId()));
            }
            req.setAttribute("listProduct_details",listProduct_details5);
            req.setAttribute("listImageProduct",listImage);
            req.setAttribute("product",product);
            req.setAttribute("contentHomePage","product.jsp");
        }else if(uri.contains("hang")){
            String id = req.getParameter("id");
            String sort = req.getParameter("sort");
            if(sort!=null) {
                if (sort.equalsIgnoreCase("asc")) {
                    req.setAttribute("listProductCategory", productsDao.findAllSortAsc(Integer.parseInt(id)));
                } else {
                    req.setAttribute("listProductCategory", productsDao.findAllSortDesc(Integer.parseInt(id)));
                }
            }else {
                req.setAttribute("listProductCategory", productsDao.findByCategory(Integer.parseInt(id)));
            }
            req.setAttribute("IdCategory",Integer.parseInt(id));
            req.setAttribute("contentHomePage","category.jsp");
        }else if(uri.contains("xoagio")){
            String id = req.getParameter("SanPham");
            String nameCookie = "IdProduct"+id;
            CookieUtils.add(nameCookie,"1",0,resp);
            resp.sendRedirect(req.getContextPath()+"/homepage");
            return;
        }else {
            req.setAttribute("contentHomePage","homepage.jsp");
        }
        req.getRequestDispatcher("/views/website/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String uri = req.getRequestURI();
        if(uri.contains("views")){
            String name = req.getParameter("name");
            String conment = req.getParameter("comment");
            String author = req.getParameter("author");
            String phoneNumber = req.getParameter("phone");
            CustomerViews customerViews = new CustomerViews();
            Products products = productsDao.findByKeyProduct(name);
            customerViews.setProducts(products);
            customerViews.setName(author);
            customerViews.setNote(conment);
            customerViews.setPhone(phoneNumber);
            customerViewsDao.inserViews(customerViews);
            resp.sendRedirect(req.getContextPath()+"/homepage/dienthoai?name="+name);
            return;
        }else if(uri.contains("search")){
            req.setAttribute("listCategory",categoryService.findAll());
            req.setAttribute("listProperties",propertiesService.findAll());
            String key = req.getParameter("key");
            List<Products> productsList = productsDao.findByKeyword(key);
            if(productsList==null){
                req.setAttribute("checkListProduct",false);
            }else {
                req.setAttribute("checkListProduct",true);
                req.setAttribute("listProductSearch",productsList);
            }
            req.setAttribute("contentHomePage","search.jsp");
            req.getRequestDispatcher("/views/website/index.jsp").forward(req,resp);
            return;
        }
    }
    private void getCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        List<Product_detailsDto> listProduct_details_cart = new ArrayList<>();
        int sum =0;
        int count =0;
        for (Cookie cookie : cookies){
            if(cookie.getName().contains("IdProduct")){
                Product_detailsDto products_details = new Product_detailsDto();
                String id = cookie.getName().replace("IdProduct","");
                products_details=products_detailsDao.findByIdProduct_details(id.trim());
                products_details.setQuantity(Integer.parseInt(cookie.getValue()));
                listProduct_details_cart.add(products_details);
            }
        }
        for(Product_detailsDto x : listProduct_details_cart){
            sum = (int) (sum + x.getProducts().getPrice()*(1-x.getProducts().getDiscout()/100)*x.getQuantity());
            count++;
        }
        req.setAttribute("sumMoney",sum);
        req.setAttribute("sumQuantity",count);
        req.setAttribute("listProduct_details_cart",listProduct_details_cart);
    }

}
