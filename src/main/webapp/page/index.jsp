<%--
  Created by IntelliJ IDEA.
  User: carols
  Date: 2017/5/26
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>欢迎界面</title>
</head>
<body>
请选择你的姓名：
<form action="login" method="post">
    <select name="userName">
        <c:forEach items="${sessionScope.userList}" var="user">
            <option value="${user.id}">${user.userName}</option>
        </c:forEach>
    </select>
    <input type="submit" value="登录">
</form>
</body>
</html>
