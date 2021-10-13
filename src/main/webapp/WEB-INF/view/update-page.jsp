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
    <%@include file='/./resources/css/style.css' %>
</style>
<body>
<div class="heading">
    <h1>
        <c:url var="showUpdateLink" value="/news/start"/>
        <a class="reference" href=${showUpdateLink}>News Portal</a>
    </h1>
</div>


<c:if test="${not empty msg}">
    <div class="alert alert-${css} alert-dismissible" role="alert" style="font-size: large; font-size: 25px; color: red" ALIGN="center">
        <strong>Error!</strong> ${msg}
        <HR WIDTH="40%" ALIGN="center" SIZE="1">
    </div>
</c:if>

<div class="content"
     style=" background-color: white; color: #95af88; padding: 10px 20px 20px; font-size: large; font-family: Verdana, serif"; ALIGN="center">

    <form:form style="display: inline-block; text-decoration: none;" action="${news.id}" modelAttribute="news" method="PUT">
        <form:hidden path="id"/>

        <div style="align-content: center;">
            <form:errors path="title" cssClass="error" cssStyle="color: indianred"/><br>
            <label for="title" style="color: black;">Title:</label>
            <form:textarea id="title" name="title" cols="100" maxlength="200"  path="title"/>
        </div>

        <div >
            <form:errors path="brief" cssClass="error" cssStyle="color: indianred"/><br>
            <label for="brief" style="color: black;">Brief:</label>
            <form:textarea class="form-control" id="brief" name="brief" rows="10" cols="100"  maxlength="1000"
                           path="brief"/>
        </div>

        <div>
            <form:errors path="body" cssClass="error" cssStyle="color: indianred"/><br>
            <label for="body" style="color: black;">Body:</label>
            <form:textarea class="form-control" id="body" name="body" rows="20" cols="100" maxlength="10000"
                           path="body"/>
        </div>

        <input class="buttons" type="submit" id="submit" value="Submit"/>
    </form:form>

</div>
</body>
</html>