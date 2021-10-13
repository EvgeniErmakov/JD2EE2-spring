<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Your News</title>
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
</div>

<HR WIDTH="70%" ALIGN="center" SIZE="1">

<table class="textNews" align="center">

    <tr ALIGN="center">
        <th class="textNews">${news.title}</th>
    </tr>

    <tr ALIGN="center">
        <td ALIGN="center"><p class="textDescription">${news.body}</p>
        </td>
    </tr>

</table>

</body>
</html>