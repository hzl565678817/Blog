
function saveCookie() {
	if ($("#saveid").prop("checked")) {
		$.cookie('manager', $("#manager").val(), {
			expires : 7
		});
	}
}
$(function () {
	//单击登录
	$('#btn a').click(function () {

			$.ajax({
				url : 'login',
				type : 'post',
				data : {
					"username" : $('#manager').val(),
					"password" : $('#password').val(),
				},
				beforeSend : function () {
					$.messager.progress({
						text : '正在登录中...',
					});
				},
				success : function (data, response, status) {
					$.messager.progress('close');  
					var obj = eval(data);
					if (obj.success) {
						saveCookie();
						location.href = 'main_bz.jsp';;
					} else {
						$.messager.alert('登录失败！', obj.msg, 'warning', function () {
							$('#password').select();
						});
					}
				}
			});

	});
	
});







