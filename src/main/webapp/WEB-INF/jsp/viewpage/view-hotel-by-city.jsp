<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Hotel</title>
        <link rel="stylesheet" href="<c:url value="/resources/styles/bootstrap4/bootstrap.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/styles/offers_styles.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/styles/offers_responsive.css" />">
    </head>
    <jsp:include page="../homepage/header.jsp" />
    <body>
        <div class="home">
            <c:catch var="hotel">
                <div class="home_background parallax-window" data-parallax="scroll" data-image-src="<c:url value="/resources/images/${city.cityImages}" />"></div>
                <div class="home_content">
                    <div class="home_title">${city.name}</div>
                </div>
            </c:catch>
        </div>
        <div class="offers">

            <!-- Offers -->
            <div class="container">
                <div class="row">
                    <div class="col-lg-1 temp_col"></div>
                    <div class="col-lg-11">

                        <!-- Offers Sorting -->
                        <div class="offers_sorting_container">
                            <ul class="offers_sorting">
                                <li>
                                    <span class="sorting_text">Evaluate</span>
                                    <i class="fa fa-chevron-down"></i>
                                    <ul>
                                        <c:catch var="hotel">
                                            <li class="sort_btn" data-isotope-option='{ "sortBy": "original-order" }'><span><a href="${pageContext.request.contextPath}/sort-by-evaluate-low-to-high/${city.name}">Evaluate: Thấp đến Cao</a></span></li>
                                            <li class="sort_btn" data-isotope-option='{ "sortBy": "name" }'><span><a href="${pageContext.request.contextPath}/sort-by-evaluate-high-to-low/${city.name}">Evaluate: Cao đến Thấp</a></span></li>
                                                    </c:catch>
                                    </ul>
                                </li>
                                <li>
                                    <span class="sorting_text">Starts</span>
                                    <i class="fa fa-chevron-down"></i>

                                    <ul>
                                        <%-- ${pageContext.request.contextPath}/find/${city.name} --%>
                                        <c:forEach var="rate" items="${rateList}">
                                            <li class="filter_btn" data-filter=".rating_${rate.id}"><span><a href="#">${rate.id}</a></span></li>
                                                    </c:forEach>
                                    </ul>

                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <!-- Offers Grid -->
                        <div class="offers_grid">
                            <!-- Offers Item -->
                            <c:forEach var="hotel" items="${availableHotel}">
                                <div class="offers_item rating_4">
                                    <div class="row">
                                        <div class="col-lg-1 temp_col"></div>
                                        <div class="col-lg-3 col-1680-4">
                                            <div class="offers_image_container">
                                                <!-- Image by https://unsplash.com/@kensuarez -->
                                                <div class="offers_image_background" style="background-image:url(<c:url value="/resources/images/${hotel.images}" />)"></div>
                                                <div class="offer_name"><a href="${pageContext.request.contextPath}/hotel/${hotel.name}">${hotel.name}</a></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="offers_content">
                                                <div class="rating_r rating_r_${hotel.rate.typeRate} offers_rating" data-rating="${hotel.rate.typeRate}">
                                                    <i></i>
                                                    <i></i>
                                                    <i></i>
                                                    <i></i>
                                                    <i></i>
                                                </div>
                                                <ul>
                                                    <li class="">Địa chỉ: <strong>${hotel.address}</strong></li>
                                                    <li class="">SĐT: <strong>${hotel.phone}</strong></li>
                                                    <li class="">Mail: <strong>${hotel.email}</strong></li>
                                                </ul>
                                                <p class="offers_text" style="overflow: hidden;verflow: ellipsis;line-height: 25px;-webkit-line-clamp: 3;display: -webkit-box;-webkit-box-orient: vertical;">${hotel.introduction}</p>
                                                <div class="button book_button"><a href="${pageContext.request.contextPath}/hotel/${hotel.name}">see more<span></span><span></span><span></span></a></div>
                                                <div class="offer_reviews">
                                                    <c:if test="${hotel.evaluate == 10.0}">
                                                        <div class="offer_reviews_content">
                                                            <div class="offer_reviews_title">perfect</div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${hotel.evaluate <= 9.9 && hotel.evaluate >= 9.0}">
                                                        <div class="offer_reviews_content">
                                                            <div class="offer_reviews_title">very good</div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${hotel.evaluate <= 8.9 && hotel.evaluate >= 8.0}">
                                                        <div class="offer_reviews_content">
                                                            <div class="offer_reviews_title">good</div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${hotel.evaluate <= 7.9}">
                                                        <div class="offer_reviews_content">
                                                            <div class="offer_reviews_title">normal</div>
                                                        </div>
                                                    </c:if>
                                                    <div class="offer_reviews_rating text-center">${hotel.evaluate}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>		
        </div>
    </body>
    <jsp:include page="../homepage/footer.jsp" />
</html>
