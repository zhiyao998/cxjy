<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更改权限</title>
<%@ include file="../../common.jsp"%>
<style type="text/css">
	#center{
		padding: 20px;
	}
	#center td{
		padding-left: 20px;
		padding-right: 20px;
	}
	#center a{
		margin-top: 20px;
	}
	ul{
		width: auto;
	}

</style>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<input id="userId" name="userId" type="hidden" value="${requestScope.userId }">
		<div id="center" data-options="region:'center',border:true" style="width:70%;height: 20%">
			<table>
				<tr>
					<td><label>角色列表</label></td>
					<td></td>
					<td><label>已分配角色</label></td>
				</tr>
				<tr>
					<td>
						<div class="easyui-panel" style="width:220px;height:240px;">
							<ul id="allRoles" class="easyui-datalist" style="height: 100%" data-options="checkbox:true,textField:'roleName',valueField:'roleId',singleSelect:false">
				
							</ul>
						</div>
					</td>
					<td>
						<div>
							<a href="#" class="easyui-linkbutton" data-options="iconCls:'fa-angle-right'" onclick='toRight()'></a>
							<br>
							<a href="#" class="easyui-linkbutton" data-options="iconCls:'fa-angle-left'" onclick='toLeft()'></a>
							<br>
							<a href="#" class="easyui-linkbutton" data-options="iconCls:' fa-angle-double-right'" onclick='allToRight()'></a>
							<br>
							<a href="#" class="easyui-linkbutton" data-options="iconCls:' fa-angle-double-left'" onclick='allToLeft()'></a>							
						</div>
					</td>
					<td>
						<div class="easyui-panel" style="width:220px;height:240px;">
							<ul id="roles" class="easyui-datalist" style="height: 100%" data-options="checkbox:true,textField:'roleName',valueField:'roleId',singleSelect:false">
				
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<a href="#" class="easyui-linkbutton" data-options="iconCls:' fa-floppy-o'" onclick='sumbit()'>保存</a>
					</td>
				</tr>
			</table>
			
		</div>
	</div>
	
	<script type="text/javascript">
		$(function() {
			getRoles();

		})
		function getRoles() {
				$("#allRoles").empty();
				$("#roles").empty();
	 			$.post("/lcsw/user/getUserRoles.action", {
					'userId': $("#userId").val()
					}, function(data) {
						var all = data.all;
						var user = data.user;
						$("#allRoles").datalist("loadData",all);
						$("#roles").datalist("loadData",user);
					}, "json");
			}
		function sumbit() {
			var s = $("#roles").datalist("getRows");
			var id = "";
			for(var i = 0; i < s.length; i++){
				if(i == 0){
					id = id + s[i].roleId
				}else{
					id = id + "," + s[i].roleId;
				}
			}
 			$.post("/lcsw/user/editUserRoles.action", {
				'ids':id,
				'userId': $("#userId").val()
				}, function(data) {
					if(data.status){
						parent.$('#${windowid}').window('close');
						alert("修改成功");	
					}
				}, "json");
		}
		function toRight() {
			var s = $("#allRoles").datalist("getSelections");
			for(var i = 0; i < s.length; i++){
				var index = $("#allRoles").datalist("getRowIndex",s[i]);
				var id = s[i].roleId;
				var name = s[i].roleName
				$('#roles').datalist('appendRow',{
					roleId: id,
					roleName: name
				});
				var index = $("#allRoles").datalist("deleteRow",index);
			}
		}
		function toLeft() {
			var s = $("#roles").datalist("getSelections");
			for(var i = 0; i < s.length; i++){
				var index = $("#roles").datalist("getRowIndex",s[i]);
				var id = s[i].roleId;
				var name = s[i].roleName
				$('#allRoles').datalist('appendRow',{
					roleId: id,
					roleName: name
				});
				var index = $("#roles").datalist("deleteRow",index);
			}
		}
		function allToRight() {
			var s = $("#allRoles").datalist("getRows");
			for(var i = 0; i < s.length; i++){
				var index = $("#allRoles").datalist("getRowIndex",s[i]);
				var id = s[i].roleId;
				var name = s[i].roleName
				$('#roles').datalist('appendRow',{
					roleId: id,
					roleName: name
				});
			}
			$('#allRoles').datalist('loadData',{rows:[]})
		}
		function allToLeft() {
			var s = $("#roles").datalist("getRows");
			for(var i = 0; i < s.length; i++){
				var index = $("#roles").datalist("getRowIndex",s[i]);
				var id = s[i].roleId;
				var name = s[i].roleName
				$('#allRoles').datalist('appendRow',{
					roleId: id,
					roleName: name
				});
			}
			$('#roles').datalist('loadData',{rows:[]})
		}
	
	</script>
</body>
</html>