<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common.jsp"%>
<title>Insert title here</title>
<style type="text/css">
	tr{
		color: blue;
		padding: 20px;
	}
</style>
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
						<textarea rows="5" cols="30" class="easyui-textbox" name="patientInfo" data-options="required:true"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label for="chiefComplain">主诉：</label>
					</td>
					<td>
						<textarea rows="5" cols="30" class="easyui-textbox" name="chiefComplain" data-options="required:true"></textarea>
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
			<input type="hidden" id="createTime" name="createTime" value="">
			<input type="hidden" name="creater" value="rongyu">
		</form>
	</div>	
	<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
		<a id="submit" href="#" onclick="$('#inputForm').submit()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">下一步</a>  
		<a id="close" href="#" onclick="parent.$('#${windowid}').window('close')" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
	</div>
	</div>
	</div>
<script type="text/javascript">
function getNowFormatDate() {
    var date = new Date();
    var seperator = "-";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator + month + seperator + strDate;
    return currentdate;
}

var nowtime = getNowFormatDate();
$("#createTime").val(nowtime);
</script>
</body>
</html>