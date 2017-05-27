<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<%@ include file="../common.jsp"%>
<style type="text/css">
	#north{
		text-align: center;
		margin: 10px;
	}
	
	#center{
		text-align: center;
		padding: 20px;
	}
	
	table{
		width: 100%;
		height: auto;
	}
	
	tr{
		margin: 10px;
	}
</style>
</head>
<body>
	<div>
		<div id="north">
			<h3>注册页面</h3>
		</div>
		<br>
		<div id="center">
			<form id="registerFrom" action="/lcsw/register">
			<table>
				<tr>
					<td>
						<label>用户名&nbsp;:</label>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<td>
						<label>密码&nbsp;&nbsp;:</label>
						<input type="password" id="password" name="password">
					</td>
				</tr>
				<tr>
					<td>
						<label>确认密码:</label>
						<input type="password" id="password1" name="password1">
					</td>
				</tr>
				<tr>
					<td>
						<a href="#" class="easyui-linkbutton " onclick="submit()"><i class="fa fa-arrow-right"></i>提交</a>
					</td>
				</tr> 
			</table>
			</form>
		</div>
	</div>
<script type="text/javascript">
	function submit() {
		$("#registerFrom").form("submit",{
			onSubmit: function() {
				var flag = $(this).form('enableValidation').form('validate'); 
				var p = $("#password").val();
				var p1 = $("#password1").val();
				if(p != p1){
					alert("两次输入的密码必须一致！");
					$("#password").val("");
					$("#password1").val("");
					return false;
				}
				if(flag){
					var json = $("#registerFrom").serializeArray();
				  	var url = $(this).attr("action");
					$.post(url, json, function(data) {
						if (data.status) {
							alert("注册成功")
							parent.$('#registerBox').window('close');
						}else{
							alert(data.msg);
						}
					}, "json");
				}
				return false;
			}
		});
	}
</script>
</body>
</html>