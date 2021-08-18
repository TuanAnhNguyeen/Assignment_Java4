<%@page contentType="text/html;UTF8" pageEncoding="utf-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="main">

    <div class="content-page">

        <!-- Start content -->
        <div class="content">
            <form action="<%=request.getContextPath()%>/admin/user/add" method="post" enctype="multipart/form-data">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="breadcrumb-holder">
                                <h1 class="main-title float-left">Thêm Nhân Viên</h1>
                                <ol class="breadcrumb float-right">
                                    <li class="breadcrumb-item">Trang Chủ</li>
                                    <li class="breadcrumb-item active">Nhân Viên</li>
                                </ol>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 col-xl-3">
                            <div class="card mb-3">
                                <div class="card-header">
                                    <h3><i class="far fa-file-image"></i> Ảnh Đại Diện</h3>
                                </div>

                                <div class="card-body text-center">

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <img alt="avatar" id="img" class="img-fluid"
                                                 src="<%=request.getContextPath()%>/views/admin/assets/images/avatars/avatar.png">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <%--                                            <button type="button" class="btn btn-info btn-block mt-3">Change avatar</button>--%>
                                            <div class="bg-info text-white mt-3" style="height: 40px">
                                                <label for="files" class="btn">Chọn Ảnh</label>
                                                <input id="files" name="img" style="visibility:hidden;" type="file"
                                                        accept=".jpg,.png">
                                            </div>
                                            <p class="text-danger">${errorImage}</p>
                                        </div>
                                    </div>

                                </div>
                                <!-- end card-body -->

                            </div>
                            <!-- end card -->

                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-9 col-xl-9">
                            <div class="card mb-3">
                                <div class="card-header">
                                    <h3><i class="far fa-user"></i> Profile details</h3>
                                </div>

                                <div class="card-body">
                                    <%--                                <c:url var="url" value="admin/user/add" />--%>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Họ Tên</label>
                                                <input class="form-control" name="fullname" type="text"/>
                                            </div>
                                            <p class="text-danger">${errorFullname}</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input class="form-control" name="email" type="text"/>
                                            </div>
                                            <p class="text-danger">${errorEmail}</p>
                                        </div>
                                        <%--                                        <p class="text-danger">${errorEmail}</p>--%>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Password</label>
                                                <input class="form-control" name="password" type="password" value=""/>
                                            </div>
                                            <p class="text-danger">${errorPassword}</p>
                                        </div>


                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Số Điện Thoại</label>
                                                <input class="form-control" name="phonenumber" type="text" value=""/>
                                            </div>
                                            <p class="text-danger">${errorPhonenumber}</p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Địa Chỉ</label>
                                                <input class="form-control" name="address" type="text" value=""/>
                                            </div>
                                            <p class="text-danger">${errorAddress}</p>
                                        </div>


                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Ngày Sinh</label>
                                                <input class="form-control" name="birthday" type="date" value=""/>
                                            </div>
                                            <p class="text-danger">${errorBirthday}</p>
                                        </div>

                                    </div>


                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Lương</label>
                                                <input class="form-control" name="salary" type="text" />
                                            </div>
                                            <p class="text-danger">${errorSalary}</p>
                                        </div>


                                        <div class="form-group col-md-6">
                                            <label>Chức Vụ</label>
                                            <select id="inputState" class="form-control" name="role">
                                                <option value=""> Chọn Chức Vụ</option>
                                                <c:forEach var="item" items="${listRole}">
                                                    <option value="${item.id}"> ${item.name}</option>
                                                </c:forEach>
                                            </select>
                                            <p class="text-danger">${errorRole}</p>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label>Giới Tính: </label>
                                                <label class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           value="true">
                                                    <span class="form-check-label"> Nam </span>
                                                </label>
                                                <label class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           value="false">
                                                    <span class="form-check-label"> Nữ</span>
                                                </label>
                                                <p class="text-danger">${errorGender}</p>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <hr>
                                            <button class="btn btn-primary" type="submit">Thêm Nhân Viên</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- end card-body -->

                            </div>
                            <!-- end card -->

                        </div>
                        <!-- end col -->


                        <!-- end col -->


                    </div>
                    <!-- end row -->


                </div>
                <!-- END container-fluid -->
            </form>
        </div>
        <!-- END content -->

    </div>
    <!-- END content-page -->

    <%--    <footer class="footer">--%>
    <%--            <span class="text-right">--%>
    <%--                Copyright <a target="_blank" href="#">Your Company</a>--%>
    <%--            </span>--%>
    <%--        <span class="float-right">--%>
    <%--                <!-- Copyright footer link MUST remain intact if you download free version. -->--%>
    <%--            <!-- You can delete the links only if you purchased the pro or extended version. -->--%>
    <%--            <!-- Purchase the pro or extended version with PHP version of this template: https://bootstrap24.com/template/nura-admin-4-free-bootstrap-admin-template -->--%>
    <%--                Powered by <a target="_blank" href="https://bootstrap24.com"--%>
    <%--                              title="Download free Bootstrap templates"><b>Bootstrap24.com</b></a>--%>
    <%--            </span>--%>
    <%--    </footer>--%>

    <%--    <script src="<%=request.getContextPath()%>/views/admin/assets/js/modernizr.min.js"></script>--%>
    <%--    <script src="<%=request.getContextPath()%>/views/admin/assets/js/jquery.min.js"></script>--%>
    <%--    <script src="<%=request.getContextPath()%>/views/admin/assets/js/moment.min.js"></script>--%>

    <%--    <script src="<%=request.getContextPath()%>/views/admin/assets/js/popper.min.js"></script>--%>
    <%--    <script src="<%=request.getContextPath()%>/views/admin/assets/js/bootstrap.min.js"></script>--%>

    <%--    <script src="<%=request.getContextPath()%>/views/admin/assets/js/detect.js"></script>--%>
    <%--    <script src="<%=request.getContextPath()%>/views/admin/assets/js/fastclick.js"></script>--%>
    <%--    <script src="<%=request.getContextPath()%>/views/admin/assets/js/jquery.blockUI.js"></script>--%>
    <%--    <script src="<%=request.getContextPath()%>/views/admin/assets/js/jquery.nicescroll.js"></script>--%>

    <%--    <!-- App js -->--%>
    <%--    <script src="<%=request.getContextPath()%>/views/admin/assets/js/admin.js"></script>--%>
    <script>
        const files = document.querySelector("#files");
        const reader = new FileReader();
        files.addEventListener("change", (evt) => {
            const files = evt.target.files;
            console.log(files)
            reader.readAsDataURL(files[0])
            reader.addEventListener("load", (evt) => {
                const url = evt.target.result
                console.log(url)
                document.getElementById("img").src = url;
            })
        })
    </script>

    <%--</div>--%>
    <%--<!-- END main -->--%>

    <%--</body>--%>

<%--</html>--%>