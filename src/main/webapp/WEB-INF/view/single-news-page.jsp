<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Your News</title>
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