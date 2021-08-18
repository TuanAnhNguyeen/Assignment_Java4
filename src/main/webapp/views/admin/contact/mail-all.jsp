<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="content-page">

            <!-- Start content -->
            <div class="content">

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="breadcrumb-holder">
                                <h1 class="main-title float-left">Hộp Thư Đến</h1>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                            <div class="card mb-3">
                                <div class="card-header">
                                    <h3><i class="far fa-envelope"></i> ${sumEmail} Tin Nhắn (${sumReply} Chưa Trả Lời)</h3>
                                </div>
                                <!-- end card-header -->
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="dataTable1" class="table table-striped table-bordered zero-configuration" >
                                            <thead>
                                                <tr>
                                                    <th style="min-width:320px">Nội Dung Tin Nhắn</th>
                                                    <th style="min-width:180px">Người Nhắn</th>
                                                    <th style="min-width:100px">Hoạt Động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${listContact}">
                                                <tr>
                                                    <td>
                                                        <c:if test="${item.status == true}">
                                                        <h5><span class="text-danger"><b>[Chưa Trả Lời]</b></span> <a href="#"><b>${item.subject}</b></a></h5>
                                                        </c:if>
                                                        <c:if test="${item.status == false}">
                                                        <h5><a href="# ">${item.subject}</a></h5>
                                                        </c:if>
                                                        <p>${item. convertDateTime()}</p>
                                                        <p>${item.note}</p>
                                                    </td>

                                                    <td>
                                                        <div class="mail_list">
                                                        <img alt="image " class="img-fluid d-none d-lg-block " src="<%=request.getContextPath()%>/views/admin/assets/images/avatars/avatar_small.png " />
                                                        </div> 
                                                        <p>${item.fullname}</p>
                                                        <p>Email : ${item.email}</p>
                                                    </td>

                                                    <td>
                                                        <a href="<%=request.getContextPath()%>/admin/contact/reply?id=${item.id}" class="btn btn-primary btn-sm btn-block"><i class="fas fa-search"></i> Trả Lời</a>
                                                        <a href="<%=request.getContextPath()%>/admin/contact/delete?id=${item.id}" class="btn btn-danger btn-sm btn-block mt-2"><i class="fas fa-trash"></i> Xóa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                                <!-- end card-body -->
                            </div>
                            <!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->
                </div>
                <!-- END container-fluid -->
            </div>
            <!-- END content -->
        </div>
<script>
    $(document).ready(function() {
        $('#dataTable1').DataTable();
    });

</script>

