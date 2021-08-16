<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="breadcrumb-area">
        <div class="container">
            <div class="breadcrumb-content">
                <ul>
                    <li><a href="index.html">Trang Chủ</a></li>
                    <li class="active">Chi Tiết Sản Phẩm</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Li's Breadcrumb Area End Here -->
    <!-- content-wraper start -->
    <div class="content-wraper">
        <div class="container">
            <div class="row single-product-area">
                <div class="col-lg-6 col-md-6">
                    <!-- Product Details Left -->
                    <div class="product-details-left">
                        <div class="product-details-images slider-navigation-1">
                            <c:forEach var="item" items="${listImageProduct}">
                                <div class="lg-image">
                                    <a class="popup-img venobox vbox-item" href="images/product/large-size/1.jpg"
                                       data-gall="myGallery">
                                        <img src="<%=request.getContextPath()%>/files/${item.name}"
                                             style="width: 550px;height: 400px" alt="product image">
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="product-details-thumbs slider-thumbs-1">
                            <c:forEach var="item" items="${listImageProduct}">
                                <div class="sm-image"><img src="<%=request.getContextPath()%>/files/${item.name}"
                                                           alt="product image thumb">
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6">
                    <div class="product-details-view-content pt-60">
                        <div class="product-info">
                            <h2>${product.name}</h2>
                            <span class="product-details-ref">Dung Lượng: ${product.properties.name}</span>
                            <div class="rating-box pt-20">
                                <ul class="rating rating-with-review-item">
                                    <li><i class="fa fa-star-o"></i></li>
                                    <li><i class="fa fa-star-o"></i></li>
                                    <li><i class="fa fa-star-o"></i></li>
                                    <li class="no-star"><i class="fa fa-star-o"></i></li>
                                    <li class="no-star"><i class="fa fa-star-o"></i></li>
                                    <li class="review-item"><a href="#">Đọc Review</a></li>
                                    <li class="review-item"><a href="#">Viết Review</a></li>
                                </ul>
                            </div>
                            <div class="price-box pt-20">
                                <span class="new-price new-price-2">${product.convertPrice()}đ</span>
                            </div>
                            <div class="product-desc">
                                <p>
                                            <span>Chúng tôi đảm bảo hàng chính hãng 100%... nếu bạn phát hiện chúng tôi bán hàng thiếu chất lượng chung
                                                tôi xin đền lại gấp 10 lần hóa đơn thanh toán của ban
                                            </span>
                                </p>
                            </div>
                            <form action="<%=request.getContextPath()%>/homepage/cart/add" class="cart-quantity">
                            <div class="product-variants">
                                <div class="produt-variants-size">
                                    <label>Chọn Màu Sắc</label>
                                    <select class="select" name="idProduct_details">
                                        <c:forEach var="item" items="${listProduct_details}">
                                            <option value="${item.id}">${item.color}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="single-add-to-cart">
                                    <div class="quantity">
                                        <label>Số Lượng</label>
                                        <div class="cart-plus-minus">
                                            <input class="cart-plus-minus-box" name="quantity" value="1" type="text">
                                            <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                                            <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                        </div>
                                    </div>
                                    <button class="add-to-cart" type="submit">Thêm Vào Giỏ Hàng</button>
                            </div>
                            </form>
                            <div class="product-additional-info pt-25">
                                <a class="wishlist-btn" href="wishlist.html"><i class="fa fa-heart-o"></i>Liên hệ với chúng tôi</a>
                                <div class="product-social-sharing pt-25">
                                    <ul>
                                        <li class="facebook"><a href="#"><i class="fa fa-facebook"></i>Facebook</a></li>
                                        <li class="twitter"><a href="#"><i class="fa fa-twitter"></i>Twitter</a></li>
                                        <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i>Google
                                            +</a></li>
                                        <li class="instagram"><a href="#"><i class="fa fa-instagram"></i>Instagram</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="product-area pt-35">
        <div class="container">
            <div class="tab-content">
                <h2>Chi Tiết Sản Phẩm</h2>
                <div id="product-details" class="row" role="tabpanel">
                    <div class="col-lg-6 col-md-6">
                        <a href="#">
                            <img src="<%=request.getContextPath()%>/files/${product.image}"
                                 alt="Product Manufacturer Image">
                        </a>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <p>${product.details}</p>
                    </div>
                </div>
                <jsp:include page="customerreviews.jsp"></jsp:include>
                <!-- Quick View | Modal Area End Here -->
            </div>

        </div>
    </div>
</div>
<!-- Product Area End Here -->
<!-- Begin Li's Laptop Product Area -->
<section class="product-area li-laptop-product pt-30 pb-50">
    <div class="container">
        <div class="row">
            <!-- Begin Li's Section Area -->
            <div class="col-lg-12">
                <div class="li-section-title">
                    <h2>
                        <span>Xem Thêm Điện Thoại Khác </span>
                    </h2>
                </div>
                <div class="row">
                    <div class="product-active owl-carousel">
                        <c:forEach var="item" items="${listSimilarProduct}">
                            <div class="col-lg-12">
                                <!-- single-product-wrap start -->
                                <div class="single-product-wrap">
                                    <div class="product-image">
                                        <a href="product.jsp">
                                            <img src="<%=request.getContextPath()%>/files/${item.image}"
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
                                                <span class="new-price new-price-2">${item.showPrice()}</span>
                                                <span class="old-price">${item.showPriceDiscout()}</span>
                                                <span class="discount-percentage">${item.discout}%</span>
                                            </div>
                                        </div>
                                        <div class="add-actions">
                                            <ul class="add-actions-link">
                                                <li class="add-cart active"><a href="#">Add to cart</a></li>
                                                <li><a class="links-details" href="wishlist.html"><i
                                                        class="fa fa-heart-o"></i></a></li>
                                                <li>
                                                    <a href="<%=request.getContextPath()%>/homepage/dienthoai?name=${item.name}"><i
                                                            class="fa fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-wrap end -->
                            </div>
                        </c:forEach>
                        <!-- single-product-wrap end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Li's Section Area End Here -->
    </div>
</section>
<jsp:include page="../common/modalError.jsp"></jsp:include>