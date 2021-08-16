<%--
  Created by IntelliJ IDEA.
  User: Duy
  Date: 7/26/2021
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="content-page">

    <!-- Start content -->
    <div class="content">

        <div class="container-fluid">

            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">Tables</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <!-- end row -->


            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                    <div class="card mb-3">
                        <div class="card-header">
                            <h3><i class="fas fa-table"></i> Bảng Quản Lí Hãng Điện Thoại</h3>
                        </div>

                        <div class="card-body">

                            <table class="table table-responsive-xl">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Mã Hãng Điện Thoại</th>
                                    <th scope="col">Tên Hãng</th>
                                    <th>Hoạt Động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${listCategory}" varStatus="index">
                                    <tr>
                                        <th scope="row">${index.index +1}</th>
                                        <td>${item.id}</td>
                                        <td>${item.name}</td>
                                        <td>
                                            <a href="<%=request.getContextPath()%>/admin/category/deleteCategory?id=${item.id}"
                                               class="btn btn-danger">Khóa</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <form action="category/addCategory" method="post">
                                <div class="form-group">
                                    <label for="passWord2">Nhập Tên Hãng<span class="text-danger">*</span></label>
                                    <input type="text" name="nameCategory" placeholder="Nhập Tên Hãng"
                                           class="form-control" id="passWord2" required>
                                </div>
                                <div class="form-group text-right m-b-0">
                                    <button class="btn btn-primary" type="submit">
                                        Xác Nhận
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- end card-->
                </div>

                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                    <div class="card mb-3">
                        <div class="card-header">
                            <h3><i class="fas fa-table"></i>Bảng Quản Lí Loại Thẻ Nhớ</h3>
                        </div>

                        <div class="card-body">

                            <table class="table table-responsive-xl table-striped">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Mã Thẻ Nhớ</th>
                                    <th scope="col">Tên Thẻ Nhớ</th>
                                    <th>Hoạt Động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${listProperties}" varStatus="index">
                                    <tr>
                                        <th scope="row">${index.index +1}</th>
                                        <td>${item.id}</td>
                                        <td>${item.name}</td>
                                        <td>
                                            <a href="<%=request.getContextPath()%>/admin/category/deleteProperties?id=${item.id}"
                                               class="btn btn-danger">Khóa</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <form action="category/addProperties" method="post">
                                <div class="form-group">
                                    <label for="userName">Nhập Loại Thẻ Nhớ<span class="text-danger">*</span></label>
                                    <input type="text" name="nameProperties" placeholder="Nhập Loại Thẻ Nhớ"
                                           class="form-control" id="userName" required>
                                </div>
                                <div class="form-group text-right m-b-0">
                                    <button class="btn btn-primary" type="submit">
                                        Xác Nhận
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- end card-->
                </div>
            </div>
            <!-- end row-->

        </div>
        <!-- END container-fluid -->

    </div>
    <!-- END content -->

</div>
</body>
</html>
