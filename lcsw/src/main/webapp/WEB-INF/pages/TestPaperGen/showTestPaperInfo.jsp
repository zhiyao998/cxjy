<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生成试卷详情</title>
<%@ include file="../../common.jsp"%>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',border:true" style="width:100%;height: 30%">
			
		</div>
		<div id="center" data-options="region:'center',border:false" style="padding: 10px;height: 100%">
			<table class="easyui-datagrid" data-options="fitColumns:true,rownumbers:true,toolbar:toolbar,pagination:true,fit:true" style="width:100%;">
				<thead>
					<tr> 
    					<th data-options="field:'caseId',checkbox:true"">病例id</th>   
    					<th data-options="field:'chiefComplain',sortable:true" style="width:22%;">病例名称</th>   
            			<th data-options="field:'createTime',sortable:true"  style="width:22%;">创建时间</th>   
            			<th data-options="field:'creater'"  style="width:22%;">创建人</th> 
            			<th data-options="field:'titleType',sortable:true" style="width:22%;">题目类型</th> 
					</tr>
				</thead>
			</table>
	<script type="text/javascript">
		var toolbar = [{
			text:'从病例库添加病例',
			handler:function(){
				alert('从病例库添加病例');
			}
		},{
			text:'添加新病例',
			handler:function(){
				alert('添加');
			}
		}];
	</script>
		</div>
	</div>
</body>
</html>