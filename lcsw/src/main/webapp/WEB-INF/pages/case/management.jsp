<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common.jsp"%>
<title>病例管理</title>
</head>
<body>
		<table id="grid" class="easyui-datagrid" data-options="fitColumns:true,rownumbers:true,url:'/lcsw/case/list.action',pagination:true,fit:true,remoteSort:true" style="width:100%;">
    		<thead>
    			<tr>
    				<th data-options="field:'caseId',checkbox:true"">病例id</th>   
    				<th data-options="field:'caseTitle',sortable:true" style="width:14%;">病例名称</th>
    				<th data-options="field:'caseType'" style="width:14%;">病例类型</th>     
            		<th data-options="field:'createTime',sortable:true"  style="width:14%;">创建时间</th>   
            		<th data-options="field:'creater'"  style="width:14%;">创建人</th> 
            		<th data-options="field:'titleType',sortable:true" style="width:14%;">题目类型</th>
            		<th data-options="field:'totalCount',sortable:true" style="width:14%;">分支数目</th>
            		<th data-options="field:'opt',formatter:formatOpt,align:'center'"  style="width:14%;">操作</th> 
    			</tr>
    		</thead>
    	</table>
    	<div id="tb">
    		<a href="#" class="easyui-linkbutton" onclick="refreshList()" data-options="iconCls:'fa-refresh',plain:true">刷新列表</a>
    		<shiro:hasPermission name="case:add">
				<a href="#" class="easyui-linkbutton" onclick="addCase()" data-options="iconCls:'fa-plus-square',plain:true">增加病例</a>
			</shiro:hasPermission>
    	</div>
    <script type="text/javascript">
		$(function() {
			$('#grid').datagrid({
				toolbar: '#tb'
			});
		})
		function formatOpt(val,row,index) {
			var html = "<shiro:hasPermission name='case:edit'><button onclick='editCase(" + row.caseId + ")'>编辑</button>&nbsp;</shiro:hasPermission>"
					 + "<shiro:hasPermission name='case:delete'><button onclick='deleteCase(" + row.caseId + ")'>删除</button></shiro:hasPermission>";
			return html;
		}
		function addCase() {
			parent.addtab('新增病例',"/lcsw/case/addCase.action");
		}
		function refreshList() {
			$('#grid').datagrid('reload');
		}
		function editCase(id) {
			parent.addtab('编辑病例',"/lcsw/case/editCase.action?id="+id);
		}
		function deleteCase(id) {
			var ids = new Array();  
			ids.push(id);
				$.post("/lcsw/case/deleteCase.action", {
					'ids':JSON.stringify(ids)
				}, function(data) {
						if (data.status) {
						$.messager.alert('系统消息', "删除成功", 'info',
								function() {
									$('#grid').datagrid('reload');
								});
					} 
				}, "json"); 
		}
	</script>
    	
</body>
</html>