<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../logstate.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pingLun.css" />

<div id="comment_manage"></div>
<div id="comment_manage_tool" style="padding:5px;">
	<div style="margin-bottom:5px;">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit-new" plain="true" onclick="comment_manage_tool.edit();">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-delete-new" plain="true" onclick="comment_manage_tool.remove();">删除</a>

	</div>
	<div style="padding:0 0 0 7px;color:#333;">
		<form id="commentQueryForm" method="post">
			博客：<input class="textbox" type="text" id="blogObj_blogId_query" name="blogObj.blogId" style="width: auto"/>
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="comment_manage_tool.search();">查询</a>
		</form>	
	</div>
</div>

<div id="commentEditDiv">
	<form id="commentEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">回复id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="comment_commentId_edit" name="pingLun.commentId" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">被评博客:</span>
			<span class="inputControl">
				<input class="textbox"  id="comment_blogObj_blogId_edit" name="pingLun.blogObj.blogId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">评论内容:</span>
			<span class="inputControl">
				<textarea id="comment_content_edit" name="pingLun.content" rows="8" cols="60"></textarea>

			</span>

		</div>
		<div>
			<span class="label">评论人:</span>
			<span class="inputControl">
				<input class="textbox"  id="comment_userObj_user_name_edit" name="pingLun.userObj.user_name" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">评论时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="comment_commentTime_edit" name="pingLun.commentTime" />

			</span>

		</div>
	</form>
</div>
<script type="text/javascript" src="Comment/js/comment_manage.js"></script> 
