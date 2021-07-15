<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!Doctype html>
<html lang="en">

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
                <a class="nav-link" href="contact">About/contact us </a>
            </li>
            <c:if test="${pageContext.request.userPrincipal.name !=null}">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown07XL" data-toggle="dropdown"
                       aria-expanded="false">settings</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown07XL">
                        <a class="dropdown-item" href="profile">Profile</a>
                        <a class="dropdown-item" href="sellerPortal">Seller portal</a>
                        <%--<a class="dropdown-item" href="logout">Logout</a>--%>
                        <a class="dropdown-item" href="javascript:formSubmit()">logout</a>
                        <a class="dropdown-item" href="getAllCartBook">Cart</a>

                    </div>
                </li>
            </c:if>
        </ul>

    </div>
    <%--this logic is used to hide the register and login link from home page After success full loged in by customer--%>
    <c:if test="${pageContext.request.userPrincipal.name == null}">
        <div class="px-1">
            <a href="login" style="color: white">Login/</a>
            <a href="Register" style="color: white">Register</a>

        </div>
    </c:if>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <div class="px-1">
            <div align="center" style="color: cyan">
                <h1>Hi  ${customerDetail.firstName}</h1>

            </div>
        </div>
    </c:if>
</nav>

<!--Slideshow-->
<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://images.unsplash.com/photo-1613305159023-3edb825a998a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=889&q=80"
                 class=" w-100 " alt="Error loading image">
            <div class="carousel-caption d-none d-md-block">
                <h3>We design your dream space into a reality!</h3>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://images.unsplash.com/photo-1509057199576-632a47484ece?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=751&q=80"
                 class="d-block w-100" alt="Error loading image">
            <div class="carousel-caption d-none d-md-block">
                <h3>Elegance & luxurious appeal with highest quality of materiel!</h3>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://images.unsplash.com/photo-1518373714866-3f1478910cc0?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80"
                 class="d-block w-100" alt="Error loading image">
            <div class="carousel-caption d-none d-md-block">
                <h3>Collaboration with most trustful manufacturers!</h3>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!--Footer-->
<footer class="footer py-1 text-sm-center" data-id="web_footer">
    <div class="text-white"> &copy; 2020 Jayamini Heshani. All Rights Reserved.</div>
</footer>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
<br>
<hr>
<center><h1>Product List page: (PLP)</h1></center>
<center><h3>${book}</h3></center>
<center>
    <c:forEach var="object" items="${restObject}">
        <div class="container" style="background-image: url('https://wallpapercave.com/wp/g0c4dxk.jpg');width: 300px">
                <%--heare i am passing bookid by using queryString and accessing in controller by using @RequestParam--%>
            <p>BOOK_ID:</p><a href="getBookById?bookId=${object.bookId}">${object.bookId}</a>
                <%--hear i am passing bookid by using queryString and accessing in controller by using @RequestParam--%>
            <P>BookName:</P><a href="getBookById?bookId=${object.bookId}">${object.bookName}</a>
            <P>BookAuther:</P>${object.bookAuthor}
            <P>BookPrice:</P>${object.bookPrice}
                <%--hear iam passing bookId and accessing in controller by using @PathVareable--%>
            <c:url value="/buyBook/${object.bookId}" var="Buy"/>
            <P>BUY BOOK:</P><a href="${Buy}">BUY</a>
                    <%--<c:url value="AddProductToCart?${object.bookId}" var="AddProductToCart"/>
                    <P>BUY BOOK:</P><a href="${AddProductToCart}">AddToCart</a>--%>
                    <P>BookName:</P><a href="index?bookId=${object.bookId}">AddToCart</a>
                    <hr>
        </div>
    </c:forEach>
</center>
<br/>
<center><c:url value="/homePage" var="homepage"/>
    <td><a href="${homepage}" style="color: white">HomePage</a></td>
</center>
</body>

</html>