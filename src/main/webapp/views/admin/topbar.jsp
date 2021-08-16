
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="headerbar">
    <div class="headerbar-left">
        <a href="index.jsp" class="logo">
            <img alt="Logo" src="<%=request.getContextPath()%>/views/admin/assets/images/logo.png" />
            <span>Điện Thoại Việt</span>
        </a>
    </div>
    <nav class="navbar-custom">
        <ul class="list-inline float-right mb-0">
            <li class="list-inline-item dropdown notif">
                <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" aria-haspopup="false" aria-expanded="false">
                    <img src="<%=request.getContextPath()%>/views/admin/assets/images/avatars/admin.png" alt="Profile image" class="avatar-rounded">
                </a>
                <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                    <!-- item-->
                    <div class="dropdown-item noti-title" style="width: 190px">
                        <h5 class="text-overflow">
                            <small>Hello, ${sessionScope.user.fullname}</small>
                        </h5>
                    </div>
                    <!-- item-->
                    <a href="<%=request.getContextPath()%>/account/changepassword" class="dropdown-item notify-item" >
                        <i class="fas fa-user"></i>
                        <span>Đổi Mật Khẩu</span>
                    </a>
                    <!-- item-->
                    <a href="<%=request.getContextPath()%>/logout" class="dropdown-item notify-item">
                        <i class="fas fa-power-off"></i>
                        <span>Đăng Xuất</span>
                    </a>
                </div>
            </li>

        </ul>

        <ul class="list-inline menu-left mb-0">
            <li class="float-left">
                <button class="button-menu-mobile open-left">
                    <i class="fas fa-bars"></i>
                </button>
            </li>
        </ul>

    </nav>
</div>
