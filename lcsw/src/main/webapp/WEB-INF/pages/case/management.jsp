<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common.jsp"%>
<title>病例管理</title>
</head>
<body>
		<table id="grid" class="easyui-datagrid" data-options="fitColumns:true,rownumbers:true,url:'/lcsw/case/list.action',toolbar:toolbar"" style="width:100%;">
    		<thead>
    			<th data-options="field:'caseId',checkbox:true"">病例id</th>   
    			<th data-options="field:'caseTitle'" style="width:22%;">病例名称</th>   
            	<th data-options="field:'createTime'"  style="width:22%;">创建时间</th>   
            	<th data-options="field:'creater'"  style="width:22%;">创建人</th> 
            	<th data-options="field:'caseType'" style="width:22%;">病例类型</th>
    		</thead>
    	</table>
    <script type="text/javascript">
		var toolbar = [{
			text:'增加病例',
			iconCls:'fa-plus-square',
			handler:function(){
				open(1,"0");
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
	 						$.post("/lcsw/case/delete.action", {
								'id':row[0].caseId,
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
		},{
			text:'修改病例',
			iconCls:'fa-edit',
			handler:function(){
				var row = $('#grid').datagrid('getSelections');
				if(row.length > 0){
					var ids = [];
					for(var i=0;i<row.length;i++){
						ids[i] = row[i].caseId;
					}
					var url = "/lcsw/case/toEdit.action?id="+ids[0];
					open(0,url);
				}else{
					alert("请选择需要修改的病例");	
				}
			}
		},{
			text:'查看病例',
			iconCls:'fa-check',
			handler:function(){
				var row = $('#grid').datagrid('getSelections');
				if(row.length > 0){
					var ids = [];
					for(var i=0;i<row.length;i++){
						ids[i] = row[i].caseId;
					}
					var url = "/lcsw/case/checkCase.action?id="+ids[0];
					open(0,url);	
				}else{
					alert("请至少选中一项");
				}
			}
		}];
	</script>
    	
</body>
</html>