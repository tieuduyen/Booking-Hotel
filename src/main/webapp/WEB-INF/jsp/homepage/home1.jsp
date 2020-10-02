<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            h1{
                text-align: center;
            }
            #table {
                margin-left: 17%;
                border-collapse: collapse;
                width: 60%;
            }
            td,th{
                border: 1px solid black;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <table id="table">
            <thead>
                <tr>
                    <th>Room Type</th>
                    <th>Price</th>
                    <th>Rooms Left</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="room" items="${roomList}">
                    <tr>
                        <td>${room.roomType.name}</td>
                        <td>${room.roomType.price}</td>
                        <td>${room.roomType.quantity}</td>
                         <th><a href="${pageContext.request.contextPath}/addToCart/${room.id}"> Add To Cart</a></th>
                    </tr>
                </c:forEach>
            </tbody>

        </table>
    </body>
</html>
