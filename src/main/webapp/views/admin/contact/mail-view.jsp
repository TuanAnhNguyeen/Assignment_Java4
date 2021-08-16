<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-page">
    <!-- Start content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcrumb-holder">
                        <h1 class="main-title float-left">Message Details</h1>
                        <ol class="breadcrumb float-right">
                            <li class="breadcrumb-item">Home</li>
                            <li class="breadcrumb-item"><a href="mail-all.html">Inbox</a></li>
                            <li class="breadcrumb-item active">Message Details</li>
                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <!-- end row -->
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">

                    <div class="card mb-3">

                        <div class="card-header">
                            <h3><i class="far fa-envelope"></i>Nội Dung Tin Nhắn Chi Tiết</h3>
                        </div>

                        <div class="card-body">
                            <form action="<%=request.getContextPath()%>/admin/contact/reply" method="post">
                                <div class="row">
                                    <div class="col-lg-9 col-xl-9">
                                        <h4>${contact.subject}</h4>
                                        <div class="lead">${contact.note}</div>
                                        <hr/>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label>Câu Trả Lời</label>
                                                    <textarea class="form-control" name="reply" rows="10"
                                                              required></textarea>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <button type="submit" class="btn btn-primary">Trả lời</button>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-lg-3 col-xl-3 border-left">
                                       Ma : <input value="${contact.id}" style="border: none" name="id" readonly>
                                        <br/>
                                        <b>người gửi</b>: ${contact.fullname}<br/>
                                        <b> email</b>: ${contact.email}
                                        <br/>
                                        <b>Thời gian gửi: </b>: ${contact.day}<br/>
                                    </div>
                                </div>
                            </form>
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
