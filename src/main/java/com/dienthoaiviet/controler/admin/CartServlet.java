package com.dienthoaiviet.controler.admin;

import com.dienthoaiviet.dao.IBillDao;
import com.dienthoaiviet.dao.IBill_DetailsDao;
import com.dienthoaiviet.dao.IProducts_detailsDao;
import com.dienthoaiviet.dao.IStoredProcedureDao;
import com.dienthoaiviet.dao.impl.BillDao;
import com.dienthoaiviet.dao.impl.Bill_DetailsDao;
import com.dienthoaiviet.dao.impl.Products_detailsDao;
import com.dienthoaiviet.dao.impl.StoredProcedureDao;
import com.dienthoaiviet.model.Bill;
import com.dienthoaiviet.model.Bill_details;
import com.dienthoaiviet.model.dto.Product_detailsDto;
import com.dienthoaiviet.utils.Conmom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/cart/*","/admin/cart/xacnhandoncho","/admin/cart/huydoncho","/admin/cart/xacnhanhanggiao","/admin/cart/huydon"})
public class CartServlet extends HttpServlet {
    private static IStoredProcedureDao storedProcedureDao = new StoredProcedureDao();
    private static IBillDao billDao = new BillDao();
    private static IBill_DetailsDao bill_detailsDao = new Bill_DetailsDao();
    private static IProducts_detailsDao products_detailsDao = new Products_detailsDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("sumReply", Conmom.CoutMail());
        String uri = req.getRequestURI();
        if(uri.contains("xacnhandoncho")){
            String id = req.getParameter("id");
            Bill bill = billDao.findByIdBillUpdate(Integer.parseInt(id));
            if(bill.getStatus()==4){
                bill.setStatus(5);
            }else {
                bill.setStatus(1);
            }
            billDao.updateBill(bill);
            List<Bill_details> bill_detailsList = bill_detailsDao.findAllBill_Details(Integer.parseInt(id));
            for (Bill_details x : bill_detailsList){
                Product_detailsDto products_details = products_detailsDao.findByIdProduct_details(x.getProducts_details().getId());
                products_details.setQuantity(products_details.getQuantity()-x.getQuantity());
                products_detailsDao.updateProducts_details(products_details);
            }
            System.out.println(bill.getStatus());
            resp.sendRedirect(req.getContextPath()+"/admin/bill/xacnhan");
            return;
        }else if(uri.contains("xacnhanhanggiao")){
            String id = req.getParameter("id");
            Bill bill = billDao.findByIdBillUpdate(Integer.parseInt(id));
            bill.setStatus(2);
            billDao.updateBill(bill);
            resp.sendRedirect(req.getContextPath()+"/admin/bill/giaohang");
            return;
        }else if(uri.contains("huydoncho")){
            String id = req.getParameter("id");
            Bill bill = billDao.findByIdBillUpdate(Integer.parseInt(id));
            bill.setStatus(3);
            billDao.updateBill(bill);
            resp.sendRedirect(req.getContextPath()+"/admin/bill/xacnhan");
            return;
        }else if(uri.contains("huydon")){
            String id = req.getParameter("id");
            Bill bill = billDao.findByIdBillUpdate(Integer.parseInt(id));
            bill.setStatus(3);
            billDao.updateBill(bill);
            List<Bill_details> bill_detailsList = bill_detailsDao.findAllBill_Details(Integer.parseInt(id));
            for (Bill_details x : bill_detailsList){
                Product_detailsDto products_details = products_detailsDao.findByIdProduct_details(x.getProducts_details().getId());
                products_details.setQuantity(products_details.getQuantity()+x.getQuantity());
                products_detailsDao.updateProducts_details(products_details);
            }
            resp.sendRedirect(req.getContextPath()+"/admin/bill/giaohang");
            return;
        }
    }
}
