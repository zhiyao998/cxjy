<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增用户</title>
<%@ include file="../../common.jsp"%>
<style type="text/css">
	#main{
		height: auto;
		margin: 10px;
	}
	#title{
		background-color: #F5F5F5;
		border: 1px ridge rgba(221,221,221,0.5); 
		height: 50px;
		padding-left: 30px;
		border-radius: 5px;
	}
	h4{
		line-height: 50px;
	}
	#form{
		background-color: white;
		border: 1px ridge rgba(221,221,221,0.5);
		border-radius: 5px; 
	}
	
	td{
		padding-top: 20px;
		padding-left: 40px;
		padding-bottom: 10px;
	}
	#addButton:HOVER{
		background-color: rgb(40,96,144);
		
	}
	#addButton{
		background-color: rgb(60,141,188);
		height: 40px;
		width: 60px;
		border-radius: 5px;
		color: white;
	}
	#backButton:HOVER{
		background-color: rgb(236,151,31);
	}
	#backButton{
		background-color: rgb(250,210,146);
		height: 40px;
		width: 60px;
		border-radius: 5px;
		color: white;
	}
</style>
</head>
<body>
	<div id="main">
		<div id="title">
			<h4>新增用户</h4>
		</div>
		<div id="form">
			<form id="addUserForm" action="/lcsw/user/addUser">
				<table>
					<tr>
						<td>
							<label>用户名</label>
							<input name="name" class="easyui-textbox" data-options="type:'text'">
						</td>
					</tr>
					<tr>
						<td>
							<label>密码&nbsp;</label>
							<input name="password" class="easyui-textbox" data-options="type:'password'">
						</td>
					</tr>
					<tr>
						<td>
							<label>状态</label>
							<input type="radio" name="status" value="1">
							<label>正常</label>
							<input type="radio" name="status" value="0">
							<label>禁用</label>
						</td>
					</tr>
					<tr>
						<td>
							<button id="addButton" type="button" onclick="add()">确定</button>
							<button id="backButton" type="button" onclick="back()">返回</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
<script type="text/javascript">
	function add() {
		$("#addUserForm").form("submit",{
			onSubmit: function() {
				var flag = $(this).form('enableValidation').form('validate'); 
				if(flag){
					var user = $("#addUserForm").serializeArray();
				  	var url = $(this).attr("action");
					$.post(url, user, function(data) {
						if (data.status) {
							back();
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