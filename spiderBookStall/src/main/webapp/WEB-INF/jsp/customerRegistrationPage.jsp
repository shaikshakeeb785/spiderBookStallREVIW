<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

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
<div align="center">
    <h1>CUSTOMER REGISTRATION FORM</h1>
    <f:form action="saveRegister" method="post" modelAttribute="registerObject">
        <f:label path="firstName">FIRST NAME*:</f:label>
        <f:input path="firstName"/>
        <f:errors path="firstName" cssClass="error"/>
        <br>

        <f:label path="lastName">LAST NAME:</f:label>
        <f:input path="lastName"/>
        <f:errors path="lastName" cssClass="error"/>
        <br>

        <f:label path="email">EMAIL*:</f:label>
        <f:input path="email"/>
        <f:errors path="email" cssClass="error"/>
        <br>

        <f:label path="password">PASSWORD*:</f:label>
        <f:input path="password" type="password"/>
        <f:errors path="password" cssClass="error"/>
        <br>

        <f:label path="rePassword">RE-PASSWORD*:</f:label>
        <f:input path="rePassword" type="password"/>
        <f:errors path="rePassword" cssClass="error"/>
        <br>
        <f:label path="contact">CONTACT*:</f:label>
        <f:input path="contact"/>
        <f:errors path="contact" cssClass="error"/>
        <br>

        <f:label path="dob">DOB*:</f:label>
        <f:input path="dob" type="date"/>
        <f:errors path="dob" cssClass="error"/>
        <br>

        <f:label path="addressLine1">AddressLine1*:</f:label>
        <f:textarea path="addressLine1" type=""/>
        <f:errors path="addressLine1" cssClass="error"/>
        <br>

        <f:label path="addressLine2">AddressLine2</f:label>
        <f:textarea path="addressLine2"/>
        <f:errors path="addressLine2" cssClass="error"/>
        <br>

        <f:label path="city">CITY*:</f:label>
        <f:input path="city"/>
        <f:errors path="city" cssClass="error"/>
        <br>

        <f:label path="state">STATE*:</f:label>
        <f:input path="state"/>
        <f:errors path="state" cssClass="error"/>
        <br>

        <f:label path="pinCode">pinCode*:</f:label>
        <f:input path="pinCode"/>
        <f:errors path="pinCode" cssClass="error"></f:errors>
        <br>

        <f:button type="submit">SUBMIT</f:button>
    </f:form>
    <c:url value="/homePage" var="home"></c:url>
    <a href="${home}">home</a>
</div>