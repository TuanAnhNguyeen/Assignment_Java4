<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="breadcrumb-area">
    <div class="container">
        <div class="breadcrumb-content">
            <ul>
                <li><a href="<%=request.getContextPath()%>/homepage">Trang Chủ</a></li>
                <li class="active">Contact</li>
            </ul>
        </div>
    </div>
</div>
<div class="contact-main-page mt-60 mb-40 mb-md-40 mb-sm-40 mb-xs-40">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 offset-lg-1 col-md-12 order-1 order-lg-2">
                <div class="contact-page-side-content">
                    <h3 class="contact-page-title">Hãy liên hệ với chúng tôi</h3>
                    <p class="contact-page-message mb-25">Nếu có mọi thắc mắc về sản phẩm hoặc thái độ phục vụ của nhân viên
                    quý khách có thể liên hệ với chúng tôi với các hình thức dưới đây.</p>
                    <div class="single-contact-block">
                        <h4><i class="fa fa-fax"></i> Địa Chỉ</h4>
                        <p>Số 12 Phan Văn Trường , Cầu Giấy, Hà Nội</p>
                    </div>
                    <div class="single-contact-block">
                        <h4><i class="fa fa-phone"></i> Điện Thoại</h4>
                        <p>Số điện thoại: 09 123 456 78</p>
                        <p>Hotline: 1009 678 456</p>
                    </div>
                    <div class="single-contact-block last-child">
                        <h4><i class="fa fa-envelope-o"></i> Email</h4>
                        <p>duyph12712@fpt.edu.vn</p>
                        <p>duy23071995@gmail.com</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-12 order-2 order-lg-1">
                <div class="contact-form-content pt-sm-55 pt-xs-55">
                    <div class="row">
                        <div class="col-8">
                            <h4 class="contact-page-title">Câu hỏi Thường Gặp</h4>
                        </div>
                        <div class="col-4">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" style="font-size: 18px" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Đặt câu hỏi ?
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                   <button style="border: none" onclick="setCheck()"> <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div></button>
                                </div>
                            </li>
                        </div>
                    </div>
                    <div class="contact-form">
                        <ul class="listask">
                        <li data-idx="1" data-id="765869">
                            <a href="/hoi-dap/cau-hoi-765869">
                                <img class="lazy" style="width: 200px;height: 150px" src="<%=request.getContextPath()%>/files/samsung-galaxy-a22-4g-den-1-org.jpg">
                                <h4>
                                    5 c&#225;ch khắc phục lỗi kh&#244;ng tải được ứng dụng bằng 3G, 4G tr&#234;n CH Play
                                </h4>

                                <div>
                                    <label>Android-11 ph&#250;t trước</label>
                                </div>
                            </a>
                        </li>
                            <li data-idx="1" data-id="765869">
                                <a href="/hoi-dap/cau-hoi-765869">
                                    <img class="lazy" style="width: 200px;height: 150px" src="<%=request.getContextPath()%>/files/iphone-12-den-1-1-org.jpg">
                                    <h4>
                                        5 c&#225;ch khắc phục lỗi kh&#244;ng tải được ứng dụng bằng 3G, 4G tr&#234;n IOS
                                    </h4>

                                    <div>
                                        <label>IOS-11 ph&#250;t trước</label>
                                    </div>
                                </a>
                            </li>
                            <li data-idx="1" data-id="765869">
                                <a href="/hoi-dap/cau-hoi-765869">
                                    <img class="lazy" style="width: 200px;height: 150px" src="<%=request.getContextPath()%>/files/iphone-12-den-1-1-org.jpg">
                                    <h4>
                                        Cách chụp màn hinh Iphone đầy đủ mọi dòng máy cực dễ
                                    </h4>

                                    <div>
                                        <label>IOS-11 ph&#250;t trước</label>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <p class="form-messege"></p>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var check = 0;
    function setCheck(){
        check =1;
    }
    function onSignIn(googleUser) {
        if(check == 1) {
            var profile = googleUser.getBasicProfile();
            console.log(1);
            console.log("ID: " + profile.getId()); // Don't send this directly to your server!
            console.log('Full Name: ' + profile.getName());
            console.log('Given Name: ' + profile.getGivenName());
            console.log('Family Name: ' + profile.getFamilyName());
            console.log("Image URL: " + profile.getImageUrl());
            console.log("Email: " + profile.getEmail());

            // The ID token you need to pass to your backend:
            var id_token = googleUser.getAuthResponse().id_token;
            console.log("ID Token: " + id_token);
            window.location="<%=request.getContextPath()%>/contact/question?email="+profile.getEmail();
        }
    }
</script>
