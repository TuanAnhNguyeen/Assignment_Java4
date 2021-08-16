package com.dienthoaiviet.controler.admin;

import com.dienthoaiviet.dao.IImageDao;
import com.dienthoaiviet.dao.IProductsDao;
import com.dienthoaiviet.dao.IProducts_detailsDao;
import com.dienthoaiviet.dao.impl.ImageDao;
import com.dienthoaiviet.dao.impl.ProductsDao;
import com.dienthoaiviet.dao.impl.Products_detailsDao;
import com.dienthoaiviet.exception.ExceptionCommon;
import com.dienthoaiviet.model.Image;
import com.dienthoaiviet.model.Products;
import com.dienthoaiviet.model.Products_details;
import com.dienthoaiviet.model.dto.Product_detailsDto;
import com.dienthoaiviet.service.ICategoryService;
import com.dienthoaiviet.service.IPropertiesService;
import com.dienthoaiviet.service.impl.CategoryService;
import com.dienthoaiviet.service.impl.PropertiesService;
import com.dienthoaiviet.utils.Conmom;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig
@WebServlet({"/admin/products/*", "/admin/products/add", "/admin/products/edit", "/admin/products/delete"})
public class ProductsServlet extends HttpServlet {
    private static IProducts_detailsDao products_detailsDao = new Products_detailsDao();
    private static ICategoryService categoryService = new CategoryService();
    private static IPropertiesService propertiesService = new PropertiesService();
    private static IProductsDao productsDao = new ProductsDao();
    private static IImageDao imageDao = new ImageDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("sumReply", Conmom.CoutMail());
        String uri = req.getRequestURI();
        req.setAttribute("listProperties", propertiesService.findAll());
        req.setAttribute("listCategory", categoryService.findAll());
        if (uri.contains("add")) {
            req.setAttribute("content", "./Products/addProduct.jsp");
        }else if(uri.contains("edit")){
            String key = req.getParameter("key");
            Products products = productsDao.findByKeyProduct(key);
            if(products==null){
                req.setAttribute("checkErorr",true);
                req.setAttribute("messengeError","Sản phẩm bạn tìm không tồn tại!!!!");
                req.setAttribute("link",req.getContextPath()+"/admin/products");
                req.setAttribute("listProducts", products_detailsDao.findAll());
                req.setAttribute("content", "./Products/tableProduct.jsp");
                req.getRequestDispatcher("/views/admin/index.jsp").forward(req, resp);
                return;
            }
            req.setAttribute("product",products);
            if(imageDao.findByIdImage(products.getId())!=null) {
                List<Image> list = imageDao.findByIdImage(products.getId());
                req.setAttribute("listImage", imageDao.findByIdImage(products.getId()));
            }
            req.setAttribute("listProduct_details",products_detailsDao.findByProduct_details(products.getId()));
            req.setAttribute("content", "./Products/editProduct.jsp");
        }else{
            req.setAttribute("listProducts", products_detailsDao.findAll());
            req.setAttribute("content", "./Products/tableProduct.jsp");
        }
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String uri = req.getRequestURI();
        req.setAttribute("listProperties", propertiesService.findAll());
        req.setAttribute("listCategory", categoryService.findAll());
        if (uri.contains("add")) {
          if( insertProduct(req, resp)){
              resp.sendRedirect(req.getContextPath()+"/admin/products");
              return;
          }else {
              req.setAttribute("content", "./Products/addProduct.jsp");
          }
        }else if(uri.contains("edit")){
            if(UpdateProduct(req)){
                resp.sendRedirect(req.getContextPath()+"/admin/products");
                return;
            }else {
                req.setAttribute("content", "./Products/editProduct.jsp");
            }
        }
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req, resp);
    }
   public Products addProduct(HttpServletRequest req) throws ServletException, IOException{
       Products products = new Products();
       String id = req.getParameter("id");
       String name = req.getParameter("name");
       String dicout = req.getParameter("discout");
       String price = req.getParameter("price");
       String importPrice = req.getParameter("importPrice");
       String idproperties = req.getParameter("properties");
       String idcategory = req.getParameter("category");
       String details = req.getParameter("note");
       products.setId(id);
       products.setName(name);
       products.setCategory(categoryService.findById(Integer.parseInt(idcategory)));
       products.setProperties(propertiesService.findById(Integer.parseInt(idproperties)));
       products.setPrice(Integer.parseInt(price));
       products.setImportprice(Integer.parseInt(importPrice));
       products.setDiscout(Double.parseDouble(dicout));
       products.setDetails(details);
       products.setStatus(true);
       return products;
   }
    public boolean insertProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(vadidate(req,MethodconstantDao.INSERT)==false){
            return false;
        }
        Products products = addProduct(req);
//        String id = req.getParameter("id");
//        String name = req.getParameter("name");
//        String dicout = req.getParameter("discout");
//        String price = req.getParameter("price");
//        String importPrice = req.getParameter("importPrice");
//        String idproperties = req.getParameter("properties");
//        String idcategory = req.getParameter("category");
//        String details = req.getParameter("note");
        String[] color = req.getParameterValues("color");
        String[] quantity = req.getParameterValues("quantity");
        File file = new File(req.getServletContext().getRealPath("files"));
        List<String> listNameImage = new ArrayList<>();
            for (Part part : req.getParts()) {
                if(part.getSubmittedFileName()!=null) {
                    File photoFile = new File(file, part.getSubmittedFileName());
                    part.write(photoFile.getAbsolutePath());
                    if (part == req.getPart("photo_banner")) {
                        products.setImage(photoFile.getName());
                    } else {
                        listNameImage.add(photoFile.getName());
                    }
                }else {
                    break;
                }
            }
