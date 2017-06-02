<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更改权限</title>
<%@ include file="../../common.jsp"%>
<style type="text/css">
	#north{
		padding: 20px;
	}
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
		<input id="roleId" name="roleId" type="hidden" value="${requestScope.roleId }">
		<div id="north" data-options="region:'north',border:true" style="width:100%;height: 20%">
		<table>
			<tbody>
				<tr>
					<td>
						<label>一级菜单:</label>
						<input id="firstMenu" class="easyui-combobox" data-options="valueField:'id',textField:'text',url:'/lcsw/menu/getFirstMenu.action'" >
					</td>
					<td>
						<label>二级菜单:</label>
						<input id="secondMenu" class="easyui-combobox" data-options="valueField:'id',textField:'text'" >
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<div id="center" data-options="region:'center',border:true" style="width:70%;height: 20%">
			<table>
				<tr>
					<td><label>待分配权限</label></td>
					<td></td>
					<td><label>已分配权限</label></td>
				</tr>
				<tr>
					<td>
						<div class="easyui-panel" style="width:220px;height:240px;">
							<ul id="allPerms" class="easyui-datalist" style="height: 100%" data-options="checkbox:true,textField:'menuName',valueField:'menuId',groupField:'groupName',singleSelect:false">
				
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
							<ul id="perms" class="easyui-datalist" style="height: 100%" data-options="checkbox:true,textField:'menuName',valueField:'menuId',groupField:'groupName',singleSelect:false">
				
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
			$("#secondMenu").combobox({
				url: "/lcsw/menu/getSecondMenu.action?id=" + 0
			});
			$("#firstMenu").combobox({
					onSelect: function(record) {
					$("#secondMenu").combobox({
						url: "/lcsw/menu/getSecondMenu.action?id=" + record.id
					});
					getPerms();
				}
			});
			$("#secondMenu").combobox({
				onSelect: function() {
					getPerms();
				}
			});
			getPerms();

		})
		function getPerms() {
				$("#allPerms").empty();
				$("#perms").empty();
				var fid = $("#firstMenu").combobox("getValue");
				var sid = $("#secondMenu").combobox("getValue");
				if(fid == null || fid == ""){
					fid=0;
				}
				if(sid == null || sid == ""){
					sid=0;
				}
	 			$.post("/lcsw/menu/getRolePerms.action", {
					'fid':fid,
					'sid':sid,
					'roleId': $("#roleId").val()
					}, function(data) {
						var all = data.all;
						var role = data.role;
						if(all != null){
							$("#allPerms").datalist("loadData",all);
						}
						if(role != null){
							$("#perms").datalist("loadData",role);
						}
					}, "json");
			}
		function sumbit() {
			var s = $("#perms").datalist("getRows");
			var id = "";
			for(var i = 0; i < s.length; i++){
				if(i == 0){
					id = id + s[i].menuId
				}else{
					id = id + "," + s[i].menuId;
				}
			}
 			$.post("/lcsw/role/editRolePerms.action", {
				'ids':id,
				'roleId': $("#roleId").val()
				}, function(data) {
					if(data.status){
						parent.$('#${windowid}').window('close');
						alert("修改成功");	
					}
				}, "json");
		}
		function toRight() {
			var s = $("#allPerms").datalist("getSelections");
			var r = $("#perms").datalist("getRows");
			var t = r.concat(s);
			$("#perms").datalist("loadData",t);
 			for(var i = 0; i < s.length; i++){
				var index = $("#allPerms").datalist("getRowIndex",s[i]);
				var index = $("#allPerms").datalist("deleteRow",index);
			}
		}
		function toLeft() {
			var s = $("#perms").datalist("getSelections");
			var r = $("#allPerms").datalist("getRows");
			var t = r.concat(s);
			$('#allPerms').datalist("loadData",t);
			for(var i = 0; i < s.length; i++){
				var index = $("#perms").datalist("getRowIndex",s[i]);
				var index = $("#perms").datalist("deleteRow",index);
			}
		}
		function allToRight() {
			var s = $("#allPerms").datalist("getRows");
			var r = $("#perms").datalist("getRows");
			var t = r.concat(s);
			$("#perms").datalist("loadData",t);
			$('#allPerms').datalist('loadData',{rows:[]})
		}
		function allToLeft() {
			var s = $("#perms").datalist("getRows");
			var r = $("#allPerms").datalist("getRows");
			var t = r.concat(s);
			$('#allPerms').datalist("loadData",t);
			$('#perms').datalist('loadData',{rows:[]})
		}
	
	</script>
</body>
</html>