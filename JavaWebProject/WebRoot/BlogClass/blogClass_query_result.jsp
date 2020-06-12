<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../logstate.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/blogClass.css" />

<div id="blogClass_manage"></div>
<div id="blogClass_manage_tool" style="padding:5px;">
	<div style="margin-bottom:5px;">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit-new" plain="true" onclick="blogClass_manage_tool.edit();">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-delete-new" plain="true" onclick="blogClass_manage_tool.remove();">删除</a>
	</div>
	<div style="padding:0 0 0 7px;color:#333;">
		<form id="blogClassQueryForm" method="post">
		</form>	
	</div>
</div>

<div id="blogClassEditDiv" style="background-color: palevioletred">
	<form id="blogClassEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<p>id</p>
			<span class="inputControl">
				<input class="textbox" type="text" id="blogClass_blogClassId_edit" name="blogClass.blogClassId" style="width:200px" />
			</span>
		</div>
		<div>
			<p >名称:</p>

			<span class="inputControl">
				<input class="textbox" type="text" id="blogClass_blogClassName_edit" name="blogClass.blogClassName" style="width:200px" />

			</span>

		</div>
		<div>
			<p >介绍:</p>
			<span class="inputControl">
				<textarea id="blogClass_blogClassDesc_edit" name="blogClass.blogClassDesc" rows="8" cols="40"></textarea>

			</span>

		</div>
	</form>
</div>
<script type="text/javascript" src="BlogClass/js/blogClass_manage.js"></script> 
