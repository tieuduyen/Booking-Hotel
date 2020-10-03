<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List All Hotel Page</title>
    </head>

    <body>
        <jsp:include page="header.jsp" />
        <jsp:include page="slide.jsp" />
        <div class="search" >
            <!-- Search Contents -->
            <div class="container fill_height">
                <div class="row fill_height">
                    <div class="col fill_height">
                        <!-- Search Panel -->
                        <div class="search_panel active">
                            <form action="${pageContext.request.contextPath}/search" id="search_form_1" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start" method="get">
                                <div class="search_item">
                                    <div>Chọn điểm đến</div>
                                    <select id="destination_1" class="dropdown_item_select search_input" name ="searchText" type="text">
                                        <c:forEach var="optionCity" items="${optionCityList}">
                                            <option value="${optionCity.id}"> ${optionCity.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="search_item">
                                    <div>ngày đến</div>
                                    <input type="date" name="checkIn" class="check_in search_input">
                                </div>
                                <div class="search_item">
                                    <div>ngày đi</div>
                                    <input type="date"  name="checkOut" class="check_out search_input">
                                </div>
                                <div class="search_item">
                                    <div>số phòng</div>
                                    <select id="rooms"  class="dropdown_item_select search_input" name="rooms">
                                        <c:forEach var="number"  begin="1" end="10">
                                            <option>${number}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="search_item">
                                    <div>số người</div>
                                    <select id="people" class="dropdown_item_select search_input">
                                        <c:forEach var="number" begin="1" end="20">
                                            <option>${number}</option>
                                        </c:forEach>
                                    </select>
                                </div><br><br>
                                <button class="button search_button" type="submit">search<span></span><span></span><span></span></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>		
        </div>

        <!-- Intro -->
        <div class="intro">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h2 class="intro_title text-center">We have the best tours</h2>
                    </div>
                </div>
                <div class="row intro_items">
                    <!-- Intro Item -->
                    <c:forEach var="city" items="${cityList}">
                        <div class="col-lg-4 intro_col">
                            <div class="intro_item">
                                <div class="intro_item_overlay"></div>
                                <!-- Image by https://unsplash.com/@dnevozhai -->
                                <div class="intro_item_background" style="background-image:url(<c:url value="/resources/images/${city.cityImages}"/>)"></div>
                                <div class="intro_item_content d-flex flex-column align-items-center justify-content-center">                             
                                    <div class="button intro_button">
                                        <div class="button_bcg"></div>
                                        <a href="${pageContext.request.contextPath}/city/${city.name}">see more<span></span><span></span><span></span></a>
                                    </div>
                                    <div class="intro_center text-center">                             
                                        <a href="${pageContext.request.contextPath}/city/${city.name}"><h1>${city.name}</h1></a>
                                        <div class="rating rating_4">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- Offers -->

        <div class="offers">
            <div class="container">
                <div class="row">
                    <div class="col text-center">
                        <h2 class="section_title">the best offers with rooms</h2>
                    </div>
                </div>
                <div class="row offers_items">
                    <!-- Offers Item -->
                    <c:forEach var="roomType" items="${roomTypeList}">
                        <div class="col-lg-6 offers_col">
                            <div class="offers_item">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="offers_image_container">
                                            <!-- Image by https://unsplash.com/@kensuarez -->
                                            <div class="offers_image_background" style="background-image:url(<c:url value="/resources/images/${roomType.images}"/>) ; height: 18em;"></div>
                                            <div class="offer_name"><a href="#"><p style="color: white;font-size: 17px;">${roomType.hotel.city.name}</p></a></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="offers_content">
                                            <div class="offers_price">${roomType.priceFormatted}<span>/perNight</span></div>
                                            <div class="rating_r rating_r_4 offers_rating">
                                                <i></i>
                                                <i></i>
                                                <i></i>
                                                <i></i>
                                                <i></i>
                                            </div>
                                            <p class="offers_text" style="overflow: hidden;verflow: ellipsis;line-height: 25px;-webkit-line-clamp: 3;display: -webkit-box;-webkit-box-orient: vertical;">${roomType.descriptions}</p>

                                            <div class="offers_link"><a href="offers.html">read more</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <jsp:include page="advantagesForm.jsp" />
    </body>
    <jsp:include page="footer.jsp" />
</html>
