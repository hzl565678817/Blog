<!--查看详情-->
<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<%@ page import="com.Donitz.entity.Blog" %>
<%@ page import="com.Donitz.entity.BlogClass" %>
<%@ page import="com.Donitz.entity.UserInfo" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取所有的blogClassObj信息
    List<BlogClass> blogClassList = (List<BlogClass>)request.getAttribute("blogClassList");
    //获取所有的userObj信息
    List<UserInfo> userInfoList = (List<UserInfo>)request.getAttribute("userInfoList");
    Blog blog = (Blog)request.getAttribute("blog");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , admin-scalable=no">
  <TITLE>查看博客详情</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;">
<div class="container">


	<div class="row bottom15">
		<div class="col-md-2 col-xs-4 text-right bold">标题:</div>
		<div class="col-md-10 col-xs-6"><%=blog.getTitle()%></div>
		<div class="col-md-2 col-xs-4 text-right bold">分类:</div>
		<div class="col-md-10 col-xs-6"><%=blog.getBlogClassObj().getBlogClassName() %></div>
		<div class="col-md-2 col-xs-4 text-right bold">发布用户:</div>
		<div class="col-md-10 col-xs-6"><%=blog.getUserObj().getName() %></div>
		<div class="col-md-2 col-xs-4 text-right bold">浏览量:</div>
		<div class="col-md-10 col-xs-6"><%=blog.getHitNum()%></div>
		<div class="col-md-2 col-xs-4 text-right bold">发布时间:</div>
		<div class="col-md-10 col-xs-6"><%=blog.getAddTime()%></div>
		<div class="col-md-10 col-xs-6"><img class="img-responsive" src="<%=basePath %><%=blog.getBlogPhoto() %>" border="0px"/></div>
		<div class="col-md-10 col-xs-6"><%=blog.getContent()%></div>
	</div>


	<div class="row bottom15">
		<div class="col-md-2 col-xs-4"></div>
		<div class="col-md-6 col-xs-6">
			<button onclick="history.back();" class="btn btn-primary">返回</button>
		</div>
	</div>
</div>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script>
var basePath = "<%=basePath%>";
$(function(){
        /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
 })
 </script> 
</body>
</html>

