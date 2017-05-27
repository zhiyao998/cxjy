<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<%@ include file="../common.jsp"%>
<style type="text/css">
	#loginBox{
		background-color: #f8f8fa;
		height: auto;
		width: 500px;
    	position: absolute;
		
    	left:50%;
    	top: 40%;
    	transform: translate(-50%,-50%); 
	}
	#title{
		text-align: center;
		background-color: #dcdde2;
		padding: 15px;
	}
	#loginForm{
		padding: 20px;
	}
	
	#loginForm table{
		width: 100%;
	}
	
	#loginForm input{
		line-height: 30px;
		width: 80%;
		margin: 10px;
	}
	
	body{
		background-color: #efefef;
		padding: 50px;
		text-align: center;
	}
</style>
<script type="text/javascript">
function sumbitData() {
	$("#loginForm").form("submit",{
		onSubmit: function() {
			var flag = $(this).form('enableValidation').form('validate'); 
			if(flag){
				var json = $("#loginForm").serializeArray();
			  	var url = $(this).attr("action");
				$.post(url, json, function(data) {
					if (data.status) {
						window.location.href = "/lcsw/main";
					}else{
						window.location.href = "/lcsw/toLogin";
					}
				}, "json");
			}
			return false;
		}
	});
}
function register() {
	var html = '<div id="registerBox"><iframe frameborder="0" marginwidth="100%" width="100%" height="100%" src="/lcsw/toRegister" ></iframe></div>';
	$("body").append(html);
	$("#registerBox").window({
		title: '注册页面',
		width : 600,
		height : 400,
		modal : true,
		//当window关闭时把这个窗口的代码清除。
		onClose : function() {
			$("#registerBox").window('destroy');
		}
	});
} 
</script>
</head>
<body>
	<div id="loginBox">
		<div id="title" style="">
			<h2>临床思维系统</h2>
		</div>
 		<form id="loginForm" action="/lcsw/login" method="post">
			<table>
				<tr>
					<td>
						<label>用户名:</label>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<td>
						<label>密码&nbsp;:</label>
						<input type="password" name="password">
					</td>
				</tr>
				<tr>
					<td>
						<a href="#" class="easyui-linkbutton " onclick="register()"><i class="fa fa-user-plus"></i>注册</a>
						<a href="#" class="easyui-linkbutton" onclick="sumbitData()"><i class="fa fa-sign-in"></i>登录</a>
					</td>
				</tr> 
			</table>
		</form>
	</div>
</body>
</html>