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
                <c:if test="${roomTypeList.size()>0}">
                    <div class="row offers_items">
                        <!-- Offers Item -->
                        <c:forEach var="roomType" items="${roomTypeList}">
                            <div class="col-lg-12 offers_col">
                                <div class="offers_item">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="offers_image_container">
                                                <!-- Image by https://unsplash.com/@kensuarez -->
                                                <div class="offers_image_background" style="background-image:url(<c:url value="/resources/images/${roomType.images}" />)"></div>
                                                <div class="offer_name"><a href="${pageContext.request.contextPath}/room/${roomType.name}">${roomType.name}</a></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="offers_content">
                                                <div class="offers_price">${roomType.priceFormatted}</div>
                                                <p class="offers_text" style="overflow: hidden;verflow: ellipsis;line-height: 25px;-webkit-line-clamp: 2;display: -webkit-box;-webkit-box-orient: vertical;">${roomType.descriptions}</p>
                                                <div><p class="offers_text">Phù hợp cho:<strong>${roomType.size}</strong></p></div>
                                                <% if (session.getAttribute("users") != null) { %>
                                                <div class="button book_button" style="background-color: #0069d9;"><a href="${pageContext.request.contextPath}/addToCart/${roomType.id}">Booking<span></span><span></span><span></span></a></div> 
                                                <% } else { %>
                                                <div class="button book_button" data-toggle="modal" data-target="#myModal" style="background-color: #0069d9;"><a>Booking<span></span><span></span><span></span></a></div> 
                                                <div class="modal" id="myModal">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                 <h3 style="text-align: center;">Please
                                                                     <a href="${pageContext.request.contextPath}/login">Login</a> or 
                                                                     <a href="${pageContext.request.contextPath}/register">Register</a> to booking!
                                                                 </h3>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <% }%>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${roomTypeList.size()==0}">
                    <h4 style="text-align: center; padding-top: 3em;">This hotel currently does not have any rooms! Please choose another hotel. :'(</h4>
                </c:if>
            </div>
        </div>
        <jsp:include page="../viewpage/commentForm.jsp" />
    </body>
    <jsp:include page="../homepage/footer.jsp" />
</html>
