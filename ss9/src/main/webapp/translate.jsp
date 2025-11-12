<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 11/12/2025
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/translate">
  <input name="word" value="${word}" placeholder="input word">
    <button>Enter</button>
    <h5>Result : ${search}</h5>
</form>
</body>
</html>
