<%--
  Created by IntelliJ IDEA.
  User: Trainee
  Date: 3/26/2021
  Time: 5:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <title>success</title>
</head>
<body>
<h1>HEY YOUR BOOK IS ADDED TO SERVER</h1>
<a href="listOfBook/${pageContext.request.userPrincipal.name}">sellerportal</a>
</body>
</html>
