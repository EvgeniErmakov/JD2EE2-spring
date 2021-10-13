<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>News portal main page</title>
    <style>
        <%@include file='/./resources/css/style.css' %>
    </style>
</head>

<body>

<div class="heading">
    <h1>
        <c:url var="showUpdateLink" value="/news/start"/>
        <a class="reference" href=${showUpdateLink}>News Portal</a>
    </h1>

    <div class=heading-1>
        <div class="heading-2" style="">

            <form:form action="toAddNewsPage" modelAttribute="news" method="GET">
                <input type="submit" class="button" value="Create a news"/>
            </form:form>

            <form:form
                    action="${pageContext.request.contextPath}/logout"
                    method="post">
                <input type="submit" class="button" value="Exit">
            </form:form>
        </div>
    </div>
</div>

<HR WIDTH="70%" ALIGN="center" SIZE="1">

<c:if test="${not empty msg}">
    <div class="text" align="center">
        <strong>${css}!</strong> ${msg}
    </div>
    <HR WIDTH="70%" ALIGN="center" SIZE="1">
</c:if>

<table class="textNews" align="center">
    <c:forEach var="news" items="${allNews}">
        <tr ALIGN="center">
            <th ALIGN="center"><c:url var="singleNewsLink" value="/news/${news.id}"/>

                <sec:authorize access="!isAnonymous()">
                <a href=${singleNewsLink}>${news.title}</a></th>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
                <div>${news.title}</div>
                </th>
            </sec:authorize>
        </tr>

        <tr ALIGN="center">
            <td ALIGN="center"><p class="textDescription">
                <p>${news.brief}</p>

                <form:form action="publish/${news.id}" modelAttribute="news" method="PUT"
                           style="display: inline-block; text-decoration: none;">
                    <input type="submit" value="To main page" style="font-size: 20px;display: inline-block;
                    background: #408080;color: black; padding: 1rem 1.5rem; text-decoration: none; "/>
                </form:form>


                <form:form action="showUpdatePage?id=${news.id}" modelAttribute="news" method="POST"
                           style="display: inline-block; text-decoration: none;">
                    <input type="submit" value="Update" style="font-size: 20px;display: inline-block;
                    background: #408080;color: black; padding: 1rem 1.5rem; text-decoration: none; "/>
                </form:form>

                <form:form action="${news.id}" modelAttribute="news" method="DELETE"
                           style="display: inline-block; text-decoration: none;">
                    <input type="submit" value="Delete" style="font-size: 20px;display: inline-block;
                    background: #408080;color: black; padding: 1rem 1.5rem; text-decoration: none; "/>
                </form:form>

                <HR WIDTH="70%" ALIGN="center" SIZE="1">
            </td>
        </tr>
    </c:forEach>
</table>

<div class="pagination" style="width: 50%; margin: 0 auto; text-align: center;">
    <c:set var="pageNumber" value="${sessionScope.currentPageNumber}"/>
    <c:choose>
        <c:when test="${pageNumber != 1}">
            <c:url var="prevLink" value="/news/toOfferedNewsPage?page=${pageNumber - 1}"/>
            <a style="color: #95af88;" href="${prevLink}">< Previous</a>
        </c:when>
        <c:otherwise>
            <a class="isDisabled" href="javascript:void(0)">< Previous</a>
        </c:otherwise>
    </c:choose>
</div>

<div class="pagination" style="width: 50%; margin: 0 auto; text-align: center;">
    <c:choose>
        <c:when test="${pageNumber lt pageCount}">
            <c:url var="nextLink" value="/news/toOfferedNewsPage?page=${pageNumber + 1}"/>
            <a style="color: #95af88;" href="${nextLink}">Next ></a>
        </c:when>
        <c:otherwise>
            <a class="isDisabled" href="javascript:void(0)">Next ></a>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>