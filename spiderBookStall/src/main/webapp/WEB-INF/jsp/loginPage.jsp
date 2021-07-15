<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Login Page</title>
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
</head>
<body style="background-image: url('https://images.unsplash.com/photo-1467296581482-7cc27c2500ba?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=904&q=80')">
<h1>${token}</h1>
<center><h1>${customerSaved}</h1></center>
<div id="login-box">

    <c:url value="/login" var="login"/>
    <f:form name='loginForm' action="${login}" method='post'
            style="background-image: url('https://cdn.pixabay.com/photo/2017/06/10/07/18/list-2389219_960_720.png')">
        <h2>Login</h2>

        <c:if test="${not empty error}">
            <div class="error" style="color: red">${error}</div>
        </c:if>
        <c:if test="${not empty msg}">
            <div class="msg" style="color: red">${msg}</div>
        </c:if>

        <table>
            <tr>
                <div class="row">
                    <label for="us">Email-id:</label>
                    <input type="text" name="username" autocomplete="off" id="us">
                </div>
            </tr>

            <tr>
                <div class="row">
                    <label for="ps">Password</label>
                    <input type="password" name="password" id="ps">
                </div>
            </tr>

            <tr>
                <td colspan='2'>
                    <button type="submit">Login</button>
                </td>
            </tr>

            <div align="right"><a href="Register">Create New Account</a></div>
            <div align="lift"><a href="homePage" style="margin-top:10px">Home</a></div>

        </table>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </f:form>
</div>

</body>
</html>
