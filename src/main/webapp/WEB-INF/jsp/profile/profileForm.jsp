<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="<c:url value="/resources/styles/responsive.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/styles/main_styles.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/styles/bootstrap4/bootstrap.min.css" />">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <style>
            #table {
                border-collapse: collapse;
                width: 80%;
            }
            td, th {
                padding: 6px;
            }
            tr,td{
                color: white;
                font-family: cursive;
                font-size: 20px;        
            }
        </style>
    </head>
    <body>
        <div class="container fill_height">
            <div class="row fill_height">
                <div class="col fill_height">
                    <!-- Search Tabs -->
                    <div class="search_tabs_container">
                        <div class="search_tabs d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                            <div class="search_tab active d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="https://img.icons8.com/fluent/40/000000/settings.png" alt="My AQccount"/>my account</div>
                            <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="https://img.icons8.com/officel/40/000000/mastercard-credit-card.png" alt="My Credit Card"/>my credit card</div>
                            <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="https://img.icons8.com/officel/40/000000/booking.png" alt="My Booking"/>my booking</div>
                            <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="https://img.icons8.com/color/40/000000/speech-bubble-with-dots.png"/ alt="My Comment & Review">My Comment & Review</div>
                        </div>		
                    </div>

                    <!-- xoa booking+ user: creditcard -> user -> bookingDetail -> booking-->
                    <!-- My Account -->
                    <div class="search_panel active" style=" height: 100%; padding-bottom: 3em;border-style: outset;background-color: #d8c2d1;">
                        <mvc:form modelAttribute="users" action="${pageContext.request.contextPath}/update-account/${users.id}" method="post" 
                                  id="search_form_1" class="search_panel_content d-flex flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                            <table>
                                <tbody>                                
                                    <tr>
                                        <td>Username</td>
                                        <td style="width: 21em;"><mvc:input path="username" class="destination search_input" required="true"/></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><mvc:input path="email" class="destination search_input" required="true"/></td>
                                    </tr>
                                    <tr>
                                        <td>Phone</td>
                                        <td><mvc:input path="phone" class="destination search_input" required="true"/></td>
                                    </tr>
                                    <tr>
                                        <td>Birth Date</td>
                                        <td><mvc:input path="birthdate" type="date" class="destination search_input" required="true"/></td>
                                    </tr>
                                    <tr>
                                        <td>Sex</td>
                                        <td>
                                            <mvc:select path="sex" class="search_input">
                                                <mvc:option value="Nam" />
                                                <mvc:option value="Nữ" />
                                            </mvc:select>
                                        </td>
                                    </tr>
                                    <mvc:input path="noopPassword" type="hidden"/>
                                    <mvc:input path="role" type="hidden"/>
                                </tbody>

                            </table>
                            <mvc:input path="password" type="hidden"/>
                            <input type="submit" value="Save" class="button search_button">
                        </mvc:form>
                    </div>

                </div>

                <!-- My Credit Card -->
                <div class="search_panel" style="height: 100%; padding-bottom: 3em;border-style: outset;background-color: #d8c2d1;">
                    <% if (request.getAttribute("creditCard") == null) { %>
                    <mvc:form modelAttribute="creditCards" action="${pageContext.request.contextPath}/add-creditCard/${users.id}" method="post" 
                              id="search_form_2" class="search_panel_content d-flex flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                        <table>
                            <tbody>
                                <tr>
                                    <td>Credit Card Type</td>
                                    <td><mvc:select path="creditCardType" class="search_input">
                                            <mvc:option value="Visa" />
                                            <mvc:option value="MasterCard" />
                                        </mvc:select></td>
                                </tr>
                                <tr>
                                    <td>Credit Card Number</td>
                                    <td><mvc:input path="creditCardNumber" class="destination search_input" required="true"/></td>
                                </tr>
                                <tr>
                                    <td>Cardholders Name</td>
                                    <td><mvc:input path="cardholdersName" class="destination search_input" required="true"/></td>
                                </tr>
                                <tr>
                                    <td>Expiration</td>
                                    <td><mvc:input path="expirationDate" type="date" class="destination search_input" required="true"/></td>
                                </tr>
                                <tr>
                                    <td>Surplus</td>
                                    <td><mvc:input path="surplus" type="text" class="destination search_input" required="true"/></td>
                                </tr>
                                <tr>
                                    <td>CVV</td>
                                    <td><mvc:input path="cvv" type="password" class="destination search_input" required="true"/></td>
                                </tr>
                            </tbody>
                        </table>
                        <input type="submit" value="Save" class="button search_button">
                    </mvc:form>
                    <% } else { %>
                    <mvc:form modelAttribute="creditCard" action="${pageContext.request.contextPath}/update-creditCard/${users.id}" method="post" 
                              id="search_form_2" class="search_panel_content d-flex flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                        <table>
                            <tbody>
                                <tr>
                                    <td>Credit Card Type:</td>
                                    <td style="padding-left: 2em;">${creditCard.creditCardType}</td>
                                </tr>
                                <tr>
                                    <td>Credit Card Number:</td>
                                    <td style="padding-left: 2em;">${creditCard.creditCardNumber}</td>
                                </tr>
                                <tr>
                                    <td>Cardholders Name:</td>
                                    <td style="padding-left: 2em;">${creditCard.cardholdersName}</td>
                                </tr>
                                <tr>
                                    <td>Expiration:</td>
                                    <td style="padding-left: 2em;">${creditCard.expirationDate}</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="button book_button button search_button" data-toggle="modal" data-target="#myModal1">
                            <a style=""> Edit </a>
                        </div>
                        <div class="modal fade" id="myModal1" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Edit Credit Card</h4>
                                    </div>
                                    <div class="modal-body"  style="background-color: #d8c2d1;">
                                        <table>
                                            <tbody>   
                                                <tr>
                                                    <td>Credit Card Type:</td>
                                                    <td style="padding-left: 2em;">
                                                        <mvc:select path="creditCardType" class="search_input">
                                                            <mvc:option value="Visa" />
                                                            <mvc:option value="MasterCard" />
                                                        </mvc:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Credit Card Number:</td>
                                                    <td style="padding-left: 2em;">
                                                        <mvc:input path="creditCardNumber" type="text" style="color: black;"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Cardholders Name:</td>
                                                    <td style="padding-left: 2em;">
                                                        <mvc:input path="cardholdersName" type="text" style="color: black;"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Expiration:</td>
                                                    <td style="padding-left: 2em;">
                                                        <mvc:input path="expirationDate" type="date" style="color: black;"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; padding-left: 50%;"><input type="submit" value="Update" class="button search_button"></td>
                                                </tr> 
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </mvc:form>
                    <% }%>
                </div>

                <!-- My Booking -->
                <div class="search_panel" style="background-color: #d8c2d1;; height: 100%; padding-bottom: 3em;">
                    <form method="post" id="search_form_3" class="search_panel_content d-flex flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                        <h2>My Booking</h2>
                        <c:if test="${bookingList.size()>0}">
                            <table id="table">
                                <thead>
                                    <tr>
                                        <th>Booking ID</th>
                                        <th>Booking Date</th>
                                        <th>Status</th>
                                        <th>Cancel Booking</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="booking" items="${bookingList}">
                                        <tr>
                                            <td>${booking.id}</td>
                                            <td>${booking.bookingDateFormatted}</td>
                                            <c:if test="${booking.status == 'Pending'}">   
                                                <td style="color: #218838;">${booking.status}</td>
                                            </c:if>
                                            <c:if test="${booking.status == 'Cancelled'}">   
                                                <td style="color: #FF6347;">${booking.status}</td>
                                            </c:if>
                                            <c:if test="${booking.status == 'Processed'}">   
                                                <td style="color: mediumaquamarine;">${booking.status}</td>
                                            </c:if>
                                            <td><a href="${pageContext.request.contextPath}/cancel-booking/${booking.id}">Cancel</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table><br><br>                         
                            <h3>Booking Details</h3>
                            <c:forEach var="bookingDetails" items="${bookingDetailsList}">
                                <div class="card" style="width:400px">
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                        <img src="<c:url value="/resources/images/${bookingDetails.room.roomType.images}"/>" style="width: 100%; height: 200px;">
                                        <div class="carousel-caption">
                                            <h3 style="color: tomato;"><strong>${bookingDetails.room.roomType.name}</strong></h3>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <ul>
                                            <li>Number Of People: <strong>${bookingDetails.numberOfPeople}</strong></li>
                                            <li>Check In Date <strong>${bookingDetails.checkInDateFormatted}</strong></li>
                                            <li>Check Out Date <strong>${bookingDetails.checkOutDateFormatted}</strong></li>
                                        </ul> 
                                    </div>
                                    <div class="card-footer">
                                        <h4 style="text-align: center;"><strong>${bookingDetails.priceFormatted} VND</strong></h4>
                                    </div>
                                </div><br>
                            </c:forEach>
                            </div>

                        </c:if>
                        <c:if test="${bookingList.size()==0}">
                            <h4 style="text-align: center; padding-top: 3em;">You don't have booking.</h4>
                        </c:if>
                    </form>

                </div>
                <!-- My Comment And Review -->
                <div class="search_panel" style="background-color: #d8c2d1;; height: 100%; padding-bottom: 3em;">
                    <mvc:form modelAttribute="comment" action="${pageContext.request.contextPath}/view-comment/${users.id}" method="post" 
                              id="search_form_5" class="search_panel_content d-flex flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                        <h2>My Comment</h2>
                        <c:if test="${commentList.size()>0}">
                            <table id="table">
                                <thead>
                                    <tr>
                                        <th>City</th>
                                        <th>Hotel Name</th>
                                        <th>Comment Date</th>
                                        <th>Content</th>
                                        <th>Rate</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="comment" items="${commentList}">
                                        <tr>
                                            <td><a href="${pageContext.request.contextPath}/city/${comment.hotel.city.name}">${comment.hotel.city.name}</a></td>
                                            <td><a href="${pageContext.request.contextPath}/hotel/${comment.hotel.name}">${comment.hotel.name}</a></td>
                                            <td>${comment.commentDateFormatted}</td>
                                            <td>${comment.content}</td>
                                            <td>${comment.rate}</td>
                                        </tr>
                                    </c:forEach>      
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${commentList.size()==0}">
                            <h4 style="text-align: center; padding-top: 3em;">There are no comments and reviews yet!</h4>
                        </c:if>
                    </mvc:form>
                </div>
            </div>
        </div>	
    </div>
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/custom.js" />"></script>
</body>
</html>
