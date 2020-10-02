<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <link rel="stylesheet" href="<c:url value="/resources/login_register_css/fonts/material-icon/css/material-design-iconic-font.min.cs" />">
        <!-- Main css -->
        <link rel="stylesheet" href="<c:url value="/resources/login_register_css/css/style.css" />">

    </head>
    <body>
        <!-- Sign up form -->
        <section class="signup" style="padding-top: 15%;">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h3 class="form-title">Create Account</h3>
                        <mvc:form modelAttribute="users" action="${pageContext.request.contextPath}/register" method="post" class="register-form" id="register-form" onsubmit ="return validateForm()" >
                            <div class="form-group">
                                <label for="username"><i class="glyphicon glyphicon-user"></i></label>
                                    <mvc:input type="text" name="username" path="username" id="username" placeholder="User Name"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="glyphicon glyphicon-envelope"></i></label>
                                    <mvc:input type="text" name="email" path="email" id="email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="password"><i class="glyphicon glyphicon-lock"></i></label>
                                    <mvc:input type="password" name="password" path="password" id="password" placeholder="Your password" />
                            </div>
                            <div class="form-group">
                                <label for="passwordConfirm"><i class="glyphicon glyphicon-repeat"></i></label>
                                    <mvc:input type="password" name="passwordConfirm" path="passwordConfirm" id="passwordConfirm" placeholder="Repeat your password"/>
                            </div>      
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
                                <a href="<c:url value="/" />" id="signup" class="form-submit">Cancel</a>
                            </div>
                        </mvc:form>
                    </div>
                    <div class="signup-image">
                        <figure><img style="border-radius: 50%; height: 300px;" src="<c:url value="/resources/login_register_css/images/hoi_an_images.jpg" />" alt="sing up image"></figure>
                        <a href="${pageContext.request.contextPath}/login" class="signup-image-link">I already have an account</a>
                    </div>
                </div>
            </div>
        </section>
        <%--
        <mvc:form modelAttribute="customer" action="${pageContext.request.contextPath}/register" method="post">
            <h1>Registration</h1> 

            <div class="form-group">
                <label for="username">User Name</label>
                <mvc:errors path="username"/>
                <mvc:input path="username" id="username" />
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <mvc:errors path="email"/>
                <mvc:input path="email" id="email" />
            </div>

            <div class="form-group">
                <label for="name">Name</label>
                <mvc:errors path="name"/>
                <mvc:input path="name" id="name" />
            </div>

            <div class="form-group">
                <label for="phone">Phone</label>
                <mvc:errors path="phone"/>
                <mvc:input path="phone" id="phone" />
            </div>

            <div class="form-group">
                <label for="sex">Sex</label>
                <mvc:errors path="sex"/>
                <mvc:input path="sex" id="sex" />
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <mvc:errors path="password"/>
                <mvc:input path="password" id="password" type="password" />
            </div>

            <div class="form-group">
                <label for="birthdate">BirthDate</label>
                <mvc:errors path="birthdate"/>
                <mvc:input path="birthdate" id="birthdate" type="Date" />
            </div>

            <br><br>
            <input type="submit" value="Register">
            <a href="<c:url value="/" />">Cancel</a>
        </mvc:form>  
        --%>
        <script src="<c:url value="/resources/login_register_css/vendor/jquery/jquery.min.js" />"></script>
        <script src="<c:url value="/resources/login_register_css/js/main.js" />"></script>
        <script src="<c:url value="/resources/js/notify.js" />"></script>
    </body>
</html>
