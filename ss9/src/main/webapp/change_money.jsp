<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 11/12/2025
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="/changemoney" method="post">
    <label>Rate: </label><br/>
    <input type="text" name="rate" placeholder="RATE" value="${rate}"/><br/>
    <label>USD: </label><br/>
    <input type="text" name="usd" placeholder="USD" value="${usd}"/><br/>
    <input type = "submit" id = "submit" value = "Converter"/>
    <h4>Result: ${vnd}</h4>
</form>
</body>
</html>
