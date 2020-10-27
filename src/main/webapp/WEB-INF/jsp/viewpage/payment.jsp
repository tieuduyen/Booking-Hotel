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
    <style>
        .accordion {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            transition: 0.4s;
        }

        .active, .accordion:hover {
            background-color: #ccc;
        }

        .panel {
            padding: 0 18px;
            background-color: white;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
        }
    </style>
    <body>
        <div class="site-wrap" style="background-color: whitesmoke;">
            <div class="site-section">
                <div class="container">
                    <div class="row">
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

                                    <tbody>
                                        <tr>
                                            <td>Customer Name</td>
                                            <td>${user.name}</td>
                                        </tr>
                                        <tr>
                                            <td>Phone</td>
                                            <td>${user.phone}</td>
                                        </tr>
                                        <c:set var="total" value="${0}"></c:set>
                                        <c:set var="totalCart" value="${0}"></c:set>
                                        <c:forEach var="cart" items="${cart.bookingDetailsList}">
                                            <c:set var="total" value="${cart.quantity * cart.room.roomType.price}"></c:set>
                                            <c:set var="totalCart" value="${totalCart + total}"></c:set>
                                                <tr>
                                                    <td>Room Type</td>
                                                    <td>${cart.room.roomType.name}</td>
                                            </tr>
                                            <tr>
                                                <td>Price</td>
                                                <td>${cart.room.roomType.priceFormatted}</td>
                                            </tr>
                                            <tr>
                                                <td>Number Of Rooms</td>
                                                <td>${cart.quantity}</td>
                                            </tr>
                                            <tr>
                                                <td>Total</td>
                                                <td>${total}</td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td class="text-black font-weight-bold"><strong>Booking Total</strong></td>
                                            <td class="text-black font-weight-bold"><strong>${totalCart}</strong></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-5 mb-5 mb-md-0">
                            <div class="p-3 p-lg-5 border">
                                Phương thức thanh toán 
                                <form action="${pageContext.request.contextPath}/booking" method="post" style="width: 100%;" >
                                    <button class="accordion" type="button">Thẻ Tín Dụng / Thẻ Ghi Nợ</button>
                                    <div class="panel">
                                        <div class="form-group row">
                                            <div class="col-md-12">
                                                <label class="text-black">Tên trên thẻ <span
                                                        class="text-danger">*</span></label>
                                                <input type="text" name="cardholdersName" class="form-control" value="${creditCart.cardholdersName}"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-12">
                                                <label class="text-black">Số thẻ tín dụng/thẻ ghi nợ <span
                                                        class="text-danger">*</span></label>
                                                <input type="text" name="creditCardNumber"  class="form-control" value="${creditCart.creditCardNumber}"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-6">
                                                <label for="phone" class="text-black">Ngày hết hạn <span class="text-danger">*</span></label>
                                                <input type="date" name="expirationDate"  class="form-control" value="${creditCart.expirationDate}"/>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="email" class="text-black">Mã bảo mật CVC<span class="text-danger">*</span></label>
                                                <input type="password" name="cvv"  class="form-control"/>
                                            </div>
                                        </div>

                                    </div>
                                            <div style="color: red;">${erroMessage}</div>
                                    <div class="checkbox">
                                        <label><input type="checkbox" value="">Thanh toán tại khách sạn</label>
                                    </div>
                            </div>
                            <input class="btn btn-primary btn-lg py-3 btn-block" type="submit" value="booking">
                        </div>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
        <script src="<c:url value="/resources/booking/js/jquery-3.3.1.min.js" />"></script>
        <script src="<c:url value="/resources/booking/js/jquery-ui.js" />"></script>
        <script src="<c:url value="/resources/booking/js/popper.min.js" />"></script>
        <script src="<c:url value="/resources/booking/js/bootstrap.min.js" />"></script>
        <script src="<c:url value="/resources/booking/js/jquery.magnific-popup.min.js" />"></script>
        <script>
            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.maxHeight) {
                        panel.style.maxHeight = null;
                    } else {
                        panel.style.maxHeight = panel.scrollHeight + "px";
                    }
                });
            }
        </script>
    </body>
</html>
