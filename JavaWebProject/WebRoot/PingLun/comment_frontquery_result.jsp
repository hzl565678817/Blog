<!--首页显示显示-->
<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<%@ page import="com.Donitz.entity.PingLun" %>
<%@ page import="com.Donitz.entity.Blog" %>
<%@ page import="com.Donitz.entity.UserInfo" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<PingLun> pingLunList = (List<PingLun>)request.getAttribute("pingLunList");
    //获取所有的blogObj信息
    List<Blog> blogList = (List<Blog>)request.getAttribute("blogList");
    //获取所有的userObj信息
    List<UserInfo> userInfoList = (List<UserInfo>)request.getAttribute("userInfoList");
    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
    Blog blogObj = (Blog)request.getAttribute("blogObj");
    UserInfo userObj = (UserInfo)request.getAttribute("userObj");
    String commentTime = (String)request.getAttribute("commentTime"); //评论时间查询关键字
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , admin-scalable=no">
<title>博客评论</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
	<a href="<%=basePath %>index.jsp">首页</a>
	<div class="row"> 
		<div class="col-md-9 wow fadeInDown" data-wow-duration="0.5s">
			<div>
			  	<!-- Tab panes -->
			  	<div class="tab-content">
				    <div role="tabpanel" class="tab-pane active" id="commentListPanel">
				    		<div class="row">
				    			<div class="col-md-12 top5">
				    				<div class="table-responsive">
				    				<table class="table table-condensed table-hover">
				    					<tr class="success bold" style="background-color: white;"><td>序号</td><td>回复id</td><td>被评博客</td><td>评论内容</td><td>评论人</td><td>评论时间</td><td>操作</td></tr>
				    					<% 
				    						/*计算起始序号*/
				    	            		int startIndex = (currentPage -1) * 5;
				    	            		/*遍历记录*/
				    	            		for(int i = 0; i< pingLunList.size(); i++) {
					    	            		int currentIndex = startIndex + i + 1; //当前记录的序号
					    	            		PingLun pingLun = pingLunList.get(i); //获取到博客评论对象
 										%>
 										<tr>
 											<td><%=currentIndex %></td>
 											<td><%=pingLun.getCommentId() %></td>
 											<td><%=pingLun.getBlogObj().getTitle() %></td>
 											<td><%=pingLun.getContent() %></td>
 											<td><%=pingLun.getUserObj().getName() %></td>
 											<td><%=pingLun.getCommentTime() %></td>
 											<td>
 												<a href="<%=basePath  %>Comment/<%=pingLun.getCommentId() %>/frontshow"><i class="fa fa-info"></i>&nbsp;查看</a>&nbsp;
 												<a href="#" onclick="commentEdit('<%=pingLun.getCommentId() %>');" style="display:none;"><i class="fa fa-pencil fa-fw"></i>编辑</a>&nbsp;
 												<a href="#" onclick="commentDelete('<%=pingLun.getCommentId() %>');" style="display:none;"><i class="fa fa-trash-o fa-fw"></i>删除</a>
 											</td> 
 										</tr>
 										<%}%>
				    				</table>
				    				</div>
				    			</div>
				    		</div>

				    		<div class="row">
					            <div class="col-md-12">
						            <nav class="pull-left">
						                <ul class="pagination">
						                    <li><a href="#" onclick="GoToPage(<%=currentPage-1 %>,<%=totalPage %>);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						                     <%
						                    	int startPage = currentPage - 5;
						                    	int endPage = currentPage + 5;
						                    	if(startPage < 1) startPage=1;
						                    	if(endPage > totalPage) endPage = totalPage;
						                    	for(int i=startPage;i<=endPage;i++) {
						                    %>
						                    <li class="<%= currentPage==i?"active":"" %>"><a href="#"  onclick="GoToPage(<%=i %>,<%=totalPage %>);"><%=i %></a></li>
						                    <%  } %> 
						                    <li><a href="#" onclick="GoToPage(<%=currentPage+1 %>,<%=totalPage %>);"><span aria-hidden="true">&raquo;</span></a></li>
						                </ul>
						            </nav>
								</div>
				            </div> 
				    </div>
				</div>
			</div>
		</div>
		</div>
	</div>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
</body>
</html>

