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
    <body>
        <div class="site-wrap" style="background-color: whitesmoke;">
            <div class="site-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7">
                            <!-- check booking-->
                            <!-- price details-->
                            <!-- infor-->
                            <h2 class="h3 mb-3 text-black">Information of customer:</h2>
                            <div class="p-3 p-lg-5 border">
                                <mvc:form modelAttribute="user" action="continue" method="post" style="width: 100%;" >
                                    <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="name" class="text-black">Customer Name: <span
                                                class="text-danger">*</span></label>
                                        <mvc:input type="text" path="name" required="true" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <label for="phone" class="text-black">Phone: <span class="text-danger">*</span></label>
                                        <mvc:input type="text" path="phone" required="true" class="form-control"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="email" class="text-black">Email: <span class="text-danger">*</span></label>
                                        <mvc:input type="text" class="form-control" path="email" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="c_order_notes" class="text-black">Order Notes</label>
                                    <textarea name="c_order_notes" id="c_order_notes" cols="30" rows="5" class="form-control"
                                              placeholder="Write your notes here..."></textarea>
                                </div>
                                
                                    <input class="btn btn-primary btn-lg py-3 btn-block"" type="submit" value="Continue">

                                </mvc:form>
                            </div><br>
                        </div>
                        <div class="col-md-5 mb-5 mb-md-0">
                            <!-- infor of hotel-->
                            <c:forEach var="cart" items="${cart.bookingDetailsList}" begin="0" end="0">
                                <div class="p-3 p-lg-5 border">
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
                            
                                <table class="table site-block-order-table mb-5">
                                    <thead>
                                    <th>Room Type</th>
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
                                                <td>${cart.room.roomType.priceFormatted}</td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/update" method="post">
                                                        <input type="hidden" name="id" value="${cart.room.roomType.id}">
                                                        <input type="number" name="quantity" value="${cart.quantity}" id="quantity" style="width: 43px;">
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
                                            <td class="text-black font-weight-bold"><strong>${totalCart}</strong></td>
                                        </tr>
                                    </tbody>
                                </table>
                                        <a href="${pageContext.request.contextPath}/payment">payment</a>
                            </div>
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
