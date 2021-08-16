package com.dienthoaiviet.controler.webstite;

import com.dienthoaiviet.dao.IBillDao;
import com.dienthoaiviet.dao.IBill_DetailsDao;
import com.dienthoaiviet.dao.ICustomerDao;
import com.dienthoaiviet.dao.IProducts_detailsDao;
import com.dienthoaiviet.dao.impl.BillDao;
import com.dienthoaiviet.dao.impl.Bill_DetailsDao;
import com.dienthoaiviet.dao.impl.CustomerDao;
import com.dienthoaiviet.dao.impl.Products_detailsDao;
import com.dienthoaiviet.model.Bill;
import com.dienthoaiviet.model.Bill_details;
import com.dienthoaiviet.model.Customer;
import com.dienthoaiviet.model.Products_details;
import com.dienthoaiviet.model.dto.CustomerDto;
import com.dienthoaiviet.model.dto.Product_detailsDto;
import com.dienthoaiviet.model.dto.Product_detailsMapper;
import com.dienthoaiviet.service.ICategoryService;
import com.dienthoaiviet.service.IPropertiesService;
import com.dienthoaiviet.service.impl.CategoryService;
import com.dienthoaiviet.service.impl.PropertiesService;
import com.dienthoaiviet.utils.CookieUtils;
import com.dienthoaiviet.utils.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.Cookie;

@WebServlet({"/homepage/cart","/homepage/cart/add","/cart/edit","/cart/*","/cart/checkout"})
public class Cart extends HttpServlet {
    private static IProducts_detailsDao products_detailsDao = new Products_detailsDao();
    private static ICategoryService categoryService = new CategoryService();
    private static IPropertiesService propertiesService = new PropertiesService();
    private static ICustomerDao customerDao = new CustomerDao();
    private static IBillDao billDao = new  BillDao();
    private static IBill_DetailsDao bill_detailsDao = new Bill_DetailsDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        req.setAttribute("listCategory",categoryService.findAll());
        req.setAttribute("listProperties",propertiesService.findAll());
        getCart(req,resp);
        if(uri.contains("add")){
            String idProduct_details = req.getParameter("idProduct_details");
            String quantity = req.getParameter("quantity");
            Product_detailsDto products_details1 = products_detailsDao.findByIdProduct_details(idProduct_details);
            if(products_details1.getQuantity()<=0){
                req.setAttribute("checkErorr",true);
                req.setAttribute("messengeError","Xin lỗi quý khách sản phẩm đang hết hàng!!!!");
                req.setAttribute("link",req.getContextPath()+"/homepage/dienthoai?name="+products_details1.getProducts().getName());
                req.setAttribute("contentHomePage","product.jsp");
                req.getRequestDispatcher("/views/website/index.jsp").forward(req,resp);
                return;
            }else if(products_details1.getQuantity()<Integer.parseInt(quantity)){
                req.setAttribute("checkErorr",true);
                req.setAttribute("messengeError","Xin lỗi quý khách số lượng chúng tôi không đủ đơn hàng!!!!");
                req.setAttribute("link",req.getContextPath()+"/homepage/dienthoai?name="+products_details1.getProducts().getName());
                req.setAttribute("contentHomePage","product.jsp");
                req.getRequestDispatcher("/views/website/index.jsp").forward(req,resp);
                return;
            }else if(Integer.parseInt(quantity)==0){
                req.setAttribute("checkErorr",true);
                req.setAttribute("messengeError","Xin lỗi quý khách Phải Chọn số lượng > 0 !!!!");
                req.setAttribute("link",req.getContextPath()+"/homepage/dienthoai?name="+products_details1.getProducts().getName());
                req.setAttribute("contentHomePage","product.jsp");
                req.getRequestDispatcher("/views/website/index.jsp").forward(req,resp);
                return;
            }
            String nameCookie = "IdProduct"+idProduct_details;
            CookieUtils.add(nameCookie,quantity,30,resp);
            resp.sendRedirect(req.getContextPath()+"/homepage");
            return;
        } else if(uri.contains("edit")){
            String id = req.getParameter("idCart");
            String quantityCart = req.getParameter("quantityCart");
            List<Product_detailsDto> listProductCart = getCart(req,resp);
            for (Product_detailsDto x : listProductCart){
                if(x.getId().equals(id)){
                    if(quantityCart.equalsIgnoreCase("asc")){
                        x.setQuantity(x.getQuantity()+1);
                        Product_detailsDto products_details2 = products_detailsDao.findByIdProduct_details(id);
                        if(products_details2.getQuantity()<x.getQuantity()){
                            x.setQuantity(products_details2.getQuantity());
                        }
                    }else {
                        if(x.getQuantity()>1) {
                            x.setQuantity(x.getQuantity() - 1);
                        }else {
                            x.setQuantity(1);
                        }
                    }
                }
                String nameCookie = "IdProduct"+x.getId();
                CookieUtils.add(nameCookie,String.valueOf(x.getQuantity()),30,resp);
            }
            resp.sendRedirect(req.getContextPath()+"/homepage/cart");
            return;
        }else if(uri.contains("checkout")){
            String code = req.getParameter("vnp_ResponseCode");
            req.setAttribute("contentHomePage","checkout.jsp");
            if(code!=null && code.equals("00")){
                CustomerDto customerDto = (CustomerDto) SessionUtil.getUser(req,"customer");
                insertOrder(req,resp,4,customerDto);
                return;
            }
        }
        else {
            req.setAttribute("contentHomePage","cart.jsp");
        }
        req.getRequestDispatcher("/views/website/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String email = req.getParameter("email");
        String phonne = req.getParameter("phonne");
        String payments = req.getParameter("payments");
        String sumMoney = req.getParameter("sumMoney");
        CustomerDto customerDto = new CustomerDto();
        customerDto.setEmail(email);
        customerDto.setPhoneNumber(phonne);
        customerDto.setAddress(address);
        customerDto.setFullname(name);
        int checkPayments=0;
        if(Integer.parseInt(payments)==2){
            payments(req,resp,Integer.parseInt(sumMoney)*100);
            checkPayments=3;
            SessionUtil.putUser(req,"customer",customerDto);
            return;
        }
        insertOrder(req,resp,0,customerDto);
//        Customer customer = new Customer();
//        Customer customer1 = customerDao.findByPhone(phonne);
//        if(customer1==null){
//            customer.setEmail(email);
//            customer.setAddress(address);
//            customer.setFullname(name);
//            customer.setStatus(true);
//            customer.setPhoneNumber(phonne);
//            customerDao.insertCustomer(customer);
//        }else {
//            customer=customer1;
//        }
//        Bill bill =new Bill();
//        bill.setCustomer(customer);
//        bill.setStaff(null);
//        bill.setStatus(3);
//        billDao.insertBill(bill);
//        Bill bill1 = billDao.findAllBill(0).get(0);
//        List<Product_detailsDto> listCheckout = getCart(req,resp);
//        for(Product_detailsDto x : listCheckout){
//            Bill_details bill_details = new Bill_details();
//            bill_details.setBill(bill1);
//            bill_details.setQuantity(x.getQuantity());
//            bill_details.setProducts_details(Product_detailsMapper.toProduct_details(x));
//            bill_detailsDao.insertBill_Details(bill_details);
//            String nameCookie = "IdProduct"+x.getId();
//            CookieUtils.add(nameCookie,"0",0,resp);
//        }
//        req.setAttribute("check",true);
//        req.setAttribute("msgSuccess","Quý Khách Đặt Hàng Thành Công");
//        req.setAttribute("link",req.getContextPath()+"/homepage");
//        req.setAttribute("contentHomePage","checkout.jsp");
//        req.getRequestDispatcher("/views/website/index.jsp").forward(req,resp);
    }

