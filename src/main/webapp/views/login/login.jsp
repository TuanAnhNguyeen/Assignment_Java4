
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Login</title>

    <!-- Custom fonts for this template-->
    <link href="<%=request.getContextPath()%>/views/login/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath()%>/views/login/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">
        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div style="text-align: center" class="col-lg-6 d-none d-lg-block ">
                                <br>
                                <br>
                                <br>
                                <br>
                                <img  src="<%=request.getContextPath()%>/views/admin/assets/images/avatars/avatar.png">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form  action="login" method="post" >
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                placeholder="Mã Nhân Viên" name ="id" value="${id}">
                                        </div>
                                        <p class="text-danger">${errId}</p>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                placeholder="Password" name="password" value="${password}">
                                        </div>
                                        <p class="text-danger">${errPass}</p>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck"
                                                       name ="remember" ${remember ? 'checked' : ''}>
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <button  class="btn btn-primary btn-user btn-block" onclick="toastSuccess('aaa','bbb')"> Login</button>
                                        <hr>
                                        <a href="index.jsp" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="index.jsp" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="<%=request.getContextPath()%>/forgorpassword">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.html">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/modalmsgSuccess.jsp"></jsp:include>
    <jsp:include page="../common/modalError.jsp"></jsp:include>


    <script>
        function toastSuccess(title, message) {
            toastr.success("This Is Success Message", "Bottom Right", {
                positionClass: "toast-bottom-right",
                timeOut: 5e3,
                closeButton: !0,
                debug: !1,
                newestOnTop: !0,
                progressBar: !0,
                preventDuplicates: !0,
                onclick: null,
                showDuration: "300",
                hideDuration: "1000",
                extendedTimeOut: "1000",
                showEasing: "swing",
                hideEasing: "linear",
                showMethod: "fadeIn",
                hideMethod: "fadeOut",
                tapToDismiss: !1
            })
        }
    </script>
    <!-- Bootstrap core JavaScript-->
    <script src="<%=request.getContextPath()%>/views/login/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/login/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=request.getContextPath()%>/views/login/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=request.getContextPath()%>/views/login/js/sb-admin-2.min.js"></script>

</body>

</html>