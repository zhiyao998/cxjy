<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑病例</title>
<%@ include file="../../common.jsp"%>
<style type="text/css">
	input{
		background-color: white;
	}
	tr{
		border: 10px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$("#caseType").combobox("select",${caseQuery.newCase.caseType});
	});
	function editNewCase() {
	$('#inputForm').form('submit', {
		onSubmit : function() {
			var flag = $(this).form('enableValidation').form('validate');
			if(flag){
				var json = $("#inputForm").serializeArray();
			  	var url = $(this).attr("action");
				$.post(url, json, function(data) {
					if (data.status) {
							//ok后的回调方法，去关闭父页面的窗口元素
							parent.open($("#nextTitle").val(),$("#nextUrl").val());
							parent.$('#${windowid}').window('close');
					}
				}, "json");
			}
			//返回flase ，否则会提交表单
			return false;
		}
	});
}
</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		
	<div data-options="region:'center',border:false" style="padding: 10px;">
		<form action="/lcsw/case/next.action" method="post" id="inputForm">
			<input type="hidden" name="caseId" value="${caseQuery.newCase.caseId }">
			<table>
				<tr>
					<td>
						<label for="caseTitle">题目：</label>
					</td>
					<td >
						<input class="easyui-textbox" type="text" id="caseTitle" name="caseTitle" data-options="required:true" value="${caseQuery.newCase.caseTitle }">
					</td>
				</tr>
				<tr>
					<td>
						<label for="patientInfo">病人信息：</label>
					</td>
					<td>
						<input class="easyui-textbox" id="patientInfo" name="patientInfo" data-options="required:true,multiline:true" style="height: 80px;width: 240px" value="${caseQuery.newCase.patientInfo }"></input>
					</td>
				</tr>
				<tr style="height: 30%;width: 50%">
					<td>
						<label for="chiefComplain">主诉：</label>
					</td>
					<td>
						<input class="easyui-textbox" id="chiefComplain" name="chiefComplain" data-options="required:true,multiline:true" style="height: 80px;width: 240px" value="${caseQuery.newCase.chiefComplain }">
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
			<input type="hidden" name="creater" value="rongyu">
		</form>
			<input type="hidden" id="nextUrl" value="/lcsw/inquiry/toEdit.action">
			<input type="hidden" id="nextTitle" value="编辑问诊信息">
	</div>	
	<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
		<a id="submit" href="#" onclick="editNewCase()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">下一步</a>  
		<a id="close" href="#" onclick="parent.$('#${windowid}').window('close')" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
	</div>
	
	</div>
</body>
</html>