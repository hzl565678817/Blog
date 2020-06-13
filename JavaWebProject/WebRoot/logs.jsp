<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Rose
  Date: 2020/6/13
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>日志查看</title>
</head>
<body>
<table class="table_solid" border="1"  width="500" cellpadding="3" cellspacing="1" id="logs">
    <tr>
        <th width="">序号</th>
        <th>用户名</th>
        <th>操作时间</th>
        <th>操作行为</th>
    </tr>
    <c:if test="${not empty logs}">
        <c:forEach items="${logs}" var="item" varStatus="status">
            <tr id="list" bgcolor="#a9a9a9">
                <td align="center">${status.count}</td>
                <td align="center">${item.username}</td>
                <td align="center">${item.time}</td>
                <td align="center">${item.dowhat}</td>
            </tr>
        </c:forEach>
    </c:if>
</table>


</body>
</html>
