<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增辅助检查信息：</title>
</head>
<body>
		<div class="easyui-layout" data-options="fit:true">
		
	<div data-options="region:'center',border:false" style="padding: 10px;">
		<form action="/lcsw/case/next.action" method="post" id="inputForm" enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						<label for="accessoryExamName">辅助检查项目：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" id="accessoryExamName" name="accessoryExamName" data-options="required:true">
					</td>
				</tr>
				<tr>
					<td>
						
					</td>
				</tr>
				<tr>
					<td>
						<label>检查结果：</label>
					</td>
					<td>
						<select class='easyui-combobox'>
							<option value="1">文字结果</option>
							<option value="2">图片结果</option>
							<option value="3">视频结果</option>
						</select>
					</td>
				</tr>
				<tr style="height: 30%;width: 50%">
					<td>
						<label for="accessoryExamResult">具体结果：</label>
					</td>
					<td>
						<input class="easyui-textbox" id="accessoryExamResult" name="accessoryExamResult" data-options="required:true,multiline:true" style="height: 80px;width: 240px"></input>
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