//            products.setId(id);
//            products.setName(name);
//            products.setCategory(categoryService.findById(Integer.parseInt(idcategory)));
//            products.setProperties(propertiesService.findById(Integer.parseInt(idproperties)));
//            products.setPrice(Integer.parseInt(price));
//            products.setImportprice(Integer.parseInt(importPrice));
//            products.setDiscout(Double.parseDouble(dicout));
//            products.setDetails(details);
//            products.setStatus(true);
            productsDao.insertProduct(products);
        for (int i = 0; i <color.length ; i++) {
            if(color[i].isEmpty() && quantity[i].isEmpty() ){
                System.out.println(1);
            }else {
                Product_detailsDto products_details = new Product_detailsDto();
                products_details.setProducts(products);
                products_details.setId(products.getId()+"0"+i);
                products_details.setColor(color[i]);
                products_details.setQuantity(Integer.parseInt(quantity[i]));
                products_detailsDao.insertProducts_details(products_details);
                System.out.println(1);
            }
        }
        for (String x : listNameImage){
            Image image = new Image();
            image.setName(x);
            image.setProducts(products);
            imageDao.insertImage(image);
        }
        return true;
    }
    public boolean UpdateProduct(HttpServletRequest req)throws ServletException, IOException{
        if(vadidate(req,MethodconstantDao.UPDATE)==false){
            return false;
        }
        Products products = addProduct(req);
//        String id = req.getParameter("id");
//        String name = req.getParameter("name");
//        String dicout = req.getParameter("discout");
//        String price = req.getParameter("price");
//        String importPrice = req.getParameter("importPrice");
//        String idproperties = req.getParameter("properties");
//        String idcategory = req.getParameter("category");
//        String details = req.getParameter("note");
        File file = new File(req.getServletContext().getRealPath("files"));
        Part banner = req.getPart("photo_banner");
        File photo_file = new File(file, banner.getSubmittedFileName());
        String nameBanner = banner.getSubmittedFileName();
        if(nameBanner.equals("")){
            String anh = productsDao.findByIdProduct(products.getId()).getImage();
            products.setImage(anh);
        }else {
            banner.write(photo_file.getAbsolutePath());
            products.setImage(photo_file.getName());
        }
        productsDao.updateProduct(products);
        return true;
    }

    public boolean vadidate(HttpServletRequest req, String method) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String dicout = req.getParameter("discout");
        String importPrice = req.getParameter("importPrice");
        String idproperties = req.getParameter("properties");
        String idcategory = req.getParameter("category");
        String[] color = req.getParameterValues("color");
        String [] quantity = req.getParameterValues("quantity");
        String details = req.getParameter("note");
        boolean check = true;
        if (id.isEmpty()) {
            req.setAttribute("erorrId", "ID Trống!!!!");
            check = false;
        }else if(productsDao.findByKeyProduct(id)!=null && method.equals(MethodconstantDao.INSERT)){
            req.setAttribute("erorrId", "ID Đã Tồn Tại!!!!");
            check = false;
        }
        if (name.isEmpty()) {
            req.setAttribute("errorName", "Tên Sản Phẩm Trống !!!!");
            check = false;
        }
        if (!ExceptionCommon.checkMoney(price).equals("")) {
            req.setAttribute("errorPrice", ExceptionCommon.checkMoney(price));
            check = false;
        }
        if (!ExceptionCommon.checkMoney(importPrice).equals("")) {
            req.setAttribute("errorImportPrice", ExceptionCommon.checkMoney(importPrice));
            check = false;
        }
        if(!ExceptionCommon.checkNumber(dicout).equals("")){
            req.setAttribute("errorDiscout",ExceptionCommon.checkNumber(dicout));
            check = false;
        }
        if (idcategory.isEmpty()) {
            req.setAttribute("errorCategory", "Chưa Chọn Hãng");
            check = false;
        }
        if (idproperties.isEmpty()) {
            req.setAttribute("errorProperties", "Chưa Chọn Dung Lượng");
            check = false;
        }
        if(details.isEmpty()){
            req.setAttribute("errorDetails", "Mô tả sản phẩm trống !!!");
        }
        if(method.equals(MethodconstantDao.INSERT)) {
            if (color.length == 0 || quantity.length == 0) {
                req.setAttribute("errorColor", "Chi Tiết Sản Phẩm Trống !!!");
            } else {
                for (int i = 0; i < color.length; i++) {
                    if (color[i].isEmpty() && quantity[i].isEmpty()) {

                    } else if (color[i].isEmpty() || quantity[i].isEmpty()) {
                        req.setAttribute("errorColor", "Chi Tiết Sản Phẩm Trống !!!");
                    }
                }
            }
        }
        File file = new File(req.getServletContext().getRealPath("files"));
        if (!file.exists()) {
            file.mkdirs();
        }
        Part banner = req.getPart("photo_banner");
        String nameBanner = banner.getSubmittedFileName();
        if(nameBanner.isEmpty()&& method.equals(MethodconstantDao.INSERT)){
            req.setAttribute("errorPhoto_banner","Hình Ảnh Banner trống !!!");
            check = false;
        }
        if(check == false){
            return false;
        }else {
            return true;
        }

    }
}
