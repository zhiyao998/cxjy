<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common.jsp"%>
<title>病例基本情况页</title>
<style type="text/css">
	input{
		background-color: white;
	}
	tr{
		border: 10px;
	}
</style>
<script type="text/javascript">
function submitNewCase() {
	$('#inputForm').form('submit', {
		onSubmit : function() {
			var flag = $(this).form('enableValidation').form('validate');
			if(flag){
				var json = $("#inputForm").serializeArray();
			  	var url = $(this).attr("action");
				$.post(url, json, function(data) {
					if (data.status) {
							//ok后的回调方法，去关闭父页面的窗口元素
							parent.open($("#nextTitle").val(),$("#nextUrl").val(),$("#nextWidth").val(),$("#nextHight").val());
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
		<form action="/lcsw/case/insert.action" method="post" id="inputForm">
			<table>
				<tr>
					<td>
						<label for="caseTitle">题目：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" name="caseTitle" data-options="required:true">
					</td>
				</tr>
				<tr>
					<td>
						<label for="patientInfo">病人信息：</label>
					</td>
					<td>
						<input class="easyui-textbox" name="patientInfo" data-options="required:true,multiline:true" style="height: 80px;width: 240px"></input>
					</td>
				</tr>
				<tr style="height: 30%;width: 50%">
					<td>
						<label for="chiefComplain">主诉：</label>
					</td>
					<td>
						<textarea rows="5" cols="30" class="easyui-textbox" name="chiefComplain" data-options="required:true,multiline:true" style="height: 80px;width: 240px"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="caseType">病例类型：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" name="caseType" data-options="required:true">
					</td>
				</tr>
			</table>
			<input type="hidden" name="creater" value="rongyu">
		</form>
			<input type="hidden" id="nextUrl" value="/lcsw/inquiry/toAdd.action">
			<input type="hidden" id="nextTitle" value="添加问诊信息">
			<input type="hidden" id="nextHight" value="600">
			<input type="hidden" id="nextWidth" value="800">
	</div>	
	<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
		<a id="submit" href="#" onclick="submitNewCase()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">下一步</a>  
		<a id="close" href="#" onclick="parent.$('#${windowid}').window('close')" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
	</div>
	
	</div>
</body>
</html>