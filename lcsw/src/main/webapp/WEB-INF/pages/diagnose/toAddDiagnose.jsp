<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common.jsp"%>
<title>Insert title here</title>
<script type="text/javascript">

$(function() {	
	$.ajax({
	    'type': 'POST',
	    'url': "/lcsw/diagnose/getlastDiagnose.action",
	    'dataType': 'json',
	    'success': function(data) {
			if (data.status) {
				var diagnose = data.diagnose;
				$("#diagnoseId").val(diagnose.diagnoseId);
				$("#score").textbox("setValue",diagnose.score);
				$("#diagnoseResultA").textbox("setValue",diagnose.diagnoseResultA);
				$("#diagnoseResultB").textbox("setValue",diagnose.diagnoseResultB);
				$("#diagnoseResultC").textbox("setValue",diagnose.diagnoseResultC);
				$("#diagnoseResultD").textbox("setValue",diagnose.diagnoseResultD);
				$("#diagnoseResultE").textbox("setValue",diagnose.diagnoseResultE);
				$("#diagnoseAnswer").textbox("setValue",diagnose.diagnoseAnswer);
			}
		}
	})
});

function submitDiagnose() {
	$('#inputForm').form('submit', {
		onSubmit : function() {
			var flag = $(this).form('enableValidation').form('validate');
			if(flag){
				var json = $("#inputForm").serializeArray();
			  	var url = $(this).attr("action");
				$.post(url, json, function(data) {
					if (data.status) {
							//ok后的回调方法，去关闭父页面的窗口元素
							parent.open(data.nextStep);
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
		<form action="/lcsw/diagnose/next.action" method="post" id="inputForm">
			<input type="hidden" name="diagnoseId" id="diagnoseId">
			<table>
				<tr>
					<td>
						<label>请添加确诊信息：</label>
					</td>
				</tr>
				<tr>
					<td>
						<label>分值：</label>
					</td>
					<td>
						<input id="score" name="score" style='width:50px' class='easyui-numberbox' value='0'>
					</td>
				</tr>
				<tr>
					<td>
						<label for="diagnoseResultA">确诊选项A：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" id="diagnoseResultA" name="diagnoseResultA" data-options="required:true,multiline:true" style="height: 80px;width: 240px"></input>
					</td>
				</tr>
				<tr style="height: 30%;width: 50%">
					<td>
						<label for="diagnoseResultB">确诊选项B：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" id="diagnoseResultB" name="diagnoseResultB" data-options="required:true,multiline:true" style="height: 80px;width: 240px"></input>
					</td>
				</tr>
				<tr>
					<td>
						<label for="diagnoseResultC">确诊选项C：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" id="diagnoseResultC" name="diagnoseResultC" data-options="required:true,multiline:true" style="height: 80px;width: 240px">
					</td>
				</tr>
				<tr>
					<td>
						<label for="diagnoseResultD">确诊选项D：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" id="diagnoseResultD" name="diagnoseResultD" data-options="required:true,multiline:true" style="height: 80px;width: 240px">
					</td>
				</tr>
				<tr>
					<td>
						<label for="diagnoseResultE">确诊选项E：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" id="diagnoseResultE" name="diagnoseResultE" data-options="required:true,multiline:true" style="height: 80px;width: 240px">
					</td>
				</tr>
				<tr>
					<td>
						<label>请添加初诊信息分析：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" id="diagnoseAnswer" name="diagnoseAnswer" data-options="required:true,multiline:true" style="height: 80px;width: 240px">
					</td>
				</tr>
			</table>
	</form>
		<input type="hidden" id="step" value="4">
	</div>	
	<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
		<a id="last" href="#" onclick="last()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">上一步</a>  
		<a id="submit" href="#" onclick="submitDiagnose()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">下一步</a>  
		<a id="close" href="#" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
	</div>
	
	</div>
</body>
</html>