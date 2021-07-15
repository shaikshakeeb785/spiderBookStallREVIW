<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<jsp:include page="header.jsp"></jsp:include>
<center><h3>Cart Page</h3></center>
<center>
    <table cellpadding="2" cellspacing="2" border="1">
        <tr>
            <th>Option</th>
            <th>Id</th>
            <th>Name</th>
            <th>Photo</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Sub Total</th>
        </tr>
        <c:set var="total" value="0"></c:set>
        <c:forEach var="object" items="${lstOfBook}">
            <c:set var="total"
                   value="${total + object.bookPrice * 1 }"></c:set>
            <tr>

                <td align="center"><a
                        href="delete/${object.bookId }"
                        onclick="return confirm('Are you sure?')">Remove</a></td>

                <td>${object.bookId }</td>
                <td>${object.bookName }</td>
                <td><img
                        src="https://lh3.googleusercontent.com/proxy/jo5-VKpsxUxJ5-25qYN4k2-QZtWtsqfbkS4Hg7eYoOB3c2i5LKzns49uK526ftgx1ozYffN06Ik1mPZa4-WnBD-yI3e2Lv8"
                        width="50"></td>
                <td>${object.bookPrice }</td>
                <td>${1}</td>
                <td>${object.bookPrice * 1 }</td>
            </tr>
        </c:forEach>
        <tr>
            <c:if test="${total!=0}">
                <td align="center" colspan="3"><a
                        href="orderPlaced/${total}"
                        onclick="return confirm('Are you sure?')">PlaceOrder</a></td>
            </c:if>
            <c:if test="${total==0}">
                <td colspan="3"><h5 style="color: red">No Items are Added</h5></td>
            </c:if>
            <td colspan="3" align="right">Sum</td>
            <td>${total }</td>
        </tr>
    </table>
</center>
<br>
<center><a href="homePage">ContinueShopping</a></center>
</body>
</html>