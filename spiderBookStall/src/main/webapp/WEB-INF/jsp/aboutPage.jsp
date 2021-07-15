<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    .nav-link {
        display: block;
        padding: 1.5rem 0rem;
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
                <p style="margin-top: 20px; color: white"><a href="homePage" style="margin-top: 20px;color: white">HomePage</a>
                </p>
            </li>
            <c:if test="${pageContext.request.userPrincipal.name !=null}">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown07XL" data-toggle="dropdown"
                       aria-expanded="false">settings</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown07XL">
                        <c:url value="/profile/${pageContext.request.userPrincipal.name}" var="profile"></c:url>
                        <a class="dropdown-item" href="${profile}">Profile</a>
                        <c:url value="/sellerPortal" var="sellerPortal"></c:url>
                        <a class="dropdown-item" href="${sellerPortal}">Seller portal</a>
                        <%--<c:url value="/logout" var="logout"></c:url>
                        <a class="dropdown-item" href="${logout}">Logout</a>--%>
                        <a class="dropdown-item" href="javascript:formSubmit()">logout</a>
                    </div>
                </li>
            </c:if>
            <li>
                <div align="center">
                    <center><h3 align="center" style="float:right; margin-left:800px">AboutUs Page</h3></center>
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
<div class="container-fluid">
    <div class="col-sm-12 col-md-12 col-lg-12">
        <hr>
        <p>
        <div align="center"><b>WELCOME TO THE UPDATED Spider Book Stall</b></div>
        <p>TheBookShopOnline.com is India’s 1st exclusive online marketplace for specialized in professional & technical
            books. It’s a subsidiary of The BookShop, Dr. Mukherjee Nagar, Delhi-110009

            TheBookShopOnline.com was established in 2016 & we have the best process & practices in place to serve our
            customers.</p><br>

        <p>The books sold on TheBookShopOnline.com are 100% original, no counterfeit/duplicate books. For this we have
            an anti-piracy process in place, each and every book passes through a Piracy test before getting it uploaded
            on TheBookShopOnline.com & dispatching it to our customer(s).

            Protecting customer personal information: We have a strict Privacy policy & ISO 27001:2013 certification
            which specifies the requirements for establishing, implementing, maintaining, and continually improving an
            information security management system within the context of the organization. It also includes requirements
            for the assessment and treatment of information security risks tailored to the needs of the organization.

            Our server is located in India
        <p><br>

        <p>TheBookShopOnline.com offers a range of professional books in the fields of Taxation, Accounting, Legal,
            Medical, Engineering and Academic Books from renowned publishers in the industry.

            A mission to make sure the availability of professional & technical books across cities, villages in India &
            other parts of the world.

            We have evolved with time and our dedicated team strives to continuously provide the best of services and
            support to professionals, through best-in-class technology, sales, support, and logistics. Every book you
            purchased from TheBookShopOnline.com it contributes to making this social business success.

            Clearly, we can’t do this work without your support. That's why we’re so passionate about trying to offer
            the best price, selection, customer service, and overall shopping experience.

            Thanks for joining us in our mission to create a better & sustainable social business.

            Happy Shopping!
        <p><br>


        <p>If you cannot find the book you are looking for on our website, please send us an email at
            info@thebookshoponline.com</p></p>

        <table>
            <tr>
                <td>Spider Book Stall Helpline Number:</td>
                <td>+91-44-24961920, 24960156 registered office</td>
            </tr>
            <tr>
                <td> Spider Book Stall Customer Support Email:</td>
                <td>spiderBookStall@gmail.com</td>
            </tr>
            <tr>
                <td>Facebook Page:</td>
                <td>spiderBookStall</td>
            </tr>
            <tr>
                <td>Official Website:</td>
                <td><a href="http://localhost:8080/spiderBookStall_war_exploded/homePage">WWW.spiderBookStall.com</a>
                </td>
            </tr>
        </table>

    </div>
</div>
</body>
</html>

<center><h1>WELCOME AGAIN</h1></center>



