<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/single_listing_styles.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/bootstrap4/bootstrap.min.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/single_listing_responsive.css" />">
    </head>
    <body>
        <div class="container">
            <!-- Reviews -->
            <div class="reviews">
                <div class="reviews_title" style="text-align: center;"><h2>reviews</h2></div>
                <div class="reviews_container">
                    <!-- Review -->
                    <c:if test="${roomList.size()>0}">
                        <c:forEach var="comment" items="${commentList}">
                            <div class="review">
                                <div class="review_content">
                                    <div class="review_title_container">
                                        <div class="review_title">${comment.users.name}</div>
                                        <div class="review_date">${comment.commentDate}</div>
                                        <div class="review_rating">${comment.rate}</div>
                                    </div>
                                    <div class="review_text">
                                        <p>${comment.content}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${roomList.size()==0}">
                        <h4 style="text-align: center; padding-top: 3em;">There are no comments and reviews yet!</h4>
                    </c:if>
                </div>
            </div><br><br>
            <% if (session.getAttribute("users") != null) { %>
            <p>Comment Form</p>
            <% } else { %>
            <h3 style="text-align: center;">Please login to comment and reviews!</h3>
            <% }%>
        </div><br><br><br>		
    </body>
</html>
