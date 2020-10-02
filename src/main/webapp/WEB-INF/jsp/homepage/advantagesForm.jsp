<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/advantages/css/bootstrap.min.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/advantages/css/style.css" />">
    </head>
    <body>
        <div class="travel_variation_area">
            <div class="row">
                <c:forEach var="advantages" items="${advantagesList}">
                <div class="col-lg-6 col-md-6">
                    <div class="single_travel text-center">
                        <div class="icon">
                            <img style="height: 7em;" src="<c:url value="/resources/images/${advantages.images}"/>" alt="${advantages.text}">
                        </div>
                        <h4>${advantages.text}</h4>
                    </div>
                </div>
                </c:forEach>
            </div>
    </div>
    </body>
</html>
