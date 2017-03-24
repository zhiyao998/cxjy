<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>初诊信息</title>
<%@ include file="../../common.jsp"%>
<script type="text/javascript">
function submitFirstVisit() {
	$('#inputForm').form('submit', {
		onSubmit : function() {
			var flag = $(this).form('enableValidation').form('validate');
			if(flag){
				var json = $("#inputForm").serializeArray();
			  	var url = $(this).attr("action");
				$.post(url, json, function(data) {
					if (data.status) {
							//ok后的回调方法，去关闭父页面的窗口元素
//							parent.open($("#nextTitle").val(),$("#nextUrl").val(),$("#nextWidth").val(),$("#nextHight").val());
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
		<form action="/lcsw/firstVisit/next.action" method="post" id="inputForm">
			<table>
				<tr>
					<td>
						<label>请添加确诊信息：</label>
					</td>
					<td>
						<select class='easyui-combobox' id="score" name="score" style="width: 60px;">    
							<option value='-3'>-3</option>
							<option>-2</option>
							<option>-1</option>
							<option selected = 'selected'>0</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<label for="fvResultA">确诊选项A：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" id="fvResultA" name="fvResultA" data-options="required:true,multiline:true" style="height: 80px;width: 240px"></input>
					</td>
				</tr>
				<tr style="height: 30%;width: 50%">
					<td>
						<label for="fvResultB">确诊选项B：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" id="fvResultB" name="fvResultB" data-options="required:true,multiline:true" style="height: 80px;width: 240px"></input>
					</td>
				</tr>
				<tr>
					<td>
						<label for="fvResultC">确诊选项C：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" id="fvResultC" name="fvResultC" data-options="required:true,multiline:true" style="height: 80px;width: 240px">
					</td>
				</tr>
				<tr>
					<td>
						<label for="fvResultD">确诊选项D：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" id="fvResultD" name="fvResultD" data-options="required:true,multiline:true" style="height: 80px;width: 240px">
					</td>
				</tr>
				<tr>
					<td>
						<label for="fvResultE">确诊选项E：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" id="fvResultE" name="fvResultE" data-options="required:true,multiline:true" style="height: 80px;width: 240px">
					</td>
				</tr>
				<tr>
					<td>
						<label>请添加初诊信息分析：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" id="analysis" name="analysis" data-options="required:true,multiline:true" style="height: 80px;width: 240px">
					</td>
				</tr>
			</table>
			<input type="hidden" name="creater" value="rongyu">
		</form>
			<input type="hidden" id="nextUrl" value="/lcsw/inquiry/toAdd.action">
			<input type="hidden" id="nextTitle" value="添加问诊信息">
			<input type="hidden" id="nextHight" value="600">
			<input type="hidden" id="nextWidth" value="800">
			<input type="hidden" id="lastUrl" value="/lcsw/physicalExam/toAddPhysicalExam.action">
			<input type="hidden" id="lastTitle" value="添加体检信息">
			<input type="hidden" id="lastHight" value="600">
			<input type="hidden" id="lastWidth" value="800">
	</div>	
	<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
		<a id="last" href="#" onclick="last()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">上一步</a>  
		<a id="submit" href="#" onclick="submitFirstVisit()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">下一步</a>  
		<a id="close" href="#" onclick="parent.$('#${windowid}').window('close')" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
	</div>
	
	</div>
</body>
</html>