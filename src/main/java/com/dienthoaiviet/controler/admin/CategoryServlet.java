package com.dienthoaiviet.controler.admin;

import com.dienthoaiviet.model.Category;
import com.dienthoaiviet.model.Properties;
import com.dienthoaiviet.service.ICategoryService;
import com.dienthoaiviet.service.IPropertiesService;
import com.dienthoaiviet.service.impl.CategoryService;
import com.dienthoaiviet.service.impl.PropertiesService;
import com.dienthoaiviet.utils.Conmom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/admin/category","/admin/category/addCategory","/admin/category/addProperties",
     "/admin/category/deleteCategory","/admin/category/deleteProperties"})
public class CategoryServlet extends HttpServlet {

    private static ICategoryService categoryService = new CategoryService();
    private static IPropertiesService propertiesService = new PropertiesService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("sumReply", Conmom.CoutMail());
        String uri = req.getRequestURI();
        if(uri.contains("deleteCategory")){
            String id = req.getParameter("id");
            Category category = categoryService.findById(Integer.parseInt(id));
            category.setStatus(false);
            categoryService.updateCategory(category);
            resp.sendRedirect(req.getContextPath()+"/admin/category");
            return;
        }else if(uri.contains("deleteProperties")){
            String id = req.getParameter("id");
            Properties properties = propertiesService.findById(Integer.parseInt(id));
            properties.setStatus(false);
            propertiesService.updateProperties(properties);
            resp.sendRedirect(req.getContextPath()+"/admin/category");
            return;
        }
        req.setAttribute("listCategory",categoryService.findAll());
        req.setAttribute("listProperties",propertiesService.findAll());
        req.setAttribute("content","./Category/tableCategory.jsp");
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String uri = req.getRequestURI();
        if(uri.contains("addCategory")){
            insertCategory(req);
            resp.sendRedirect(req.getContextPath()+"/admin/category");
            return;
        } else if(uri.contains("addProperties")){
            insertProperties(req);
            resp.sendRedirect(req.getContextPath()+"/admin/category");
            return;
        }
    }
    public void insertCategory(HttpServletRequest req){
        String nameCategory = req.getParameter("nameCategory");
        Category category = new Category();
        category.setName(nameCategory);
        category.setStatus(true);
        categoryService.insertCategory(category);
    }
    public void insertProperties(HttpServletRequest req){
        String nameProperties = req.getParameter("nameProperties");
        Properties properties = new Properties();
        properties.setName(nameProperties);
        properties.setStatus(true);
        propertiesService.insertPropreties(properties);
    }
}
