<%--
  Created by IntelliJ IDEA.
  User: Trainee
  Date: 3/17/2021
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>addBook</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

    body {
        font-family: 'Open Sans', sans-serif;
        background: #f9faff;
        color: #3a3c47;
        line-height: 1.6;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 0;
        padding: 0;
    }

    h1 {
        margin-top: 48px;
    }

    form {
        background: #fff;
        max-width: 360px;
        width: 100%;
        padding: 58px 44px;
        border: 1px solid #e1e2f0;
        border-radius: 4px;
        box-shadow: 0 0 5px 0 rgba(42, 45, 48, 0.12);
        transition: all 0.3s ease;
    }

    .row {
        display: flex;
        flex-direction: column;
        margin-bottom: 20px;
    }

    .row label {
        font-size: 13px;
        color: #8086a9;
    }

    .row input {
        flex: 1;
        padding: 13px;
        border: 1px solid #d6d8e6;
        border-radius: 4px;
        font-size: 16px;
        transition: all 0.2s ease-out;
    }

    .row input:focus {
        outline: none;
        box-shadow: inset 2px 2px 5px 0 rgba(42, 45, 48, 0.12);
    }

    .row input::placeholder {
        color: #C8CDDF;
    }

    button {
        width: 100%;
        padding: 12px;
        font-size: 18px;
        background: #15C39A;
        color: #fff;
        border: none;
        border-radius: 100px;
        cursor: pointer;
        font-family: 'Open Sans', sans-serif;
        margin-top: 15px;
        transition: background 0.2s ease-out;
    }

    button:hover {
        background: #55D3AC;
    }

    @media (max-width: 458px) {

        body {
            margin: 0 18px;
        }

        form {
            background: #f9faff;
            border: none;
            box-shadow: none;
            padding: 20px 0;
        }

    }
</style>
<style type="text/css">
    .error {
        color: red;
        position: fixed;
        text-align: left;
        margin-left: 30px;
    }
</style>
<body>

<center><h1>CUSTOMER BOOK</h1></center>
<div align="center">
    <c:url value="/updatedClientBook" var="updateclient"></c:url>
    <f:form action="${updateclient}" method="post" modelAttribute="bookObject">
        <f:hidden path="bookId"/>
        <f:errors path="bookId" cssClass="error"/>
        <f:label path="bookName">BOOK_NAME:</f:label>
        <f:input path="bookName"/>
        <f:errors path="bookName" cssClass="error"/>
        <br>
        <f:label path="bookAuthor">BOOK_AUTHOR::</f:label>
        <f:input path="bookAuthor"/>
        <f:errors path="bookAuthor" cssClass="error"/>
        <br>
        <f:label path="bookPrice">BOOK_PRICE:</f:label>
        <f:input path="bookPrice"/>
        <f:errors path="bookPrice" cssClass="error"/>
        <br>
        <f:label path="bookPublishDate">BOOK_PUBLISH_DATE:</f:label>
        <f:input type="date" path="bookPublishDate"/>
        <f:errors path="bookPublishDate" cssClass="error"/>
        <br>

        <f:hidden path="sellerName"/>
        <f:errors path="sellerName" cssClass="error"/>

        <br>
        <f:label path="publication">PUBLICATION:</f:label>
        <f:input path="publication"/>
        <f:errors path="publication" cssClass="error"/>
        <br>
        <f:button value="submit">Submit</f:button>
    </f:form>
</div>
</body>
</html>
