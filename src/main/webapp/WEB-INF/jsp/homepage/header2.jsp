<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/bootstrap4/bootstrap.min.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/blog_styles.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/blog_responsive.css" />">
    </head>
    <div class="super_container">
        <!-- Header -->
        <header class="header">
            <!-- Top Bar -->
            <div class="top_bar">
                <div class="container">
                    <div class="row">
                        <div class="col d-flex flex-row">
                            <div class="social">
                                <ul class="social_list" style="padding-top: .4em;">
                                    <li class="main_nav_item"><a  style="font-size: 10px;" href="${pageContext.request.contextPath}">trang chủ</a></li>
                                    <li class="main_nav_item"><a  style="font-size: 10px;" href="about.html">giới thiệu</a></li>
                                    <li class="main_nav_item"><a  style="font-size: 10px;" href="offers.html">ưu đãi</a></li>
                                    <li class="main_nav_item"><a  style="font-size: 10px;" href="contact.html">liên hệ</a></a></li>
                                </ul>
                            </div>
                            <div class="content_search ml-lg-0 ml-auto">

                            </div>
                            <% if (session.getAttribute("users") != null) { %>
                            <div class="user_box ml-auto">
                                <div class="user_box_login user_box_link"><a href="${pageContext.request.contextPath}/account/${users.id}">${users.username}</a></div>
                                <div class="user_box_register user_box_link"><a href="<c:url value="/logout" />">logout</a></div>
                            </div>
                            <% } else { %>
                            <div class="user_box ml-auto">
                                <div class="user_box_login user_box_link"><a href="${pageContext.request.contextPath}/login">login</a></div>
                                <div class="user_box_register user_box_link"><a href="${pageContext.request.contextPath}/register">register</a></div>
                            </div>
                            <% }%>
                        </div>
                    </div>
                </div>		
            </div>
            <div class="hamburger">
                <i class="fa fa-bars trans_200"></i>
            </div>
        </header>
        <!-- menu repository-->
        <div class="menu trans_500">
            <div class="menu_content d-flex flex-column align-items-center justify-content-center text-center">
                <div class="menu_close_container"><div class="menu_close"></div></div>
                <div class="logo menu_logo"><a href="${pageContext.request.contextPath}"><img src="<c:url value="/resources/images/logo.png" />" alt=""></a></div>
                <ul>
                    <li class="menu_item"><a href="${pageContext.request.contextPath}">trang chủ</a></li>
                    <li class="menu_item"><a href="about.html">giới thiệu</a></li>
                    <li class="menu_item"><a href="offers.html">ưu đãi</a></li>
                    <li class="menu_item"><a href="contact.html">liên hệ</a></li>
                </ul>
            </div>
        </div>


        <script src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
        <script src="<c:url value="/resources/styles/bootstrap4/popper.js" />"></script>
        <script src="<c:url value="/resources/styles/bootstrap4/bootstrap.min.js" />"></script>
        <script src="<c:url value="/resources/plugins/colorbox/jquery.colorbox-min.js" />"></script>
        <script src="<c:url value="/resources/plugins/parallax-js-master/parallax.min.js" />"></script>
        <script src="<c:url value="/resources/js/blog_custom.js" />"></script>
</html>
