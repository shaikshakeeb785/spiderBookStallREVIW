<%--
  Created by IntelliJ IDEA.
  User: Trainee
  Date: 3/22/2021
  Time: 5:49 PM
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
    <title>profile</title>

</head>
<style type="text/css">

</style>
<style type="text/css">
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        /* background-color: #EA9684; */
        font-family: Arial, Helvetica, sans-serif;
        background: rgb(255, 154, 158);
        background: linear-gradient(13deg, rgba(255, 154, 158, 1) 0%, rgba(250, 208, 196, 1) 100%);
    }

    main {
        width: 340px;
        overflow: hidden;
        background-color: #f1f1f1;
        font-size: 16px;
        line-height: 22px;
        color: #000;
        border-radius: 7px;
        box-shadow: -5px -5px 25px rgba(0, 0, 0, 0.705);
        margin: 50px auto;

        animation-name: rotate;
        animation-duration: 1.5s;
        animation-fill-mode: both;
    }

    .top-card {
        width: 100%;
        /* height: 200px; */
    }

    .top-card img {
        width: 100%;
    }

    .top-card .menu-icon {
        position: relative;
        width: 22px;
        bottom: 13.7em;
        left: 1.1em;
        cursor: pointer;
    }

    .top-card .menu-icon .menu {
        position: relative;
        display: block;
        width: 100%;
        height: 4px;
        background-color: #000;
        margin-bottom: 6px;
        opacity: .5;
        transition: .4s;
    }

    .top-card .menu-icon .item1 {
        left: -5px;
    }

    .top-card .menu-icon .item2 {
        left: 5px;
    }

    .top-card .menu-icon:hover .menu {
        left: 0;
        border-radius: 1px;
    }

    .top-card .name {
        width: 50%;
        height: 0;
        text-align: center;
        float: right;
    }

    .top-card .name p {
        position: relative;
        font-size: 50px;
        font-weight: 800;
        color: #000;
        opacity: .5;
        bottom: 140px;
        line-height: 50px;
        text-align: center;
    }

    .top-card .name span {
        font-weight: 600;
        text-align: center;
        text-transform: uppercase;
    }

    h1 {
        font-size: 20px;
        color: #000;
        font-weight: 600;
        margin: 12px 0;
        border-bottom: 4px solid rgba(1, 106, 175, 0.603);
        width: 10%;
    }

    .middle-card, footer {
        margin: 5px 25px;
    }

    .middle-card {
        text-align: justify;
    }

    footer {
        text-align: center;
    }

    footer .social-icon {
        /* padding: 7%; */
        font-size: 20px;
        margin: 0 5%;
        color: rgba(0, 0, 0, .9);
    }

    .facebook:hover {
        color: #3b5999;
    }

    .twitter:hover {
        color: #55acee;
    }

    .google:hover {
        color: #dd4b39;
    }

    .github:hover {
        color: #302f2f;
    }

    .linkedin:hover {
        color: #0077B5;
    }

    footer .links {
        border-top: 2px solid rgba(0, 0, 0, .1);
        text-align: center;
        margin-top: 10px;
        padding: 8px 0;
    }

    footer .links address {
        font-size: 15px;
    }

    footer .links a {
        text-decoration: none;
        font-weight: 600;
        color: rgba(0, 0, 0, .9);
    }


    /* ANIMATION */
    @keyframes rotate {
        0% {
            transform-origin: left bottom;
            transform: rotate3d(0, 0, 1, 45deg);
            opacity: 0;
        }
        100% {
            transform-origin: left bottom;
            transform: none;
            opacity: 1;
        }
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
        </ul>
    </div>
    <%--this logic is used to hide the register and login link from home page After success full loged in by customer--%>

    <c:if test="${pageContext.request.userPrincipal.name!= null}">
        <div class="px-1">
            <div align="center" style="color: cyan">
                <h1 style="margin-right: 100px">Hi:${customerDetail.firstName}</h1>
            </div>
        </div>
    </c:if>
</nav>
<center><h1>Profile Page:</h1></center>
<center>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=divice-width, initial-scale=1.0">
        <title>Responsive Profile Card UI</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
              integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/app.css" type="text/css">
    </head>
    <center><h1>${error}</h1></center>
    <main>
        <section class="top-card">
            <img src="https://raw.githubusercontent.com/Jean-carje/Profile-card-Practice/master/Profile-card/img/user.jpg"
                 alt="user picture">
            <div class="menu-icon">
                <div class="menu item1"></div>
                <div class="menu item2"></div>
            </div>
            <div class="name">
                <p>Irene <span>Doe</span></p>
            </div>
        </section>

        <section class="middle-card">
            <table>

                <tr>
                    <td>FirstName:</td>
                    <td>${customerDetail1.firstName}</td>
                </tr>
                <tr>
                    <td>LastName:</td>
                    <td>${customerDetail1.lastName}</td>
                </tr>
                <tr>
                    <td>email:</td>
                    <td>${customerDetail1.email}</td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>${customerDetail1.password}</td>
                </tr>
                <tr>
                    <td>Re-Password</td>
                    <td>${customerDetail1.rePassword}</td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td${customerDetail1.contact}></td>
                </tr>
                <tr>
                    <td>dob:</td>
                    <td>${customerDetail1.dob}</td>
                </tr>
                <tr>
                    <td>AddressLine1:</td>
                    <td>${customerDetail1.addressLine1}</td>
                </tr>
                <tr>
                    <td>AddressLine2:</td>
                    <td>${customerDetail1.addressLine2}</td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td>${customerDetail1.city}</td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td>${customerDetail1.state}</td>
                </tr>
                <tr>
                    <td>pinCode:</td>
                    <td>${customerDetail1.pinCode}</td>
                </tr>
                    <center><a href="editCustomer">Update Profile</a></center>
            </table>
        </section>

    </main>


</center>
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