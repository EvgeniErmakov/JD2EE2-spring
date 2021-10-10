<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        #ErrorPage {
            display: flex;
            flex-flow: column wrap;
            align-items: center;
        }

        #title {
            margin-top: 50px;
            text-align: center;
            height: 30px;
            width: 100%;
            color: #95af88;
            font: 30px Verdana;
        }
    </style>
</head>
<body>
<div id="title">Opps...</div>
<div id="ErrorPage">
    <span style="color: #95af88; font-family: Verdana,serif; padding-top: 20px; font-size: larger">
        <c:set var="code" value='${pageContext.errorData.statusCode}'/>
        <c:choose>
            <c:when test="${code == '404'}">
                <c:out value="Page not found :("/>
            </c:when>
            <c:otherwise>
                <c:out value="Sorry, something went wrong, news portal is temporary unavailable, please try again later :("/>
            </c:otherwise>
        </c:choose>
    </span>
</div>
</body>
</html>