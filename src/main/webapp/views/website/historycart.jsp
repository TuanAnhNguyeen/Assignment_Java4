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
<c:if test="${checkPhone==false}">
  <div class="error404-area pt-30 pb-60">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="error-wrapper text-center ptb-50 pt-xs-20">
            <div class="error-text">
              <h4 class="text-danger">${MsgHistory}</h4>
            </div>
              <br>
              <br>
            <div class="search-error">
              <form id="search-form" action="<%=request.getContextPath()%>/history" method="post">
                <input name="phoneHistory" type="text" placeholder="Nhập số điện thoại mua hàng"
                       type="text" pattern="(\+84|0)\d{9,10}" required>
                <button><i class="zmdi zmdi-search"></i></button>
              </form>
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
<c:if test="${checkPhone==true}">
  <div class="Shopping-cart-area pt-60 pb-60">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <form action="<%=request.getContextPath()%>/homepage/cart/edit" method="post">
            <div class="table-content table-responsive">
              <table class="table">
                <thead>
                <tr>
                  <th class="li-product-thumbnail">Mã Đơn Hàng</th>
                  <th class="cart-product-name">Số Lượng</th>
                  <th class="li-product-price">Ngày Đặt Mua</th>
                  <th class="li-product-quantity">Tổng tiền</th>
                  <th class="li-product-subtotal">Trạng Thái</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${listBillCheckout}">
                  <tr>
                    <td class="li-product-remove">HD100${item.id}</td>
                    <td class="li-product-name">${item.quantity}</td>
                    <td class="li-product-price"><span class="amount">${item.convertDateTime()}</span>
                    </td>
                    <td class="li-product-price"><span class="amount">${item.sumMoney}đ</span>
                    </td>
                    <td class="li-product-remove"><p class="text-black" style="font-size: 20px">${item.converStatus()}</p>
                      <a class="text-primary" href="<%=request.getContextPath()%>/history/donhang?id=${item.id}" ><span style="font-size: 14px">Xem chi tiết</span></a>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</c:if>



