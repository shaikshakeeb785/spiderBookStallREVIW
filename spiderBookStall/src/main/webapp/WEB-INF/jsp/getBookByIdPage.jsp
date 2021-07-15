<%--
  Created by IntelliJ IDEA.
  User: Trainee
  Date: 3/20/2021
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!--Custom CSS-->
    <link rel="stylesheet" href="space.css">
    <title>getBookById</title>

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
<body style="background-image: url('https://i.pinimg.com/originals/88/45/35/8845352059b3f6df722fb0d6a5320f26.jpg')">
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
            <li>
                <div align="center">
                    <center><h1 align="center" style="float:right; margin-left: 200px">PDP:PRODUCT DETAIL PAGE</h1>
                    </center>
                </div>
            </li>
        </ul>
    </div>
</nav>
<center>
    <hr>
    <table border="2" width="70%" cellpadding="2"
           style="background-image: url('https://images.unsplash.com/photo-1589447388175-ac47d31be950?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80')">
        <center><h1>${notFound}</h1></center>

        <tr>
            <th>BOOKID</th>
            <th>BOOK_NAME</th>
            <th>BOOK_AUTHOR</th>
            <th>BOOK_PRICE</th>
            <th>BUY_BOOK</th>
        </tr>
        <tr>
            <td>
                <%--heare i am passing bookid by using queryString and accessing in controller by using @RequestParam--%>
                <a href="getBookById?bookId=${bookObject1.bookId}">${bookObject1.bookId}</a>
            </td>
            <td>
                <%--hear i am passing bookid by using queryString and accessing in controller by using @RequestParam--%>
                <a href="getBookById?bookId=${bookObject1.bookId}">${bookObject1.bookName}</a>
            </td>
            <td>${bookObject1.bookAuthor}</td>
            <td>${bookObject1.bookPrice}</td>
            <td>
                <%--hear iam passing book id by buy uri directly and accessing in controller by using @PathVareable--%>
                <c:url value="/buyBook" var="Buy"/>
                <a href="http://localhost:8080/spiderBookStall_war_exploded/buyBook/${bookObject1.bookId}">BUY</a>
            </td>
        </tr>

    </table>
</center>
<br/>

</body>
</html>
