<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update News</title>
</head>
<meta charset="UTF-8">
<title>Update News</title>
<style>
    .heading {
        margin: 10px 0px;
        height: 180px;
        background-color: #408080;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .reference {
        margin: 50px;
        font-size: 75px;
        font-family: serif !important;
        text-align: left;
        link: black;
        color: black;
    }
    .buttons{
        font-size: 20px;
        display: inline-block;
        background: #408080;
        color: black;
        padding: 1rem 1.5rem;
        text-decoration: none;
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

    .textDescription {
        text-indent: 75px;
        text-align: justify;
        margin: 10px;
        font-size: 28px;
        color: #000000;
    }
</style>


<body>
<div class="heading">
    <h1>
        <c:url var="showUpdateLink" value="/news/start"/>
        <a class="reference" href=${showUpdateLink}>News Portal</a>
    </h1>
</div>


<c:if test="${not empty msg}">
    <div class="alert alert-${css} alert-dismissible" role="alert" style="font-size: large">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Error!</strong> ${msg}
    </div>
</c:if>

<div class="content"
     style=" background-color: white; color: #95af88; padding: 10px 20px 20px; font-size: large; font-family: Verdana, serif"; ALIGN="center">

    <form:form style="display: inline-block; text-decoration: none;" action="${news.id}" modelAttribute="news" method="PUT">
        <form:hidden path="id"/>

        <div style="align-content: center;">
            <label for="title" style="color: grey;">Title:</label>
            <form:textarea id="title" name="title" cols="100" maxlength="300"  path="title"/>
            <form:errors path="title" cssClass="error" cssStyle="color: indianred"/>
        </div>

        <div >
            <label for="brief" style="color: grey;">Brief:</label>
            <form:textarea class="form-control" id="brief" name="brief" rows="3" cols="100"  maxlength="1000"
                           path="brief"/>
            <form:errors path="brief" cssClass="error" cssStyle="color: indianred"/>
        </div>

        <div>
            <label for="body" style="color: grey;">Body:</label>
            <form:textarea class="form-control" id="body" name="body" rows="7" cols="100" maxlength="10000"
                           path="body"/>
            <form:errors path="body" cssClass="error" cssStyle="color: indianred"/>
        </div>

        <input class="buttons" type="submit" id="submit" value="Submit"/>

        <form:form action="start" method="GET" style="display: inline-block; text-decoration: none;">
            <input type="hidden" name="page" value="${sessionScope.currentPageNumber}"/>
            <input class="buttons" type="submit" id="cancel" value="Back to main"/>
        </form:form>
    </form:form>

</div>
</body>
</html>