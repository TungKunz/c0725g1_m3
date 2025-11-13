<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 11/13/2025
  Time: 4:26 PM
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
<form action="/product?action=edit" method="post">
    <input name="id" value="${product.id}" placeholder="Enter id"><br>
    <input name="name"  value="${product.name}" placeholder="Enter name"><br>
    <input name="price" value="${product.price}" placeholder="Enter price"><br>
    <input  name="nsx" value="${product.nsx}" placeholder="Enter address"><br>
    <button>Save</button>
</form>
</body>
</html>
