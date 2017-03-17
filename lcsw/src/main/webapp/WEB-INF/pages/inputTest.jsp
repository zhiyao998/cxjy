<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>input Test</title>
</head>
<body>
	请输入查询的病历号：
	<form action="/lcsw/case/list.action" method="post">
		<input type="text" id="caseid" name="caseid">
		<input type="submit">
	</form>
	
	插入病例：
	<form action="/lcsw/case/insert.action" method="post">
		病例标题：<input type="text" name="caseTitle">
		<br>
		病人信息：<input type="text" name="patientInfo">
		<br>
		主诉：&nbsp;&nbsp;<input type="text" name="chiefComplain">
		<br>
		创建人：&nbsp;<input type="text" name="creater">
		<br>
		创建时间：<input type="text" name="createTime">
		<br>
		病例类型：<input type="text" name="caseType">
		
		<input type="submit">
	</form>
</body>
</html>