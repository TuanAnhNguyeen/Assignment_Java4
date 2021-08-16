package com.dienthoaiviet.controler.admin;

import com.dienthoaiviet.dao.IBillDao;
import com.dienthoaiviet.dao.IBill_DetailsDao;
import com.dienthoaiviet.dao.IStoredProcedureDao;
import com.dienthoaiviet.dao.impl.BillDao;
import com.dienthoaiviet.dao.impl.Bill_DetailsDao;
import com.dienthoaiviet.dao.impl.StoredProcedureDao;
import com.dienthoaiviet.model.Bill;
import com.dienthoaiviet.model.BillSynthetic;
import com.dienthoaiviet.model.Bill_details;
import com.dienthoaiviet.model.dto.BillSyntheticDto;
import com.dienthoaiviet.utils.Conmom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/bill/*","/admin/bill/xacnhan","/admin/bill/giaohang","/admin/bill/dathanhtoan","/admin/bill/xacnhan/hoadon",
"/admin/bill/giaohang/hoadon"})
public class BillServlet extends HttpServlet {
    private static IStoredProcedureDao storedProcedureDao = new StoredProcedureDao();
    private static IBillDao billDao = new BillDao();
    private static IBill_DetailsDao bill_detailsDao = new Bill_DetailsDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("sumReply", Conmom.CoutMail());
        String uri = req.getRequestURI();
        if (uri.contains("xacnhan")) {
            if(uri.contains("hoadon")){
                listBill_DESC(req,resp);
                req.setAttribute("linkBill",req.getContextPath()+"/admin/bill/xacnhan");
            }
            List<BillSyntheticDto> billSyntheticConfrimList = storedProcedureDao.findBillAll_Status(0,4);
            if(billSyntheticConfrimList != null) {
                for (BillSyntheticDto x : billSyntheticConfrimList) {
                    Bill bill = billDao.findByIdBillUpdate(x.getId());
                    x.setStatus(bill.getStatus());
                }
            }
            req.setAttribute("listBillAll_Status_confrim", billSyntheticConfrimList);
            req.setAttribute("content", "./bill/billconfrim.jsp");
        }else if(uri.contains("giaohang")){
            if(uri.contains("hoadon")){
                listBill_DESC(req,resp);
                req.setAttribute("linkBill",req.getContextPath()+"/admin/bill/giaohang");
            }
            List<BillSyntheticDto> billSyntheticConfrimList = storedProcedureDao.findBillAll_Status(1,5);
            if(billSyntheticConfrimList != null) {
                for (BillSyntheticDto x : billSyntheticConfrimList) {
                    Bill bill = billDao.findByIdBillUpdate(x.getId());
                    x.setStatus(bill.getStatus());
                }
            }
            req.setAttribute("listBillAll_Status_tranposst", billSyntheticConfrimList);
            req.setAttribute("content", "./bill/billtransport.jsp");
        }
        else {
            if(uri.contains("dathanhtoan")){
               listBill_DESC(req,resp);
                req.setAttribute("linkBill",req.getContextPath()+"/admin/bill/dathanhtoan");
            }
            List<BillSyntheticDto> billSyntheticList = storedProcedureDao.findBillAll_Status(2,2);
            if(billSyntheticList != null) {
                for (BillSyntheticDto x : billSyntheticList) {
                    Bill bill = billDao.findByIdBillUpdate(x.getId());
                    x.setStatus(bill.getStatus());
                }
            }
            req.setAttribute("listBillAll_Status", billSyntheticList);
            req.setAttribute("content", "./bill/bill.jsp");
        }
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String uri = req.getRequestURI();
        if (uri.contains("xacnhan")) {
            req.setAttribute("checkMode_desc",false);
            List<BillSyntheticDto> billSyntheticConfrimList = storedProcedureDao.findBillAll_Status(0,4);
            req.setAttribute("listBillAll_Status_confrim", billSyntheticConfrimList);
            req.setAttribute("content", "./bill/billconfrim.jsp");
        }else if(uri.contains("giaohang")){
            req.setAttribute("checkMode_desc",false);
            List<BillSyntheticDto> billSyntheticConfrimList = storedProcedureDao.findBillAll_Status(1,5);
            req.setAttribute("listBillAll_Status_tranposst", billSyntheticConfrimList);
            req.setAttribute("content", "./bill/billtransport.jsp");
        }else {
            req.setAttribute("checkMode_desc",false);
            List<BillSyntheticDto> billSyntheticList = storedProcedureDao.findBillAll_Status(2,2);
            req.setAttribute("listBillAll_Status", billSyntheticList);
            req.setAttribute("content", "./bill/bill.jsp");
        }
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req, resp);
    }
    public void listBill_DESC (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String idBill = req.getParameter("id");
        List<Bill_details> list = bill_detailsDao.findAllBill_Details(Integer.parseInt(idBill));
        req.setAttribute("listBill_desc",list);
        req.setAttribute("checkMode_desc",true);
    }
}
