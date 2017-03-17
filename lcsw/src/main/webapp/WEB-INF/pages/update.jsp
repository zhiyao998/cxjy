<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	//清除页面缓存
	response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1    
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0    
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server   
	String ctx = request.getContextPath();
	request.setAttribute("ctx", ctx);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="/lcsw/js/jquery.min.js"></script>
<title>update</title>
<script type="text/javascript">
 $(function(){
	$("#queryBtn").click(function () {
		$(this).hide;
		$.ajax({
			type:'post',
			url:"/lcsw/case/queryOne.action",
			data:{"caseid":$("#query").val()},
			dataType:"json",
			success:function(data){
				$("#caseId").val(data.caseId);
				$("#caseTitle").val(data.caseTitle);
				$("#patientInfo").val(data.patientInfo);
				$("#chiefComplain").val(data.chiefComplain);
				$("#caseType").val(data.caseType);
				$("#creater").val(data.creater);
				$("#createTime").val(data.createTime);
			}
			
		})
	});
	$("#updateBtn").click(function () {
		$(this).hide;
		$.ajax({
			type:'post',
			url:"/lcsw/case/updateCase.action",
			data:{
				"caseId":$("#caseId").val(),
				"caseTitle":$("#caseTitle").val(),
				"patientInfo":$("#patientInfo").val(),
				"chiefComplain":$("#chiefComplain").val(),
				"creater":$("#creater").val(),
				"createTime":$("#createTime").val(),
				"caseType":$("#caseType").val(),
			},
			dataType:"json",
			success:function(data){
				alert(data.status);
			}
			
		})
	});
}); 
</script>

</head>
<body> 
	查询更改数据：<input type="text" id="query"><input type="button" value="查询" id="queryBtn">
	<br>
	更新病例：
	<form>
		<input type="hidden" name="caseId" id="caseId">
	
		病例标题：<input type="text" name="caseTitle" id="caseTitle">
		<br>
		病人信息：<input type="text" name="patientInfo" id="patientInfo">
		<br>
		主诉：&nbsp;&nbsp;<input type="text" name="chiefComplain" id="chiefComplain">
		<br>
		创建人：&nbsp;<input type="text" name="creater" id="creater">
		<br>
		创建时间：<input type="text" name="createTime" id="createTime">
		<br>
		病例类型：<input type="text" name="caseType" id="caseType">
		
		<input type="button" value="更改" id="updateBtn">
	</form>
</body>
</html>