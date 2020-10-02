<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Page</title>
    </head>
    <body>
        <jsp:include page="../homepage/header.jsp" />
        <div class="home">
            <div class="home_background parallax-window" data-parallax="scroll" data-image-src="<c:url value="/resources/images/booking_banner.jpg" />"></div>
        </div>
        <jsp:include page="bookingForm.jsp" />
        <jsp:include page="../homepage/footer.jsp" />
    </body>
</html>
