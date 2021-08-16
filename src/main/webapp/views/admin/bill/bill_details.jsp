
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade bd-example-modal-lg show" style="display: ${checkMode_desc ? "block" : "none"}" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Large title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="dataTable1" class="table table-striped table-bordered zero-configuration" >
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Tên Sản Phẩm</th>
                                <th>Số Lượng</th>
                                <th>Màu Sắc</th>
                                <th>Giá Bán</th>
                                <th>Giá Nhập</th>
                                <th>Giảm Giá</th>
                                <th>Thành Tiền</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${listBill_desc}" varStatus="index">
                                <tr>
                                    <td>${index.index+1}</td>
                                    <td>${item.products_details.products.name}</td>
                                    <td>${item.quantity}</td>
                                    <td>${item.products_details.color}</td>
                                    <td>${item.products_details.products.price}</td>
                                    <td>${item.products_details.products.importprice}</td>
                                    <td>${item.products_details.products.discout}</td>
                                    <td>${item.products_details.products.convertPrice()*item.quantity}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <form action="${linkBill}" method="post">
            <div class="modal-footer">
                <button type="submit" class="btn btn-secondary" data-dismiss="modal">đóng</button>
            </div>
            </form>
        </div>
    </div>
</div>