    private List<Product_detailsDto> getCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
        return listProduct_details_cart;
    }
    public void insertOrder(HttpServletRequest req, HttpServletResponse resp, int payments, CustomerDto customerDto) throws ServletException, IOException{
        Customer customer = new Customer();
        Customer customer1 = customerDao.findByPhone(customerDto.getPhoneNumber());
        if(customer1==null){
            customer.setEmail(customerDto.getEmail());
            customer.setAddress(customerDto.getAddress());
            customer.setFullname(customerDto.getFullname());
            customer.setStatus(true);
            customer.setPhoneNumber(customerDto.getPhoneNumber());
            customerDao.insertCustomer(customer);
        }else {
            customer=customer1;
        }
        Bill bill =new Bill();
        bill.setCustomer(customer);
        bill.setStaff(null);
        bill.setStatus(payments);
        billDao.insertBill(bill);
        Bill bill1 = billDao.findAllBill(payments).get(0);
        List<Product_detailsDto> listCheckout = getCart(req,resp);
        for(Product_detailsDto x : listCheckout){
            Bill_details bill_details = new Bill_details();
            bill_details.setBill(bill1);
            bill_details.setQuantity(x.getQuantity());
            bill_details.setProducts_details(Product_detailsMapper.toProduct_details(x));
            bill_detailsDao.insertBill_Details(bill_details);
            String nameCookie = "IdProduct"+x.getId();
            CookieUtils.add(nameCookie,"0",0,resp);
        }
        SessionUtil.removeUser(req,"customer");
        req.setAttribute("check",true);
        req.setAttribute("msgSuccess","Quý Khách Đặt Hàng Thành Công");
        req.setAttribute("link",req.getContextPath()+"/homepage");
        req.setAttribute("contentHomePage","checkout.jsp");
        req.getRequestDispatcher("/views/website/index.jsp").forward(req,resp);
    }
    public void payments(HttpServletRequest req, HttpServletResponse resp,int SumMoney) throws ServletException, IOException{
        String vnp_Version = "2.0.0";
        String vnp_Command = "pay";
        String vnp_OrderInfo = "Thanh toan don hang test";
        String orderType = "billpayment";
        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_IpAddr = Config.getIpAddress(req);

        String vnp_TmnCode = Config.vnp_TmnCode;

        String vnp_TransactionNo = vnp_TxnRef;
        String vnp_hashSecret = Config.vnp_HashSecret;

        int amount = SumMoney * 100;
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        String bank_code = "";
        if (bank_code != null && bank_code.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bank_code);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = "vi";
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Date dt = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString = formatter.format(dt);
        String vnp_CreateDate = dateString;
        String vnp_TransDate = vnp_CreateDate;
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        //Build data to hash and querystring
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(fieldValue);
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.Sha256(Config.vnp_HashSecret + hashData.toString());
        //System.out.println("HashData=" + hashData.toString());
        queryUrl += "&vnp_SecureHashType=SHA256&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
//        com.google.gson.JsonObject job = new JsonObject();
//        job.addProperty("code", "00");
//        job.addProperty("message", "success");
//        job.addProperty("data", paymentUrl);
//        Gson gson = new Gson();
        req.setAttribute("code", "00");
        req.setAttribute("message", "success");
        req.setAttribute("data", paymentUrl);
//        resp.getWriter().write(gson.toJson(job));
        resp.sendRedirect(paymentUrl);
    }
}
