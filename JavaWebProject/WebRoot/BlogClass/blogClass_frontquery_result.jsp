<!--博客分诶前端-->
<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<%@ page import="com.Donitz.entity.BlogClass" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<BlogClass> blogClassList = (List<BlogClass>)request.getAttribute("blogClassList");
    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , admin-scalable=no">
<title>分类</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
	<div class="row"> 
		<div class="col-md-12 wow fadeInDown" data-wow-duration="0.5s">
			<div>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
			    	<li><a href="<%=basePath %>index.jsp">首页</a></li>
			    	<li role="presentation" class="active"><a href="#blogClassListPanel" aria-controls="blogClassListPanel" role="tab" data-toggle="tab">博客分类列表</a></li>
			    	<li role="presentation" ><a href="<%=basePath %>BlogClass/blogClass_frontAdd.jsp" style="display:none;">添加博客分类</a></li>
				</ul>
			  	<!-- Tab panes -->
			  	<div class="tab-content">
				    <div role="tabpanel" class="tab-pane active" id="blogClassListPanel">
				    		<div class="row">
				    			<div class="col-md-12 top5">
				    				<div class="table-responsive">
				    				<table class="table table-condensed table-hover">
				    					<tr class="success bold" style="background-color: white;"><td>博客分类名称</td><td>博客分类介绍</td><td>操作</td></tr>
				    					<% 
				    						/*计算起始序号*/
				    	            		int startIndex = (currentPage -1) * 5;
				    	            		/*遍历记录*/
				    	            		for(int i = 0; i< blogClassList.size(); i++) {
					    	            		int currentIndex = startIndex + i + 1; //当前记录的序号
					    	            		BlogClass blogClass = blogClassList.get(i); //获取到博客分类对象
 										%>
 										<tr>

 											<td><%=blogClass.getBlogClassName() %></td>
 											<td><%=blogClass.getBlogClassDesc() %></td>
 											<td>
 												<a href="<%=basePath  %>BlogClass/<%=blogClass.getBlogClassId() %>/frontshow"></i>&nbsp;查看</a>&nbsp;
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
	<div style="display:none;">
		<div class="page-header">
    		<h1>博客分类查询</h1>
		</div>
		<form name="blogClassQueryForm" id="blogClassQueryForm" action="<%=basePath %>BlogClass/frontlist" class="mar_t15" method="post">
            <input type=hidden name=currentPage value="<%=currentPage %>" />
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
	</div>

		</div>
	</div> 
<div id="blogClassEditDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;博客分类信息编辑</h4>
      </div>
      <div class="modal-body" style="height:450px; overflow: scroll;">
      	<form class="form-horizontal" name="blogClassEditForm" id="blogClassEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="blogClass_blogClassId_edit" class="col-md-3 text-right">博客分类id:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="blogClass_blogClassId_edit" name="blogClass.blogClassId" class="form-control" placeholder="请输入博客分类id" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="blogClass_blogClassName_edit" class="col-md-3 text-right">博客分类名称:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="blogClass_blogClassName_edit" name="blogClass.blogClassName" class="form-control" placeholder="请输入博客分类名称">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="blogClass_blogClassDesc_edit" class="col-md-3 text-right">详情:</label>
		  	 <div class="col-md-9">
			    <textarea id="blogClass_blogClassDesc_edit" name="blogClass.blogClassDesc" rows="8" class="form-control" placeholder="请输入博客分类介绍"></textarea>
			 </div>
		  </div>
		</form> 
	    <style>#blogClassEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script>
var basePath = "<%=basePath%>";
/*跳转到查询结果的某页*/
function GoToPage(currentPage,totalPage) {
    if(currentPage==0) return;
    if(currentPage>totalPage) return;
    document.blogClassQueryForm.currentPage.value = currentPage;
    document.blogClassQueryForm.submit();
}

/*弹出修改博客分类界面并初始化数据*/
function blogClassEdit(blogClassId) {
	$.ajax({
		url :  basePath + "BlogClass/" + blogClassId + "/update",
		type : "get",
		dataType: "json",
		success : function (blogClass, response, status) {
			if (blogClass) {
				$("#blogClass_blogClassId_edit").val(blogClass.blogClassId);
				$("#blogClass_blogClassName_edit").val(blogClass.blogClassName);
				$("#blogClass_blogClassDesc_edit").val(blogClass.blogClassDesc);
				$('#blogClassEditDialog').modal('show');
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*删除博客分类信息*/
function blogClassDelete(blogClassId) {
	if(confirm("确认删除这个记录")) {
		$.ajax({
			type : "POST",
			url : basePath + "BlogClass/deletes",
			data : {
				blogClassIds : blogClassId,
			},
			success : function (obj) {
				if (obj.success) {
					alert("删除成功");
					$("#blogClassQueryForm").submit();
					//location.href= basePath + "BlogClass/frontlist";
				}
				else 
					alert(obj.message);
			},
		});
	}
}

/*ajax方式提交博客分类信息表单给服务器端修改*/
function ajaxBlogClassModify() {
	$.ajax({
		url :  basePath + "BlogClass/" + $("#blogClass_blogClassId_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#blogClassEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                location.href= basePath + "BlogClass/frontlist";
            }else{
                alert(obj.message);
            } 
		},
		processData: false,
		contentType: false,
	});
}

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

