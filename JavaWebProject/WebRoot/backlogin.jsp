<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<footer>
    <a href="<%=basePath%>login.jsp">超级管理员后台登陆</a>
</footer>


 


 