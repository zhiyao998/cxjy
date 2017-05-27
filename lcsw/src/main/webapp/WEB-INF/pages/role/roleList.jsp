<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色列表</title>
<%@ include file="../../common.jsp"%>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:true" style="width:100%%;height: 100%">
			<table id="roleList" class="easyui-datagrid" data-options="fitColumns:true,singleSelect:true,rownumbers:true,toolbar:toolbar,pagination:true,fit:true,remoteSort:true,url:'/lcsw/role/roleList.action'" style="width:100%;">
				<thead>
					<tr>  
            			<th data-options="field:'roleName'"  style="width:30%;">角色名称</th>
            			<th data-options="field:'roleCount'"  style="width:10%;">角色人数</th>
            			<th data-options="field:'remark'"  style="width:30%;">描述</th>
            			<th data-options="field:'opt',formatter:formatOpt,align:'center'"  style="width:30%;">操作</th> 
					</tr>
				</thead>
				<tbody  id="roles">
						
				</tbody>
			</table>
	<script type="text/javascript">
	function formatOpt(val,row,index) {
		return "<button onclick='editPerms(" + row.roleId + ")'>权限</button>&nbsp;<button onclick='editRole(" + row.roleId + ")'>编辑</button>&nbsp;<button onclick='deleteRole(" + row.roleId + ")'>删除</button>";
	}
	
		var toolbar = [{
			text:'新增角色',
			iconCls:'fa-plus-square',
			handler:function(){
				parent.addtab('新增角色',"/lcsw/role/toAddRole.action");
			}
		}];
	</script>
		</div>
	</div>
	<script type="text/javascript">
function deleteRole(id) {
	$.messager.confirm('确认对话框', '确认你是否要删除数据？', function(r) {
		if (r) {
 			$.post("/lcsw/role/deleteRole.action", {
				'id':id,
				}, function(data) {
 					if (data.status) {
						$.messager.alert('系统消息', "删除成功", 'info',
							function() {
								$('#roleList').datagrid('reload');
						});
					} 
				}, "json"); 
		}
	});
}

function editRole(id) {
	parent.addtab('编辑病例',"/lcsw/role/toEditRole.action?id="+id);
}
</script>
</body>
</html>