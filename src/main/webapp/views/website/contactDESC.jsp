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
                    <h3 class="contact-page-title">Câu hỏi hoặc đánh giá của bạn</h3>
                    <div class="contact-form">
                        <form  action="<%=request.getContextPath()%>/contact/add" method="post">
                            <div class="form-group">
                                <label>Họ Tên <span class="required">*</span></label>
                                <input type="text" name="customerName" id="customername" required>
                            </div>
                            <div class="form-group">
                                <label>Email hoặc Facebook <span class="required">*</span></label>
                                <input type="text" name="customerEmail" value="${email}" id="customerEmail" readonly>
                            </div>
                            <div class="form-group">
                                <label>Tiêu Đề</label>
                                <input type="text" name="contactSubject" id="contactSubject">
                            </div>
                            <div class="form-group mb-30">
                                <label>Nội Dung</label>
                                <textarea name="contactMessage" id="contactMessage"></textarea>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-danger" type="submit" >Gửi</button>
                            </div>
                        </form>
                    </div>
                    <jsp:include page="../common/modalmsgSuccess.jsp"></jsp:include>
                </div>
            </div>
        </div>
    </div>
</div>

