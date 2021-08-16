package com.dienthoaiviet.controler.admin;

import com.dienthoaiviet.exception.ExceptionCommon;
import com.dienthoaiviet.model.Role;
import com.dienthoaiviet.model.dto.CustomerDto;
import com.dienthoaiviet.model.dto.StaffDto;
import com.dienthoaiviet.service.ICustomerService;
import com.dienthoaiviet.service.impl.CustomerService;
import com.dienthoaiviet.utils.Conmom;
import com.dienthoaiviet.webConstant.MethodconstantDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@MultipartConfig
@WebServlet({"/admin/customer", "/admin/customer/add", "/admin/customer/edit", "/admin/customer/delete"})
public class Customer extends HttpServlet {
    private static ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("sumReply", Conmom.CoutMail());
        String uri = req.getRequestURI();
        if (uri.contains("add")) {
            req.setAttribute("content", "./Customer/addCustomer.jsp");
        } else if (uri.contains("edit")) {
            req.setAttribute("content", "./Customer/addCustomer.jsp");
        } else if (uri.contains("delete")) {
            req.setAttribute("content", "./Customer/addCustomer.jsp");
        } else {
            req.setAttribute("listCustomer", customerService.findAll());
            req.setAttribute("content", "./Customer/tableCustomer.jsp");
        }
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String uri = req.getRequestURI();
        if (uri.contains("add")) {
            if(insertCustomer(req,resp)) {
                resp.sendRedirect(req.getContextPath() + "/admin/customer");
                return;
            }
        }
        req.getRequestDispatcher("/views/admin/index.jsp").forward(req, resp);
    }
    protected boolean insertCustomer(HttpServletRequest req,HttpServletResponse resp) throws  ServletException,IOException{
        CustomerDto customerDto = vadidate(req,MethodconstantDao.INSERT);
        if(customerDto==null){
            req.setAttribute("content", "./Customer/addCustomer.jsp");
            return false;
        }
        customerService.insertCustomer(customerDto);
        return true;
    }
    public CustomerDto vadidate(HttpServletRequest req, String method) {
        CustomerDto customer = new CustomerDto();
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String phonenumber = req.getParameter("phonenumber");
        String address = req.getParameter("address");
        boolean check = true;
        if (fullname.trim().equals("")) {
            req.setAttribute("errorFullname", "Bạn Phải Nhập Họ Và Tên");
            check = false;
        }
        if (address.trim().equals("")) {
            req.setAttribute("errorAddress", "Bạn Phải Nhập Địa Chỉ");
            check = false;
        }
        String checkPhone = ExceptionCommon.checkPhoneNumBer(method, phonenumber);
        if (!checkPhone.equals("")) {
            req.setAttribute("errorPhonenumber", checkPhone);
            check = false;
        }
        String regexPhone = "(84|0)+([0-9]{9})\\b";
        if (phonenumber.trim().equals("")) {
            req.setAttribute("errorPhonenumber", "Số Điện Thoại Trống!!!!");
            check = false;
        } else if (!phonenumber.matches(regexPhone)) {
            req.setAttribute("errorPhonenumber", "Số Điện Thoại Không Đúng!!!!");
            check = false;
        } else {
            if (method.equals(MethodconstantDao.INSERT)) {
                if (customerService.findByPhone(phonenumber) != null) {
                    req.setAttribute("errorPhonenumber", "Số Điện Thoại Đã Tồn Tại");
                    check = false;
                }
            }
        }
        if (check == false) {
            return null;
        }
        customer.setStatus(true);
        customer.setFullname(fullname);
        customer.setAddress(address);
        customer.setPhoneNumber(phonenumber);
        customer.setEmail(email);
        return customer;
    }
}
