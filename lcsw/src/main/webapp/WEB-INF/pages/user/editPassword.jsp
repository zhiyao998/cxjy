<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<%@ include file="../../common.jsp"%>
<style type="text/css">
	table{
		width: 100%;
		height: auto;
	}
	
	tr{
		margin: 10px;
	}
	
	form{
		text-align: center;
		padding: 20px;
	}
	
</style>
</head>

<body>
	<div>
		<form id="editPasswordFrom" action="/lcsw/user/editPassword">
			<table>
				<tr>
					<td>
						<label>旧密码&nbsp;&nbsp;:</label>
						<input type="password" name="oldPassword">
					</td>
				</tr>
				<tr>
					<td>
						<label>新密码&nbsp;&nbsp;:</label>
						<input type="password" name="password">
					</td>
				</tr>
				<tr>
					<td>
						<label>确认新密码:</label>
						<input type="password" name="password1">
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
<script type="text/javascript">
	function submit() {
		$("#editPasswordFrom").form("submit",{
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
					var json = $("#editPasswordFrom").serializeArray();
				  	var url = $(this).attr("action");
					$.post(url, json, function(data) {
						if (data.status) {
							alert("修改成功")
							parent.$('#editPasswordBox').window('close');
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