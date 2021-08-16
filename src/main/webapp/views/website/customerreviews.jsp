<%--
  Created by IntelliJ IDEA.
  User: Duy
  Date: 7/31/2021
  Time: 9:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h4>Đánh Giá Khách Hàng</h4>
<div id="reviews" class="row" role="tabpanel">
    <div class="product-reviews">
        <div class="product-details-comment-block">
            <div class="comment-review">
                <span>Grade</span>
                <ul class="rating">
                    <li><i class="fa fa-star-o"></i></li>
                    <li><i class="fa fa-star-o"></i></li>
                    <li><i class="fa fa-star-o"></i></li>
                    <li class="no-star"><i class="fa fa-star-o"></i></li>
                    <li class="no-star"><i class="fa fa-star-o"></i></li>
                </ul>
            </div>
            <div class="comment-author-infos pt-25">
                <c:forEach var="item" items="${listViews}">
                    <h6>${item.name} :</h6>
                    <span>${item.note}</span>
                    <em>${item. convertDateTime()}</em>
                    <hr>
                </c:forEach>
            </div>
            <div class="review-btn">
                <a class="review-links" href="#" data-toggle="modal" data-target="#mymodal">Mời Bạn Đánh Giá </a>
            </div>
            <!-- Begin Quick View | Modal Area -->
            <div class="modal fade modal-wrapper" id="mymodal">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <h3 class="review-page-title">Đánh Giá Sản Phẩm : ${product.name}</h3>
                            <div class="modal-inner-area row">
                                <div class="col-lg-6">
                                    <div class="li-review-product">
                                        <img src="<%=request.getContextPath()%>/files/${product.image}" style="width: 300px;height: 300px" alt="Li's Product">
                                        <div class="li-review-product-desc">
                                            <p class="li-product-name">Mời Bạn Để Lại Ý Kiến</p>
                                            <p>
                                                <span>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant 360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With Exquisite Sound via Ring Radiator Technology. Stream And Control R3 Speakers Wirelessly With Your Smartphone. Sophisticated, Modern Design </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="li-review-content">
                                        <!-- Begin Feedback Area -->
                                        <div class="feedback-area">
                                            <div class="feedback">
                                                <form action="<%=request.getContextPath()%>/homepage" method="post">
                                                <h3 class="feedback-title">${product.name}</h3>
                                                    <p class="your-opinion">
                                                        <label>Your Rating</label>
                                                        <span>
                                                            <select class="star-rating">
                                                                <option value="1">1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                                <option value="4">4</option>
                                                                <option value="5">5</option>
                                                            </select>
                                                        </span>
                                                    </p>
                                                    <p class="feedback-form">
                                                        <label for="feedback">Your Review</label>
                                                        <textarea id="feedback" name="comment" cols="45"
                                                                  rows="8"
                                                                  aria-required="true"></textarea>
                                                    </p>
                                                    <div class="feedback-input">
                                                        <p class="feedback-form-author">
                                                            <label for="author">Nhập Tên<span
                                                                    class="required">*</span>
                                                            </label>
                                                            <input id="author" name="author" value=""
                                                                   size="30" aria-required="true"
                                                                   type="text">
                                                        </p>
                                                        <p class="feedback-form-author feedback-form-email">
                                                            <label for="phone">Số Điện Thoại<span
                                                                    class="required">*</span>
                                                            </label>
                                                            <input id="phone" name="phone" value=""
                                                                   size="30" aria-required="true"
                                                                   type="text">
                                                        </p>
                                                        <div class="feedback-btn pb-15">
                                                            <button  class="btn btn-primary mp-2" formaction="dienthoai/views?name=${product.name}">Gửi Đánh Giá</button>
                                                            <button  class="btn btn-secondary mp-2" data-dismiss="modal" aria-label="Close">đóng</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- Feedback Area End Here -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>