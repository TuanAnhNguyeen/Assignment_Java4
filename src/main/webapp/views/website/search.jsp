
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${checkListProduct==false}">
  <div class="error404-area pt-30 pb-60">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="error-wrapper text-center ptb-50 pt-xs-20">
            <div class="error-text">
              <h2>Không có sản phẩm Bạn Cần Tìm</h2>
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
<c:if test="${checkListProduct==true}">
<div class="product-area pt-60 pb-50">
  <div class="container">
    <div class="tab-content">
      <div id="li-new-product" class=" active show" >
        <div class="row">
            <c:forEach var="item" items="${listProductSearch}">
              <div class="col-lg-12">
                <!-- single-product-wrap start -->
                <div class="single-product-wrap" style="width: 236px">
                  <div class="product-image">
                    <a href="product.jsp">
                      <img style="width: 206px;height: 206px" src="<%=request.getContextPath()%>/files/${item.image}"
                           alt="Li's Product Image">
                    </a>
                    <span class="sticker">New</span>
                  </div>
                  <div class="product_desc">
                    <div class="product_desc_info">
                      <div class="product-review">
                        <h5 class="manufacturer">
                          <a href="shop-left-sidebar.html">${item.properties.name}</a>
                        </h5>
                        <div class="rating-box">
                          <ul class="rating">
                            <li><i class="fa fa-star-o"></i></li>
                            <li><i class="fa fa-star-o"></i></li>
                            <li><i class="fa fa-star-o"></i></li>
                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                          </ul>
                        </div>
                      </div>
                      <h4><a class="product_name" href="product.jsp">${item.name}</a></h4>
                      <div class="price-box">
                        <span class="new-price new-price-2">${item.discout >0 ? item.showPrice(): ""}</span>
                        <span class="${item.discout >0 ? "old-price" : "new-price"}">${item.showPriceDiscout()}</span>
                        <span class="discount-percentage">${item.convertDiscout()}</span>
                      </div>
                    </div>
                    <div class="add-actions">
                      <ul class="add-actions-link">
                        <li class="add-cart active"><a href="<%=request.getContextPath()%>/homepage/dienthoai?name=${item.name}">Add to cart</a></li>
                        <li><a class="links-details" href="wishlist.html"><i
                                class="fa fa-heart-o"></i></a></li>
                        <li><a href="<%=request.getContextPath()%>/homepage/dienthoai?name=${item.name}"><i class="fa fa-eye"></i></a></li>
                      </ul>
                        <%--                                            <a href="#" title="quick view" class="quick-view-btn"--%>
                        <%--                                               data-toggle="modal" data-target="#exampleModalCenter"><i--%>
                        <%--                                                    class="fa fa-eye"></i></a>--%>
                    </div>
                  </div>
                </div>
                <!-- single-product-wrap end -->
              </div>
            </c:forEach>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</c:if>