<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <div class="alert alert-${css} alert-dismissible" role="alert" style="font-size: large; font-size: 25px; color: red" ALIGN="center">
        <strong>Error!</strong> ${msg}
        <HR WIDTH="40%" ALIGN="center" SIZE="1">
    </div>
</c:if>

<div class="content"
     style=" background-color: white; color: #95af88; padding: 10px 20px 20px; font-size: large; font-family: Verdana, serif"; ALIGN="center">

    <form:form style="display: inline-block; text-decoration: none;" action="addNews"  modelAttribute="news" method="POST">

        <form:hidden path="id"/>

        <div style="align-content: center;">
            <form:errors path="title" cssClass="error" cssStyle="color: indianred"/><br>
            <label for="title" style="color: black;">Title:</label>
            <form:textarea id="title" name="title" cols="90" maxlength="300"  path="title"/>
        </div>

        <div >
            <form:errors path="brief" cssClass="error" cssStyle="color: indianred"/><br>
            <label for="brief" style="color: black;">Brief:</label>
            <form:textarea class="form-control" id="brief" name="brief" rows="10" cols="90"  maxlength="1000"
                           path="brief"/>
        </div>

        <div>
            <form:errors path="body" cssClass="error" cssStyle="color: indianred"/><br>
            <label for="body" style="color: black;">Body:</label>
            <form:textarea class="form-control" id="body" name="body" rows="20" cols="90" maxlength="10000"
                           path="body"/>
        </div>

        <input class="buttons" type="submit" value="Submit"/>
    </form:form>

</div>
</body>
</html>