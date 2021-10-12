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
        .headline {
            margin: 50px;
            background-color: #408080;
            font-size: 75px;
            font-family: Georgia, serif !important;
            text-align: left;
            text-decoration: none;
            link: black;
            color: black;
        }

        .textNews {
            font-size: 35px;
            width: auto;
            word-break: break-word;
            color: #000000;
            margin: auto;
            text-align: justify;
            align-items: center;
        }

        .pagination {
            border-top: 1px white solid;
            font-size: 35px;
            margin: 20px;
            margin-left: 0px;
            margin-right: 0px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: white;
        }

        .heading {
            margin: 10px 0px;
            height: 180px;
            background-color: #408080;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .text {
            text-align: center;
            margin: 10px;
            font-size: 35px;
            color: #008000;
        }

        .heading-2 {
            color: black;
            display: flex;
            flex-direction: column;
            margin-right: 10px;
            margin-left: 10px;
        }

        .heading-1 {
            display: flex;
            justify-content: center;
        }

        .button {
            margin: 5px;
            background: #408080;
            color: #000000;
            width: 225px;
            height: 40px;
            font-size: 25px;
            cursor: pointer;
            text-align: center;
        }
    </style>

</head>

<body>


<div class="heading">
    <h1 class=headline>News Portal</h1>

    <div class=heading-1>
        <div class="heading-2" style="">
            <sec:authorize access="isAnonymous()">
                <form:form action="login" modelAttribute="news" method="GET">
                    <input type="submit" class="button" value="Login"/>
                </form:form> </sec:authorize>

            <sec:authorize access="hasRole('ADMIN')">
                <form:form action="toAddNewsPage" modelAttribute="news" method="GET">
                    <input type="submit" class="button" value="Create a news"/>
                </form:form>
            </sec:authorize>

            <sec:authorize access="!isAnonymous()">
                <form:form
                        action="${pageContext.request.contextPath}/logout"
                        method="post">
                    <input type="submit" class="button" value="Exit">
                </form:form>
            </sec:authorize>
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
                <div>${news.title}</div></th>
            </sec:authorize>

        </tr>

        <tr ALIGN="center">
            <td ALIGN="center"><p class="textDescription">
                <p>${news.brief}</p>

                <sec:authorize access="hasRole('ADMIN')">
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
                </sec:authorize>

                <HR WIDTH="70%" ALIGN="center" SIZE="1">
            </td>
        </tr>
    </c:forEach>
</table>

<div class="pagination" style="width: 50%; margin: 0 auto; text-align: center;">
    <c:set var="pageNumber" value="${sessionScope.currentPageNumber}"/>
    <c:choose>
        <c:when test="${pageNumber != 1}">
            <c:url var="prevLink" value="/news/start?page=${pageNumber - 1}"/>
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
            <c:url var="nextLink" value="/news/start?page=${pageNumber + 1}"/>
            <a style="color: #95af88;" href="${nextLink}">Next ></a>
        </c:when>
        <c:otherwise>
            <a class="isDisabled" href="javascript:void(0)">Next ></a>
        </c:otherwise>
    </c:choose>

</div>
</body>
</html>