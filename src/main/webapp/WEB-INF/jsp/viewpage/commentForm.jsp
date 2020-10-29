<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/single_listing_styles.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/bootstrap4/bootstrap.min.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/single_listing_responsive.css" />">
        <style>
            * {
                box-sizing: border-box;
            }

            input[type=text], select, textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }

            label {
                padding: 12px 12px 12px 0;
                display: inline-block;
            }

            input[type=submit] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                float: right;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

            .col-25 {
                float: left;
                width: 25%;
                margin-top: 6px;
            }

            .col-75 {
                float: left;
                width: 75%;
                margin-top: 6px;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }

            /* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
            @media screen and (max-width: 900px) {
                .col-25, .col-75, input[type=submit] {
                    width: 100%;
                    margin-top: 0;
                }
            }
        </style>
    </head>
    <body>
        <br><br><div class="container">
            <div class="row">
                <div class="col-md-7" style="border-right: 1px solid #E2E2E2;">
                    <!-- Reviews -->
                    <div class="reviews">
                        <div class="reviews_title" style="text-align: center;"><h3>reviews</h3></div>
                        <div class="reviews_container">
                            <!-- Review -->
                            <c:if test="${commentList.size()>0}">
                     
                                <c:forEach var="comment" items="${commentList}">
                                    <div class="review">
                                        <div class="review_content">
                                            <div class="review_title_container">
                                                <div class="review_title">${comment.users.username}</div>
                                                <div class="review_date">${comment.commentDateFormatted}</div>
                                                <div class="review_rating">${comment.rate}</div>
                                            </div>
                                            <div class="review_text">
                                                <p>${comment.content}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${commentList.size()==0}">
                                <h4 style="text-align: center; padding-top: 3em;">There are no comments and reviews yet!</h4>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="reviews">
                        <div class="reviews_title" style="text-align: center;"><h3>leave a review</h3></div>
                        <% if (session.getAttribute("users") != null) { %>
                        <mvc:form modelAttribute="comment" action="${pageContext.request.contextPath}/comment" method="post" style="padding-left: 10%;">
                            <div class="row">
                                <div class="col-25">
                                    <label for="username">Name</label>
                                </div>
                                <div class="col-75">
                                    <mvc:input type="text"  path="users.username" value="${users.username}" readonly="true"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-25">
                                    <label for="rate">Rate</label>
                                </div>
                                <div class="col-75">
                                    <mvc:select path="rate" id="rate">
                                        <mvc:option value="10">10.0</mvc:option>
                                        <mvc:option value="9.9">9.9</mvc:option>
                                        <mvc:option value="9.8">9.8</mvc:option>
                                        <mvc:option value="9.7">9.7</mvc:option>
                                        <mvc:option value="9.6">9.6</mvc:option>
                                        <mvc:option value="9.5">9.5</mvc:option>
                                        <mvc:option value="9.4">9.4</mvc:option>
                                        <mvc:option value="9.3">9.3</mvc:option>
                                        <mvc:option value="9.2">9.2</mvc:option>
                                        <mvc:option value="9.1">9.1</mvc:option>
                                        <mvc:option value="9.0">9.0</mvc:option>
                                    </mvc:select>
                                </div>
                            </div>
                            <mvc:input type="hidden"  path="users.id" value="${users.id}"/>
                            <mvc:input type="hidden"  path="hotel.id"  value="${hotel.id}"/>
                            <div class="row">
                                <div class="col-25">
                                    <label for="content">Content</label>
                                </div>
                                <div class="col-75">
                                    <mvc:textarea path="content" id="content" name="content" placeholder="Write something.." style="height:200px"/>
                                </div>
                            </div>
                            <div class="row" style="padding-left: 27%;">
                                <input type="submit" value="Post">
                            </div>
                        </mvc:form>
                        <% } else { %>
                        <h3 style="text-align: center;">Please <a href="${pageContext.request.contextPath}/login">Login</a> to comment and reviews!</h3>
                        <% }%>
                    </div>
                </div>
            </div>
        </div><br><br><br>		
    </body>
</html>
