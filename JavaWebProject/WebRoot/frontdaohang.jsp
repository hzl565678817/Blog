<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div>
    <ul>
        <li><a href="<%=basePath %>index.jsp">首页</a></li>
        <li><a href="<%=basePath %>UserInfo/frontlist">用户</a></li>
        <li><a href="<%=basePath %>BlogClass/frontlist">博客分类</a></li>
        <li><a href="<%=basePath %>Blog/frontlist">博客</a></li>
        <li><a href="<%=basePath %>Comment/frontlist">博客评论</a></li>
        <li><a href="<%=basePath %>queryLog">日志查看</a></li>
        <li><a href="#" onclick="register();">&nbsp;&nbsp;注册</a></li>
        <li><a href="#" onclick="login();">&nbsp;登录</a></li>
    </ul>
</div>


<div id="registerDialog" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" name="registerForm" id="registerForm" enctype="multipart/form-data"
                      method="post" class="mar_t15">
                    <div class="form-group">
                        <p>用户名</p>
                        <div class="col-md-9">
                            <input type="text" id="reuname" name="reuname" class="form-control" placeholder="请输入用户名">
                        </div>
                    </div>

                    <div class="form-group">
                        <p>密码</p>
                        <div class="col-md-9">
                            <input type="password" id="repassword" name="repassword" class="form-control"
                                   placeholder="登录密码">
                        </div>
                    </div>

                    <div>
                        <p>姓名</p>
                        <span class="inputControl">
				<input class="textbox" type="text" id="userInfo_name" name="userInfo.name" style="width:200px"/>

			</span>

                    </div>
                    <div>
                        <p>性别</p>
                        <span class="inputControl">
				<input class="textbox" type="text" id="userInfo_gender" name="userInfo.gender" style="width:200px"/>

			</span>

                    </div>
                    <div>
                        <p>出生日期:</p>
                        <span class="inputControl">
				<input class="textbox" type="text" id="userInfo_birthDate" name="userInfo.birthDate"/>

			</span>

                    </div>
                    <div>
                        <p>用户照片</p>
                        <span class="inputControl">
				<input id="userPhotoFile" name="userPhotoFile" type="file" size="50"/>
			</span>
                    </div>
                    <div>
                        <p>联系电话:</p>

                        <span class="inputControl">
				<input class="textbox" type="text" id="userInfo_telephone" name="userInfo.telephone"
                       style="width:200px"/>

			</span>

                    </div>
                    <div>
                        <p>邮箱</p>
                        <span class="inputControl">
				<input class="textbox" type="text" id="userInfo_email" name="userInfo.email" style="width:200px"/>

			</span>

                    </div>
                    <div>
                        <p>家庭地址:</p>
                        <span class="inputControl">
				<input class="textbox" type="text" id="userInfo_address" name="userInfo.address" style="width:200px"/>

			</span>

                    </div>
                    <div>
                        <p>注册时间:</p>
                        <span class="inputControl">
				<input class="textbox" type="text" id="userInfo_regTime" name="userInfo.regTime"/>

			    </span>
                    </div>
                </form>

                <style>#bookTypeAddForm .form-group {
                    margin-bottom: 10px;
                }  </style>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="ajaxRegister();">注册</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<script>

    function register() {
        $("#registerDialog input").val();
        $("#registerDialog input").val();
        $('#registerDialog').modal('show');
    }

    function ajaxRegister() {
        var username = $('#reuname').val();
        var password = $('#repassword').val();
        $.ajax({
            type: "post",
            url: "<%=basePath%> UserInfo/register",
            dataType: "json",
            data: {
                username: username,
                password: password

            },
            success: function (data) {
                if (data.success) {
                    alert("注册成功！");
                } else {
                    alert(data.message);
                }
            }
        });
    }


    function login() {
        location.href = "<%=basePath%>loginbz.jsp";
    }

    function ajaxLogin() {
        $.ajax({
            url: "<%=basePath%>frontLogin",
            type: 'post',
            dataType: "json",
            data: {
                "userName": $('#userName').val(),
                "password": $('#password').val(),
            },
            success: function (obj, response, status) {
                if (obj.success) {

                    location.href = "<%=basePath%>index.jsp";
                } else {
                    alert(obj.msg);
                }
            }
        });
    }


</script> 
