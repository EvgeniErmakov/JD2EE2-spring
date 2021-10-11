<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        #ErrorPage {
            display: flex;
            flex-flow: column wrap;
            align-items: center;
        }

        .heading {
            margin: 10px 0px;
            height: 180px;
            background-color: #408080;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
</head>
<body>

<div class="heading">
    <h1>
        <c:url var="showUpdateLink" value="/news/start"/>
        <a class="reference" href=${showUpdateLink}>News Portal</a>
    </h1>
</div>


<div id="ErrorPage">
    <span style="color: #95af88; font-family: Verdana,serif; padding-top: 20px; font-size: larger">
        <c:set var="code" value='${pageContext.errorData.statusCode}'/>
        <c:choose>
            <c:when test="${code == '404'}">
                <c:out value="Page not found!"/>
            </c:when>
            <c:otherwise>
                <c:out value="Something went wrong!"/>
            </c:otherwise>
        </c:choose>
    </span>
</div>
</body>
</html>