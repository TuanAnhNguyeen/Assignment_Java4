<%--
  Created by IntelliJ IDEA.
  User: Duy
  Date: 8/2/2021
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- Header Area End Here -->
    <!-- Begin Li's Breadcrumb Area -->
    <div class="breadcrumb-area">
        <div class="container">
            <div class="breadcrumb-content">
                <ul>
                    <li><a href="<%=request.getContextPath()%>/homepage">Trang Chủ</a></li>
                    <li class="active">Thanh Toán</li>
                </ul>
            </div>
        </div>
    </div>
<c:if test="${sumMoney==0}">
    <div class="error404-area pt-30 pb-60">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="error-wrapper text-center ptb-50 pt-xs-20">
                        <div class="error-text">
                            <h2>Không có sản phẩm nào trong giỏ hàng</h2>
                        </div>
                        <div class="search-error">
                        </div>
                        <div class="error-button">
                            <a href="<%=request.getContextPath()%>/homepage">Quay về trang chủ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>
    <!-- Li's Breadcrumb Area End Here -->
    <!--Checkout Area Strat-->
<c:if test="${sumMoney>0}">
    <div class="checkout-area pt-60 pb-30">
        <div class="container">
            <form action="<%=request.getContextPath()%>/cart/checkout" method="post">
            <div class="row">
                <div class="col-lg-6 col-12">
                        <div class="checkbox-form">
                            <h3>Điền Thông Tin Khách Hàng</h3>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="checkout-form-list">
                                        <label>Họ Và Tên</label>
                                        <input name="name" value="${sessionScope.customer.fullname}" placeholder="" type="text" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list">
                                        <label>Địa Chỉ <span class="required">*</span></label>
                                        <input name="address" value="${sessionScope.customer.address}" type="text" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list">
                                        <label>Email Address <span class="required"></span></label>
                                        <input name="email" value="${sessionScope.customer.email}" placeholder="" type="email">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list">
                                        <label>Số Điện Thoại <span class="required">*</span></label>
                                        <input name="phonne" value="${sessionScope.customer.phoneNumber}" type="text" pattern="(\+84|0)\d{9,10}" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="col-lg-6 col-12">
                    <div class="your-order">
                        <h3>Đơn Hàng Của Bạn</h3>
                        <div class="your-order-table table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="cart-product-name">Sản Phẩm</th>
                                    <th class="cart-product-total">Giá Bán</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${listProduct_details_cart}">
                                <tr class="cart_item">
                                    <td class="cart-product-name"> ${item.products.name} <strong class="product-quantity"> x ${item.quantity}</strong></td>
                                    <td class="cart-product-total">
                                        <span class="text-danger">${item.products.convertPrice()}đ</span>
                                        <strike>${item.products.price}đ</strike>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="cart-subtotal">
                                    <th>Khuyến Mại</th>
                                    <td><span class="amount">0đ</span></td>
                                </tr>
                                <tr class="order-total">
                                    <th>Tổng Tiền Thanh Toán</th>
                                    <td><strong><input name="sumMoney" value="${sumMoney}đ" style="text-align: center;font-size: 14px" class="text-danger" readonly></strong></td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="payment-method">
                            <div class="payment-accordion">
                                <div id="accordion">
                                    <div class="product-variants">
                                        <div class="produt-variants-size">
                                            <label>Chọn hình thức thanh toán</label>
                                            <select class="nice-select" name="payments">
                                                <option value="1" title="S" selected="selected">Tiền Mặt</option>
                                                <option value="2" title="M">Thẻ Ngân Hàng</option>
                                            </select>
                                        </div>
                                    </div>
                                <div class="order-button-payment">
                                    <input value="Đặt Hàng" type="submit">
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
<jsp:include page="../common/modalmsgSuccess.jsp"></jsp:include>
</c:if>
