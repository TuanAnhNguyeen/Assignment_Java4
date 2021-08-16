package com.dienthoaiviet.controler.webstite;

import com.dienthoaiviet.dao.IBillDao;
import com.dienthoaiviet.dao.IBill_DetailsDao;
import com.dienthoaiviet.dao.ICustomerDao;
import com.dienthoaiviet.dao.IStoredProcedureDao;
import com.dienthoaiviet.dao.impl.BillDao;
import com.dienthoaiviet.dao.impl.Bill_DetailsDao;
import com.dienthoaiviet.dao.impl.CustomerDao;
import com.dienthoaiviet.dao.impl.StoredProcedureDao;
import com.dienthoaiviet.model.Bill;
import com.dienthoaiviet.model.BillSynthetic;
import com.dienthoaiviet.model.Bill_details;
import com.dienthoaiviet.model.Customer;
import com.dienthoaiviet.model.dto.BillSyntheticDto;
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

@WebServlet({"/history/*","/history/donhang","/history/xoataikhoan"})
public class HistoryCheckoutServlet extends HttpServlet {
    private static ICustomerDao customerDao = new CustomerDao();
    private static IBill_DetailsDao bill_detailsDao = new Bill_DetailsDao();
    private static IBillDao billDao = new BillDao();
    private static IStoredProcedureDao storedProcedureDao = new StoredProcedureDao();
    private static ICategoryService categoryService = new CategoryService();
    private static IPropertiesService propertiesService = new PropertiesService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = CookieUtils.get("phonenumberhistory",req);
        String uri = req.getRequestURI();
        req.setAttribute("listCategory",categoryService.findAll());
        req.setAttribute("listProperties",propertiesService.findAll());
        if(uri.contains("donhang")){
            String idBill = req.getParameter("id");
            List<Bill_details> list = bill_detailsDao.findAllBill_Details(Integer.parseInt(idBill));
            req.setAttribute("listBill_details_history",list);
            req.setAttribute("contentHomePage", "history_details.jsp");
            req.getRequestDispatcher("/views/website/index.jsp").forward(req, resp);
            return;
        }
        if(uri.contains("xoataikhoan")){
            CookieUtils.add("phonenumberhistory",phone,0,resp);
            resp.sendRedirect(req.getContextPath()+"/homepage");
            return;
        }
        if(phone.equals("")) {
            req.setAttribute("checkPhone", false);
            req.setAttribute("MsgHistory", "Tra Cứu Thông Tin");
            req.setAttribute("contentHomePage", "historycart.jsp");
            req.getRequestDispatcher("/views/website/index.jsp").forward(req, resp);
        }else {
            req.setAttribute("checkPhone", true);
            List<BillSyntheticDto> listBillCheckout = storedProcedureDao.findBillCustomer(phone);
            if(listBillCheckout != null) {
                for (BillSyntheticDto x : listBillCheckout) {
                    Bill bill = billDao.findByIdBillUpdate(x.getId());
                    x.setStatus(bill.getStatus());
                }
            }
            req.setAttribute("listBillCheckout",listBillCheckout);
            req.setAttribute("contentHomePage", "historycart.jsp");
            req.getRequestDispatcher("/views/website/index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String phone = req.getParameter("phoneHistory");
        Customer customer = customerDao.findByPhone(phone);
        if (customer == null) {
            req.setAttribute("checkPhone", false);
            req.setAttribute("MsgHistory", "Số Điện thoại nhập không đúng mời nhập lại!!!!!");
        } else {
            req.setAttribute("checkPhone", true);
            List<BillSyntheticDto> listBillCheckout = storedProcedureDao.findBillCustomer(phone);
            req.setAttribute("listBillCheckout",listBillCheckout);
            req.setAttribute("contentHomePage", "historycart.jsp");
            CookieUtils.add("phonenumberhistory",phone,1,resp);
            req.getRequestDispatcher("/views/website/index.jsp").forward(req, resp);
        }

    }
}
