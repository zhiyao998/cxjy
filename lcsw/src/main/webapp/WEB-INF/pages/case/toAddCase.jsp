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
$(function() {	
	$.ajax({
	    'type': 'POST',
	    'url': "/lcsw/case/getlastCase.action",
	    'dataType': 'json',
	    'success': function(data) {
			if (data.status) {
				var Newcase = data.Newcase;
				var steps = new Array();
				steps = Newcase.caseStep.split(",");
				for(var i=0; i < steps.length; i++){
					var test = $("input[value='" + steps[i] +"']");
					$(test).attr("checked",true);
				}
				$("#caseTitle").textbox("setValue",Newcase.caseTitle);
				$("#chiefComplain").textbox("setValue",Newcase.chiefComplain);
				$("#caseType").combobox("select",Newcase.caseType)
			}
		}
	})
});
function submitNewCase() {
	$('#inputForm').form('submit', {
		onSubmit : function() {
			var flag = $(this).form('enableValidation').form('validate');
			var step = $("input:checked");
			if(step.length == 0){
				alert("请选择至少一个考察步骤!");
				return false;
			}
			if(flag){
				var json = $("#inputForm").serializeArray();
			  	var url = $(this).attr("action");
				$.post(url, json, function(data) {
					if (data.status) {
							//ok后的回调方法，去关闭父页面的窗口元素
							parent.open(1,data.nextStep);
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
			<table>
				<tr>
					<td>
						<label for="caseTitle">题目：</label>
					</td>
					<td >
						<input class="easyui-textbox" type="text" id="caseTitle" name="caseTitle" data-options="required:true">
					</td>
				</tr>
				<tr style="height: 30%;width: 50%">
					<td>
						<label for="chiefComplain">主诉：</label>
					</td>
					<td>
						<textarea rows="5" cols="30" class="easyui-textbox" id="chiefComplain" name="chiefComplain" data-options="required:true,multiline:true" style="height: 80px;width: 240px"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						请选择您需要考察的步骤:
						<input type="hidden" value="0" name="caseStep">
						<input type="checkbox" value="1" name="caseStep">问诊
						<input type="checkbox" value="2" name="caseStep">体格检查
						<input type="checkbox" value="3" name="caseStep">初步诊断
						<input type="checkbox" value="4" name="caseStep">辅助检查
						<input type="checkbox" value="5" name="caseStep">确诊判断
						<input type="checkbox" value="6" name="caseStep">治疗方案
						<input type="checkbox" value="7" name="caseStep">病人管理
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
			<input type="hidden" id="step" value="1">
		</form>
	</div>	
	<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
		<a id="submit" href="#" onclick="submitNewCase()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">下一步</a>  
		<a id="close" href="#" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
	</div>
	
	</div>
</body>
</html>