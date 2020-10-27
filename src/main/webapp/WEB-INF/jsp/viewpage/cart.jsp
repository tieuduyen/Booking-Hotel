<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/booking/fonts/icomoon/style.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/booking/css/bootstrap.min.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/booking/css/style.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/booking/css/magnific-popup.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/booking/css/jquery-ui.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/booking/css/owl.carousel.min.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/booking/css/owl.theme.default.min.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/booking/css/aos.css" />">

    </head>
    <jsp:include page="../homepage/header.jsp" />
    <div class="home">
        <div class="home_background parallax-window" data-parallax="scroll" data-image-src="<c:url value="/resources/images/booking_banner1.jpg" />"></div>
    </div>
    <body>
            <div class="site-wrap" style="background-color: whitesmoke;">
                <div class="site-section">
                    <div class="container">
                        <div class="row">

                            <div class="col-md-4 mb-4 mb-md-0">
                                <!-- infor of hotel-->
                                <c:forEach var="cart" items="${cart.bookingDetailsList}" >
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                        <img src="<c:url value="/resources/images/${cart.room.roomType.hotel.images}" />" style="width: 100%; height: 200px; border-radius: 1px solid black;">
                                        <div class="carousel-caption">
                                            <h3>${cart.room.roomType.hotel.name}</h3>
                                        </div>
                                    </div><br>
                                    <div class="form-group" style="border-top: 1px solid black;">
                                        <h4>Address: <strong>${cart.room.roomType.hotel.address}</strong></h4>
                                    </div>
                                    <div class="form-group">
                                        <h4>Phone: <strong>${cart.room.roomType.hotel.phone}</strong></h4>
                                    </div>
                                    <div class="form-group">
                                        <h4>Email: <strong>${cart.room.roomType.hotel.email}</strong></h4>
                                    </div>

                                </c:forEach><br>
                            </div>
                            <div class="col-md-6 mb-6 mb-md-0">
                                <table class="table site-block-order-table mb-6" style="width: 48em;">
                                    <thead>
                                    <th>Room Type</th>
                                    <th>Number Of People</th>
                                    <th>Price</th>
                                    <th>Number Of Rooms</th>
                                    <th>Total</th>
                                    </thead>
                                    <tbody>
                                        <c:set var="total" value="${0}"></c:set>
                                        <c:set var="totalCart" value="${0}"></c:set>
                                        <c:forEach var="cart" items="${cart.bookingDetailsList}">
                                            <c:set var="total" value="${cart.quantity * cart.room.roomType.price}"></c:set>
                                            <c:set var="totalCart" value="${totalCart + total}"></c:set>
                                                <tr>
                                                    <td>${cart.room.roomType.name}</td>
                                                <td style="text-align: center">${cart.numberOfPeople}</td>
                                                <td>${cart.room.roomType.priceFormatted}</td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/update" method="post">
                                                        <input type="hidden" name="id" value="${cart.room.roomType.id}">
                                                        <input type="number" min="1" max="${cart.room.roomType.quantity}"name="quantity" value="${cart.quantity}" id="quantity" style="width: 43px;">
                                                        <input type="submit" value="Update">
                                                    </form>
                                                </td>
                                                <td>${total}</td>
                                                <td><a href="${pageContext.request.contextPath}/remove/${cart.room.roomType.id}">Delete</a></td>
                                            </tr>

                                        </c:forEach>
                                        <tr>
                                            <td class="text-black font-weight-bold"><strong>Booking Total</strong></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td class="text-black font-weight-bold"><strong>${totalCart}</strong></td>
                                        </tr>
                                    </tbody>

                                    <% if (session.getAttribute("users") != null) { %>
                                    <td colspan="4">
                                        <form action="${pageContext.request.contextPath}/bookingForm" method="get">
                                            <input type="hidden" name="action" value="continue">
                                            <input class="btn btn-primary btn-lg py-3 btn-block" type="submit" value="continue">
                                        </form>
                                    </td> 
                                    <% } else { %>
                                    <td colspan="4">
                                        <div class="btn btn-primary btn-lg py-3 btn-block" data-toggle="modal" data-target="#myModal"><a>Continue</a></div>
                                    </td>
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
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <script src="<c:url value="/resources/booking/js/jquery-3.3.1.min.js" />"></script>
        <script src="<c:url value="/resources/booking/js/jquery-ui.js" />"></script>
        <script src="<c:url value="/resources/booking/js/popper.min.js" />"></script>
        <script src="<c:url value="/resources/booking/js/bootstrap.min.js" />"></script>
        <script src="<c:url value="/resources/booking/js/jquery.magnific-popup.min.js" />"></script>
    </body>
</html>
