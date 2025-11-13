<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 11/13/2025
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/calcutor" method="post">
  <input name="firstOperand" value="${first}" placeholder="input number"><br>
  <select id="operator" name="operator">
    <option value="add">Addition</option>
    <option value="sub">Subtraction</option>
    <option value="mul">Multiplication</option>
    <option value="div">Division</option>
  </select><br>
  <input name="secondOperand" value="${second}" placeholder="input number">
  <button>Enter</button>
  <h4>Kết quả : ${result} ${text}</h4>
</form>
</body>
</html>
