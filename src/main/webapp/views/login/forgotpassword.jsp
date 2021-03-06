
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Forgot Password</title>

  <!-- Custom fonts for this template-->
  <link href="<%=request.getContextPath()%>/views/login/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

  <!-- Custom styles for this template-->
     <link href="<%=request.getContextPath()%>/views/login/css/sb-admin-2.min.css" rel="stylesheet">
  <script src="<%=request.getContextPath()%>/views/common/sweetalert2.all.min.js"></script>
  <!-- Modernizr js -->
  <script src="<%=request.getContextPath()%>/views/website/js/vendor/modernizr-2.8.3.min.js"></script>

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
            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
            <div class="col-lg-6">
              <div class="p-5">
                <div class="text-center">
                  <h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
                  <p class="mb-4">${checkErorr}</p>
                </div>
                <form action="<%=request.getContextPath()%>/forgorpassword" method="post" class="user">
                  <div class="form-group">
                    <input type="email" class="form-control form-control-user"
                           name="email"
                           id="exampleInputEmail" aria-describedby="emailHelp"
                           placeholder="Enter Email Address...">
                  </div>
                  <button  class="btn btn-primary ">
                    Reset Password
                  </button>
                </form>
                <hr>
                <div class="text-center">
                  <a class="small" href="register.html">Create an Account!</a>
                </div>
                <div class="text-center">
                  <a class="small" href="login.html">Already have an account? Login!</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>

  </div>
  <jsp:include page="../common/modalError.jsp"></jsp:include>
  <jsp:include page="../common/modalmsgSuccess.jsp"></jsp:include>
</div>

<!-- Bootstrap core JavaScript-->
<script src="<%=request.getContextPath()%>/views/login/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/views/login/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="<%=request.getContextPath()%>/views/login/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="<%=request.getContextPath()%>/views/login/js/sb-admin-2.min.js"></script>

</body>

</html>
