<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 11/13/2025
  Time: 3:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<h2>Danh sách Sản Phẩm</h2>
<table class="table table-dark table-striped">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>price</th>
        <th>nsx</th>
    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getNsx()}
                <a href="/product?action=edit&id=${product.getId()}">edit</a>
                <a href="/product?action=delete&id=${product.getId()}">delete</a>
            </td>
        </tr>
    </c:forEach>

</table>
<a class="btn btn-success" href="/product?action=add">Add</a>
</body>
</html>
