<%--
  Created by IntelliJ IDEA.
  User: Trainee
  Date: 3/25/2021
  Time: 10:08 AM
  To change this template use File | Settings | File Templates.
--%>
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
    <title>SellerPortal</title>

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
<body style="background-image: url('https://media.istockphoto.com/photos/best-seller-picture-id687239480?s=612x612')">
<nav class="navbar navbar-expand-sm navbar-dark" data-id="web_navigation_bar">

    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXDvZebG77drmo7xDjnzR_azB8q79vNTbD5Q&usqp=CAU"
         alt="Girl in a jacket" width="70" height="70">
    <a class="navbar-brand brand-name" href>SPIDER BOOKSTALL</a>
    <div class="collapse navbar-collapse" id="web_navigation_bar_collapse">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item">
                <c:url value="/homePage" var="homePage"></c:url>
                <p style="margin-top: 20px; color: white"><a href="${homePage}" style="margin-top: 20px;color: white">HomePage</a>
                </p>
            </li>
            <li class="nav-item">
                <c:url value="/listOfBook/${pageContext.request.userPrincipal.name}" var="listOfBook"></c:url>
                <p style="margin-top: 20px; color: white"><a href="${listOfBook}" style="margin-top: 20px;color: white">BookList</a>
                </p>
            </li>
            <li class="nav-item">
                <c:url value="/addBook" var="addBook"></c:url>
                <p style="margin-top: 20px; color: white"><a href="${addBook}" style="margin-top: 20px;color: white">AddBook</a>
                </p>
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
                    <center><h3 align="center" style="float:right; margin-left: 400px;margin-top: 20px">SELLER PORTAL</h3></center>
                </div>
            </li>


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


</body>
</html>
