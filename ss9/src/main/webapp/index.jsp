<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 11/12/2025
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <form method="post" action="/discount">
        <input name="productDescription" value="${productDescription}" placeholder="nhập mô tả sản phẩm">
        <input name="listPrice" value="${listPrice}" placeholder="giá niêm yết của sản phẩm">
        <input name="discountPercent" value="${discountPercent}" placeholder="tỉ lệ chiết khấu">
        <button>Enter</button>
        <h4>Kết quả: ${discountAmount}</h4>
    </form>
</div>
</body>
</html>
