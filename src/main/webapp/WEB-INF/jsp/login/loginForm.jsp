<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <link rel="stylesheet" href="<c:url value="/resources/login_register_css/css/style.css" />">
    </head>
    <body>
        <section class="sign-in" style="padding-top: 15%;">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img  style="border-radius: 50%; height: 300px;" src="<c:url value="/resources/login_register_css/images/ha_noi_images.jpg" />" alt="sing up image"></figure>
                        <a href="${pageContext.request.contextPath}/register" class="signup-image-link">Create Account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign up</h2>
                        <form action="${pageContext.request.contextPath}/login" method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="email"><i class="glyphicon glyphicon-user"></i></label>
                                <input type="text" name="email" id="your_name" placeholder="Email"/>
                            </div>
                            <div class="form-group">
                                <label for="password"><i class="glyphicon glyphicon-lock"></i></label>
                                <input type="password" name="password" id="your_pass" placeholder="Password"/>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                                <a href="<c:url value="/" />" id="signup" class="form-submit">Cancel</a>
                            </div>
                        </form>
                       
                    </div>
                </div>
            </div>
        </section>
        <%--
<h1>Spring Security Password Encoder</h1>
<form action="<c:url value="/j_spring_security_check" />" method="post">
<label>User Name: </label>
<input type="text" name="username" /><br>

            <label>Password: </label>
            <input type="password" name="password" /><br>

            <input type="submit" value="Login" />
            <input type="hidden" name="${_crsf.parameterName}" value="${_crsf.token}"/>
        </form>
        <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
            <p stype="color: red">Your username or password is incorrect. Try again.</p>
        </c:if>   
        --%>
        <script src="<c:url value="/resources/login_register_css/vendor/jquery/jquery.min.js" />"></script>
        <script src="<c:url value="/resources/login_register_css/js/main.js" />"></script>
    </body>
</html>
