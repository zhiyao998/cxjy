<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加病例</title>
<%@ include file="../../common.jsp"%>
<script type="text/javascript">
	$(function() {
		
	});
	function addQuestion() {
		open(0,"/lcsw/case/addQuestion.action");
	}
	
</script>

<style type="text/css">
	
</style>

</head>
<body>
	<div>
		<form action="" method="post" id="inputForm">
			<input type="hidden" name="caseId">
			<table id="caseInfo">
				<tr style="height: 30%;width: 50%">
					<td>
						<label for="chiefComplain">主诉：</label>
					</td>
					<td>
						<textarea rows="5" cols="30" class="easyui-textbox" id="chiefComplain" name="chiefComplain" data-options="required:true,multiline:true" style="height: 80px;width: 240px"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="caseType">病例类型：</label>
					</td>
					<td>
						<select id="caseType" name="caseType" class="easyui-combobox" data-options="required:true" style="width:200px;">
							<option value="1">标准型</option>   
    						<option value="2">口腔科</option>   
    						<option value="3">内科</option>   
    						<option value="4">外科</option>   
    						<option value="5">胸外科</option>   
    						<option value="6">皮肤科</option>   
						</select>  
					</td>
				</tr>
			</table>
			<div>
				<table class="easyui-datagrid" data-options="fitColumns:true,rownumbers:true,toolbar:toolbar" style="width:100%;">
					<thead>
						<tr> 
    						<th data-options="field:'question'" style="width:22%;">题目简介</th>   
            				<th data-options="field:'first_theme'"  style="width:22%;">题目类型</th>
            				<th data-options="field:'answers'" style="width: 22%;">答案简略</th>   
            				<th data-options="field:'opt'"  style="width:22%;">操作</th> 
						</tr>
					</thead>
					<tbody  id="questions">
						
					</tbody>
				</table>
				    <script type="text/javascript">
		var toolbar = [{
			text:'新增分支',
			iconCls:'fa-plus-square',
			handler:function(){
				addQuestion();
			}
		},{
			text:'返回',
			iconCls:'fa-arrow-circle-left',
			handler:function(){
				back();
			}
		}];
	</script>
			</div>
		</form>
	</div>
	
</body>
</html>