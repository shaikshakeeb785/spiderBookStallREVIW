<%--
  Created by IntelliJ IDEA.
  User: Trainee
  Date: 3/30/2021
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!--Custom CSS-->
    <link rel="stylesheet" href="space.css">

    <title>HOMEPAGE</title>
</head>
<style type="text/css">
    .navbar-brand {
        font-weight: bolder;
    }

    .nav-item {
        padding-left: 1rem;
    }
    .nav-link {
        display: block;
        padding: 1.5rem 0rem;
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

<!--Top navigation bar-->

<body>
<nav class="navbar navbar-expand-sm navbar-dark" data-id="web_navigation_bar">

    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXDvZebG77drmo7xDjnzR_azB8q79vNTbD5Q&usqp=CAU"
         alt="Girl in a jacket" width="70" height="70">
    <a class="navbar-brand brand-name" href>SpiderBookStall</a>
    <div class="collapse navbar-collapse" id="web_navigation_bar_collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <c:url value="/homePage" var="homePage"></c:url>
                <a class="nav-link" href="${homePage}">homePage</a>
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
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <div class="px-1">
                    <div align="center" style="color: cyan; flex: 20px">
                        <h5 style="margin-top: 20px;margin-left: 30px">Hi ${customerDetail.firstName}</h5>
                    </div>
                </div>
            </c:if>
            <li>
                <div align="center">
                    <center><h4 align="center" style="float:right; margin-left: 500px;margin-top: 20px">LIST OF SELLER BOOK</h4></center>
                </div>
            </li>
        </ul>

    </div>


</nav>
<h1>${token}</h1>
<c:forEach var="object" items="${sellerBook}">
    <div class="container" style="background-image: url('https://wallpapercave.com/wp/g0c4dxk.jpg');width: 280px">

        <table style="collapse: 2">
            <tr>
                <td><p>BOOK_ID:</p></td>
                <td>${object.bookId}</td>
            </tr>
            <tr>
                <td><P>BookName:</P></td>
                <td>${object.bookName}</td>
            </tr>
            <tr>
                <td><P>BookAuther:</P></td>
                <td>${object.bookAuthor}</td>
            </tr>
            <tr>
                <td><P>BookPrice:</P></td>
                <td>${object.bookPrice}</td>
            </tr>
            <tr>
                <td>
                    <c:url value="/deleteSellerBook/${object.bookId}" var="delete"></c:url>
                    <p><a href="${delete}">DELETE</a></p>
                </td>
            </tr>
            <tr>
                <td>
                    <c:url value="/updateSellerBook/${object.bookId}"  var="update"></c:url>
                    <p><a href="${update}">UPDATE</a></p>

                </td>
            </tr>
            <hr>
        </table>

    </div>
</c:forEach>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>
</html>
