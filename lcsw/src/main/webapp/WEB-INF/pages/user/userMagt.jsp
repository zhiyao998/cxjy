<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<%@ include file="../../common.jsp"%>
<script type="text/javascript">
function deleteUser(id) {
	$.messager.confirm('确认对话框', '确认你是否要删除数据？', function(r) {
		if (r) {
 			$.post("/lcsw/user/deleteUser.action", {
				'id':id,
				}, function(data) {
 					if (data.status) {
						$.messager.alert('系统消息', "删除成功", 'info',
							function() {
								$('#userList').datagrid('reload');
						});
					} 
				}, "json"); 
		}
	});
}

function editUser(id) {
	parent.addtab('编辑病例',"/lcsw/user/toEditUser.action?id="+id);
}

function addUser() {
	parent.addtab('添加用户',"/lcsw/user/toAddUser.action");
}

function formatOpt(val,row,index) {
	var html = "<button onclick='editPerms(" + row.id + ")'>权限</button>&nbsp;"
	  			+ "<shiro:hasPermission name='sys:user:role'><button onclick='editRole(" + row.id + ")'>角色</button>&nbsp;</shiro:hasPermission>"
	  			+ "<shiro:hasPermission name='sys:user:edit'><button onclick='editUser(" + row.id + ")'>编辑</button>&nbsp;</shiro:hasPermission>"
	  			+ "<shiro:hasPermission name='sys:user:delete'><button onclick='deleteUser(" + row.id + ")'>删除</button></shiro:hasPermission>";
	return html;
}
function formatStatus(val,row,index) {
	if(row.status == 1){
		return "正常"	
	}else{
		return "禁用";
	}
}
function editRole(id) {
	open1("/lcsw/user/toEditUserRoles.action?id=" + id,650,550);
}
</script>

</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:true" style="width:100%%;height: 100%">
			<table id="userList" class="easyui-datagrid" data-options="fitColumns:true,singleSelect:true,rownumbers:true,toolbar:'#tb',pagination:true,fit:true,remoteSort:true,url:'/lcsw/user/userList.action'" style="width:100%;">
				<thead>
					<tr>  
            			<th data-options="field:'name'"  style="width:40%;">用户姓名</th>
            			<th data-options="field:'status',formatter:formatStatus"  style="width:20%;">用户状态</th>
            			<th data-options="field:'opt',formatter:formatOpt,align:'center'"  style="width:40%;">操作</th> 
					</tr>
				</thead>
				<tbody  id="users">
						
				</tbody>
			</table>
			<div id="tb">
				<shiro:hasPermission name="sys:user:add">
    				<a href="#" class="easyui-linkbutton" onclick="addUser()" data-options="iconCls:'fa-plus-square',plain:true">添加用户</a>
    			</shiro:hasPermission>
    		</div>
		</div>
	</div>
</body>
</html>