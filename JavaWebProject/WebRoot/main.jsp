<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<jsp:include page="logstate.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <title>信息管理系统</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="css/admin.css"/>
</head>
<body class="easyui-layout">


<div data-options="region:'west'," style="width:200px;padding:10px; color: white; background-color: #00bbee">
    <ul id="nav">
    </ul>
</div>
<div data-options="region:'center'" style="overflow:hidden;display:none;">
    <div id="tabs">

    </div>
</div>


<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.all.min.js"></script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>

<script type="text/javascript" src="js/admin.js"></script>


</body>
</html>
