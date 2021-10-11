<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Registration Page</title>
    <style>

        .reference {
            margin: 50px;
            font-size: 75px;
            font-family: serif !important;
            text-align: left;
            link: black;
            color: black;
        }

        .heading {
            margin: 10px 0px;
            height: 180px;
            background-color: #408080;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 25px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
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
        .wrapper {
            display: flex;
            flex-direction: column;
            margin: 5px;
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

<div class=form>
    <c:url value="/news/login" var="loginVar"/>
    <form action="${loginVar}" method="POST">
        <div class="wrapper">
            <input style="margin: 5px;" name="username" placeholder="Username"/>
            <input style="margin: 5px;" type="password" name="password" placeholder="Password"/>
        </div>
        <input style="background: #408080; width: 50%; font-size: 20px; text-align: center;"
               type="submit" value="Login"/>
        <sec:csrfInput/>
    </form>
</div>
</body>
</html>
