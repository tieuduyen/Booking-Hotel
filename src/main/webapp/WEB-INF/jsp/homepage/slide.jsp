<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/bootstrap4/bootstrap.min.css" />">
        <link href="<c:url value="/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/plugins/OwlCarousel2-2.2.1/animate.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/main_styles.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/responsive.css" />">
    </head>
    <body>
        <div class="home">
        <div class="home_slider_container">
            <div class="owl-carousel owl-theme home_slider">
                <!-- Slider Item -->
                <c:forEach var="slide" items="${slideList}">
                    <div class="owl-item home_slider_item">
                        <!-- Image by https://unsplash.com/@anikindimitry -->
                        <div class="home_slider_background" style="background-image:url(<c:url value="/resources/images/${slide.images}" />)"></div>

                        <div class="home_slider_content text-center">
                            <div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
                                <h1></h1>
                                <h1>${slide.title}</h1>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <!-- Slider Item -->
            </div>
            <!-- Home Slider Nav - Prev -->
            <div class="home_slider_nav home_slider_prev">
                <svg version="1.1" id="Layer_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                     width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                <defs>
                <linearGradient id='home_grad_prev'>
                <stop offset='0%' stop-color='#fa9e1b'/>
                <stop offset='100%' stop-color='#8d4fff'/>
                </linearGradient>
                </defs>
                <path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
                      M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
                      C22.545,2,26,5.541,26,9.909V23.091z"/>
                <polygon class="nav_arrow" fill="#F3F6F9" points="15.044,22.222 16.377,20.888 12.374,16.885 16.377,12.882 15.044,11.55 9.708,16.885 11.04,18.219 
                         11.042,18.219 "/>
                </svg>
            </div>
            <!-- Home Slider Nav - Next -->
            <div class="home_slider_nav home_slider_next">
                <svg version="1.1" id="Layer_3" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                     width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                <defs>
                <linearGradient id='home_grad_next'>
                <stop offset='0%' stop-color='#fa9e1b'/>
                <stop offset='100%' stop-color='#8d4fff'/>
                </linearGradient>
                </defs>
                <path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
                      M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
                      C22.545,2,26,5.541,26,9.909V23.091z"/>
                <polygon class="nav_arrow" fill="#F3F6F9" points="13.044,11.551 11.71,12.885 15.714,16.888 11.71,20.891 13.044,22.224 18.379,16.888 17.048,15.554 
                         17.046,15.554 "/>
                </svg>
            </div>
            <!-- Home Slider Dots -->
            <div class="home_slider_dots">
                <ul id="home_slider_custom_dots" class="home_slider_custom_dots">
                    <c:forEach var="slide" items="${slideList}">
                        <li class="home_slider_custom_dot active"><div></div>0${slide.id}.</li>
                            </c:forEach>
                </ul>
            </div>
        </div>
        </div>
        <script src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
        <script src="<c:url value="/resources/styles/bootstrap4/popper.js" />"></script>
        <script src="<c:url value="/resources/styles/bootstrap4/bootstrap.min.js" />"></script>
        <script src="<c:url value="/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js" />"></script>
        <script src="<c:url value="/resources/plugins/easing/easing.js" />"></script>
        <script src="<c:url value="/resources/js/custom.js" />"></script>
    </body>
</html>
