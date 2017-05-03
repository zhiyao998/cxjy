<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common.jsp"%>
<title>病例管理</title>
</head>
<body>
		<table id="grid" class="easyui-datagrid" data-options="fitColumns:true,rownumbers:true,url:'/lcsw/case/list.action',toolbar:toolbar,pagination:true,fit:true,remoteSort:true" style="width:100%;">
    		<thead>
    			<th data-options="field:'caseId',checkbox:true"">病例id</th>   
    			<th data-options="field:'caseTitle',sortable:true" style="width:16%;">病例名称</th>
    			<th data-options="field:'caseType'" style="width:16%;">病例类型</th>     
            	<th data-options="field:'createTime',sortable:true"  style="width:16%;">创建时间</th>   
            	<th data-options="field:'creater'"  style="width:16%;">创建人</th> 
            	<th data-options="field:'titleType',sortable:true" style="width:16%;">题目类型</th>
            	<th data-options="field:'opt',formatter:formatOpt,align:'center'"  style="width:16%;">操作</th> 
    		</thead>
    	</table>
    <script type="text/javascript">
		var toolbar = [{
			text:'刷新列表',
			iconCls:'fa-refresh',
			handler:function(){
				$('#grid').datagrid('reload');
			}
		},{
			text:'增加病例',
			iconCls:'fa-plus-square',
			handler:function(){
				parent.addtab('新增病例',"/lcsw/case/addCase.action");
			}
		},{
			text:'编辑病例',
			iconCls:'fa-plus-square',
			handler:function(){
				var row = $('#grid').datagrid('getSelections');
				if(row.length > 0){
					var ids = [];
					for(var i=0;i<row.length;i++){
						ids[i] = row[i].caseId;
					}
					parent.addtab('编辑病例',"/lcsw/case/editCase.action?id="+ids[0]);
				}else{
					alert("请选择需要修改的病例");	
				}
			}
		},{
			text:'删除病例',
			iconCls:'fa-remove',
			handler:function(){
				var row = $('#grid').datagrid('getSelections');
				if(row.length > 0){
					$.messager.confirm('确认对话框', '确认你是否要删除数据？', function(r) {
						if (r) {
							var ids = [];
							for(var i=0;i<row.length;i++){
								ids[i] = row[i].caseId;
							}
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
					});
				}else{
					alert("请至少选中一项");
				}
			}
		}];
		function formatOpt(val,row,index) {
			return "<button onclick='editCase(" + row.caseId + ")'>编辑</button> <button onclick='deleteCase(" + row.caseId + ")'>删除</button>";
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