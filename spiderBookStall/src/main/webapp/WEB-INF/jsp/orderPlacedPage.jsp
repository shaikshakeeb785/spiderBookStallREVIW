<%--
  Created by IntelliJ IDEA.
  User: Trainee
  Date: 3/23/2021
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!--Custom CSS-->
    <link rel="stylesheet" href="space.css">
    <title>orderplace</title>

</head>
<style type="text/css">

    h1 {
        font-size: 30px;
        color: #fff;
        text-transform: uppercase;
        font-weight: 300;
        text-align: center;
        margin-bottom: 15px;
    }

    table {
        width: 100%;
        table-layout: fixed;
    }

    .tbl-header {
        background-color: rgba(255, 255, 255, 0.3);
    }

    .tbl-content {
        height: 300px;
        overflow-x: auto;
        margin-top: 0px;
        border: 1px solid rgba(255, 255, 255, 0.3);
    }

    th {
        padding: 20px 15px;
        text-align: left;
        font-weight: 500;
        font-size: 12px;
        color: #fff;
        text-transform: uppercase;
    }

    td {
        padding: 15px;
        text-align: left;
        vertical-align: middle;
        font-weight: 300;
        font-size: 12px;
        color: #fff;
        border-bottom: solid 1px rgba(255, 255, 255, 0.1);
    }


    /* demo styles */

    @import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
    body {
        background: -webkit-linear-gradient(left, #25c481, #25b7c4);
        background: linear-gradient(to right, #25c481, #25b7c4);
        font-family: 'Roboto', sans-serif;
    }

    section {
        margin: 50px;
    }


    /* follow me template */
    .made-with-love {
        margin-top: 40px;
        padding: 10px;
        clear: left;
        text-align: center;
        font-size: 10px;
        font-family: arial;
        color: #fff;
    }

    .made-with-love i {
        font-style: normal;
        color: #F50057;
        font-size: 14px;
        position: relative;
        top: 2px;
    }

    .made-with-love a {
        color: #fff;
        text-decoration: none;
    }

    .made-with-love a:hover {
        text-decoration: underline;
    }


    /* for custom scrollbar for webkit browser*/

    ::-webkit-scrollbar {
        width: 6px;
    }

    ::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
    }

    ::-webkit-scrollbar-thumb {
        -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
    }

    .navbar-brand {
        font-weight: bolder;
    }

    .nav-item {
        padding-left: 1rem;
    }

    .navbar {
        background-color: rgb(224, 169, 169);
    }

    .footer {
        background-color: rgb(221, 187, 187);
    }

    .form-control {
        background-color: rgb(224, 186, 186);
        border: 1px solid rgba(255, 255, 255, .5);;
        border-radius: 0;
        opacity: 1;
    }

    .form-control .form-inline {
        width: 220px;
    }


    .form-control:focus {
        color: black;
        background-color: #fff;
        border-color: #a75470;
        box-shadow: none;
    }

    .form-control::placeholder {
        color: rgba(255, 255, 255, .5);
    }

    .btn {
        color: #fff;
        background-color: #a56177;
        border-color: rgb(224, 186, 186);
        border-radius: 0;
        height: 38px;
    }

    .btn:hover, .btn:focus {
        color: #fff;
        box-shadow: 0 0 0 0.2rem #a56177;
    }

    .dropdown-menu {
        padding: 0;
        border-radius: 0;
        background-color: rgb(223, 197, 197);

    }

    .dropdown-item {
        color: rgba(255, 255, 255, .5);
    }

    .dropdown-item:hover {
        background-color: rgb(224, 186, 186);
        color: white;
    }

    .carousel-caption, h3 {
        font-weight: lighter;
    }

    .footer {
        font-size: x-small;
    }

</style>

<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }
</script>
<c:url value="/logout" var="login"/>
<form action="${login}" method="post" id="logoutForm">
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>
<body>
<nav class="navbar navbar-expand-sm navbar-dark" data-id="web_navigation_bar">

    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXDvZebG77drmo7xDjnzR_azB8q79vNTbD5Q&usqp=CAU"
         alt="Girl in a jacket" width="70" height="70">
    <a class="navbar-brand brand-name" href>SpiderBookStall</a>
    <div class="collapse navbar-collapse" id="web_navigation_bar_collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <c:url value="/homePage" var="homepage"/>
                <a href="${homepage}" style="color:white; padding:auto">HomePage</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="dropdown07XL" data-toggle="dropdown"
                   aria-expanded="false">settings</a>
                <div class="dropdown-menu" aria-labelledby="dropdown07XL">
                    <c:url value="/profile" var="profile"></c:url>
                    <a class="dropdown-item" href="${profile}">Profile</a>
                    <c:url value="/sellerPortal" var="sellerPortal"></c:url>
                    <a class="dropdown-item" href="${sellerPortal}">Seller portal</a>
                    <%--<c:url value="/logout" var="logout"></c:url>
                    <a class="dropdown-item" href="${logout}">Logout</a>--%>
                    <a class="dropdown-item" href="javascript:formSubmit()">logout</a>

                </div>
            </li>
            <c:if test="${pageContext.request.userPrincipal.name!= null}">
                <div class="px-1">
                    <div align="center" style="color: cyan">
                        <h1 style="margin-right: 500px">Hi:${customerDetail.firstName}</h1>
                    </div>
                </div>
            </c:if>
        </ul>
    </div>
</nav>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
<section>
    <!--for demo wrap-->
    <center><h1>ORDER PLACED SUCCESSFULLY</h1></center>
    <div class="tbl-header">
        <table cellpadding="0" cellspacing="0" border="0">
            <thead>
            <tr>
                <th>ORDER ID</th>
                <th>BOOK NAME</th>
                <th>BOOK PRICE</th>
                <th>Payment Option</th>
                <th>Product Id</th>
            </tr>
            </thead>
        </table>
    </div>
    <div class="tbl-content">
        <table cellpadding="0" cellspacing="0" border="0">
            <tbody>
            <tr>
                <td>${order.oderId}</td>
                <td>${bookObject1.bookName} </td>
                <td>${bookObject1.bookPrice}</td>
                <td>${order.paymentMethod}</td>
                <td>${order.productID}</td>


            </tr>
            </tbody>
        </table>
    </div>
</section>


</body>
</html>