<%--
  Created by IntelliJ IDEA.
  User: Trainee
  Date: 3/31/2021
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>
<html>
<head>
    <title>noSellerBook</title>
</head>
<body>
<P>
<h1>THERE IS NO BOOK FOR THIS ID:${pageContext.request.userPrincipal.name}</h1></P>
<c:url value="/sellerPortal" var="seller"></c:url>
<a href="${seller}">Seller Portal</a>
</body>
</html>
