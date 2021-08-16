<%--
  Created by IntelliJ IDEA.
  User: Duy
  Date: 8/1/2021
  Time: 5:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Begin Header Area -->
<!-- Header Area End Here -->
<!-- Begin Li's Breadcrumb Area -->
<div class="breadcrumb-area">
    <div class="container">
        <div class="breadcrumb-content">
            <ul>
                <li><a href="<%=request.getContextPath()%>/homepage">Home</a></li>
                <li class="active">Shopping Cart</li>
                <li><a href="<%=request.getContextPath()%>/history/xoataikhoan">Thoát Tài Khoản</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="Shopping-cart-area pt-60 pb-60">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="table-content table-responsive">
                    <h2>Chi tiết hóa đơn</h2>
                    <table class="table">
                        <thead>
                        <tr>
                            <th class="li-product-thumbnail">Ảnh</th>
                            <th class="cart-product-name">Tên Sản Phẩm</th>
                            <th class="li-product-price">Giá Bán</th>
                            <th class="li-product-quantity">Số Lượng</th>
                            <th class="li-product-subtotal">Giá Giảm</th>
                            <th class="li-product-subtotal">Thành Tiền</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${listBill_details_history}">
                            <tr>
                                <td class="li-product-thumbnail"><a href="#"><img
                                        src="<%=request.getContextPath()%>/files/${item.products_details.products.image}"
                                        style="width: 150px;height: 150px" alt="Li's Product Image"></a></td>
                                <td class="li-product-name"><h6>${item.products_details.products.name}</h6></td>
                                <td class="li-product-price"><span class="amount">${item.products_details.products.price}đ</span>
                                </td>

                                <td>
                                    <input id="quantitySP" name="quantity" type="number" value="${item.products_details.quantity}"
                                           min="1" style="width: 40px;height: 40px" readonly>
                                </td>
                                <td class="li-product-price"><span style="color: red"
                                                                   class="amount">${item.products_details.products.discout}%</span>
                                </td>
                                <td class="product-subtotal"><span
                                        class="amount">${item.products_details.products.convertPrice()*item.quantity}</span></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-12">
                    <div class="error-wrapper text-center ptb-50 pt-xs-20">
                        <div class="error-text">
                        </div>
                        <div class="search-error">
                        </div>
                        <div class="error-button">
                            <a href="<%=request.getContextPath()%>/history">Quay về lịch sử mua hàng</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


