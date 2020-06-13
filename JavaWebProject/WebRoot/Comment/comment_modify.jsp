<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<jsp:include page="../logstate.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/pingLun.css" />
<div id="comment_editDiv">
	<form id="commentEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">回复id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="comment_commentId_edit" name="pingLun.commentId" value="<%=request.getParameter("commentId") %>" style="width:200px" />
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
		<div class="operation">
			<a id="commentModifyButton" class="easyui-linkbutton">更新</a> 
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/Comment/js/comment_modify.js"></script> 
