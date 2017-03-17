<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CaseTest</title>
</head>
<body>
	<table>
		<tr>
			<td>caseId</td>
			<td>caseTitle</td>
			<td>patientInfo</td>
			<td>chiefComplain</td>
			<td>createTime</td>
			<td>creater</td>
			<td>caseType</td>
		</tr>
		<tr>
			<td>${cases.caseId }</td>
			<td>${cases.caseTitle }</td>
			<td>${cases.patientInfo }</td>
			<td>${cases.chiefComplain }</td>
			<td>${cases.createTime }</td>
			<td>${cases.creater }</td>
			<td>${cases.caseType }</td>
		</tr>
	
	</table>
	
</body>
</html>