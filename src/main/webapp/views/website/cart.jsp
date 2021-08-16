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
<!--Shopping Cart Area Strat-->
<c:if test="${sumMoney >0}">
<div class="Shopping-cart-area pt-60 pb-60">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <form action="<%=request.getContextPath()%>/homepage/cart/edit" method="post">
                    <div class="table-content table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="li-product-remove">remove</th>
                                <th class="li-product-thumbnail">Ảnh</th>
                                <th class="cart-product-name">Tên Sản Phẩm</th>
                                <th class="li-product-price">Giá Bán</th>
                                <th class="li-product-quantity">Số Lượng</th>
                                <th class="li-product-subtotal">Giá Giảm</th>
                                <th class="li-product-subtotal">Thành Tiền</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${listProduct_details_cart}">
                                <tr>
                                    <td class="li-product-remove"><a href="#"><i class="fa fa-times"></i></a></td>
                                    <td class="li-product-thumbnail"><a href="#"><img
                                            src="<%=request.getContextPath()%>/files/${item.products.image}"
                                            style="width: 150px;height: 150px" alt="Li's Product Image"></a></td>
                                    <td class="li-product-name"><h6>${item.products.name}</h6></td>
                                    <td class="li-product-price"><span class="amount">${item.products.price}đ</span>
                                    </td>

                                    <td>
                                        <a style="width: 150px;height: 150px" href="<%=request.getContextPath()%>/cart/edit?idCart=${item.id}&quantityCart=desc">-</a>
                                        <input id="quantitySP" name="quantity" type="number" value="${item.quantity}"
                                               min="1"  style="width: 60px;height: 60px" readonly>
                                        <a style="width: 150px;height: 150px"  href="<%=request.getContextPath()%>/cart/edit?idCart=${item.id}&quantityCart=asc">+</a>
                                    </td>
                                    <td class="li-product-price"><span style="color: red"
                                                                       class="amount">${item.products.discout}%</span>
                                    </td>
                                    <td class="product-subtotal"><span
                                            class="amount">${item.products.convertPrice()*item.quantity}đ</span></td>
                                </tr>
                                <div style="display: none"><input name="id" type="text" value="${item.id}"></div>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-5 ml-auto">
                            <div class="cart-page-total">
                                <h2>Thanh Tiền Tổng :</h2>
                                <ul>
                                    <li>Tạm Tính <span class="text-danger">${sumMoney}đ</span></li>
                                    <li>Tổng Tiền<span class="text-danger">${sumMoney}đ</span></li>
                                </ul>
                                <a href="<%=request.getContextPath()%>/cart/checkout">Đặt Hàng</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</c:if>



