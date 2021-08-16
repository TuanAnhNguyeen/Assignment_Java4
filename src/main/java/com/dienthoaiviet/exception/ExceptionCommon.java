package com.dienthoaiviet.exception;

import com.dienthoaiviet.model.dto.StaffDto;
import com.dienthoaiviet.service.IUserService;
import com.dienthoaiviet.service.impl.UserService;
import com.dienthoaiviet.webConstant.MethodconstantDao;

public class ExceptionCommon {
    static IUserService userService = new UserService();
    public static String checkEmail(String method, String email) {
        String errorEmai = "";
        String regexEmail = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
        if (email.trim().equals("")) {
            errorEmai = "Email Trống!!!!";
        } else if (!email.matches(regexEmail)) {
            errorEmai = "Email Không Đúng!!!!";
        }else{
            if(method.equals(MethodconstantDao.INSERT)){
                if(userService.findByEmail(email) == null){
                   return "";
                }else {
                    errorEmai = "Email Đã Tồn Tại";
                }
            }
        }
        return errorEmai;
    }
    public static String checkMoney(String money) {
      String errorMoney ="";
        if (money.trim().equals("")) {
            errorMoney = "Số Tiền Không được  Trống!!!!";
        } else {
            try {
              int moneyCheck =  Integer.parseInt(money);
              if(moneyCheck<1000){
                  errorMoney = "Mời Nhập số tiền lớn hơn 1000 Đồng";
              }
            } catch (Exception e) {
                errorMoney = "Mời Nhập Lại Tiền Tệ";
            }
        }
       return errorMoney;
    }
    public static String checkNumber(String number){
        String Errornumber ="";
        if (number.trim().equals("")) {
            Errornumber = "Số Không Được Trống!!!!";
        } else {
            try {
                double moneyCheck =  Double.parseDouble(number);
                if(moneyCheck<0){
                    Errornumber = "Mời Nhập số Số Lớn Hơn 0";
                }else if(moneyCheck>99){
                    Errornumber = "Mời Nhập số Số Lớn Hơn <100";
                }
            } catch (Exception e) {
                Errornumber = "Mời Nhập số";
            }
        }
        return Errornumber;
    }
    public static String checkPhoneNumBer(String method, String phone) {
        String errorPhone= "";
        String regexPhone = "(84|0)+([0-9]{9})\\b";
        if (phone.trim().equals("")) {
            errorPhone = "Số Điện Thoại Trống!!!!";
        } else if (!phone.matches(regexPhone)) {
            errorPhone = "Số Điện Thoại Không Đúng!!!!";
        }else{
            if(method.equals(MethodconstantDao.INSERT)){
                if(userService.findByPhone(phone) != null){
                    errorPhone = "Số Điện Thoại Đã Tồn Tại";
                }
            }
        }
        return errorPhone;
    }
}
