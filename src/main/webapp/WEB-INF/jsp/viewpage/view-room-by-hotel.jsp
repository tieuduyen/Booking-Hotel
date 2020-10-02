<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List All Type Room</title>
    </head>
    <jsp:include page="../homepage/header.jsp" />
    <body>
        <div class="home">
            <c:catch var="roomType">
                <div class="home_background parallax-window" data-parallax="scroll" data-image-src="<c:url value="/resources/images/${hotel.images}" />"></div>
                <div class="home_content">
                    <div class="home_title">${hotel.name}</div>
                </div>
            </c:catch>
        </div>
        <div class="offers">
            <div class="container">
                <div class="row">
                    <div class="col text-center">
                        <h2 class="section_title">hệ thống phòng</h2>
                    </div>
                </div>
                <div class="row offers_items">
                    <!-- Offers Item -->
                    <c:forEach var="room" items="${roomList}">
                        <div class="col-lg-12 offers_col">
                            <div class="offers_item">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="offers_image_container">
                                            <!-- Image by https://unsplash.com/@kensuarez -->
                                            <div class="offers_image_background" style="background-image:url(<c:url value="/resources/images/${room.roomType.images}" />)"></div>
                                            <div class="offer_name"><a href="${pageContext.request.contextPath}/room/${room.roomType.name}">${room.roomType.name}</a></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="offers_content">
                                            <div class="offers_price">${room.roomType.priceFormatted}</div>
                                            <p class="offers_text">${room.roomType.descriptions}</p>
                                            <div><p class="offers_text">Phù hợp cho:<strong>${room.roomType.size}</strong></p></div>
                                             <div class="button book_button" style="background-color: #0069d9;"><a href="${pageContext.request.contextPath}/addToCart/${room.roomType.id}">Booking<span></span><span></span><span></span></a></div> 
                                               
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </body>
    <jsp:include page="../homepage/footer.jsp" />
</html>
