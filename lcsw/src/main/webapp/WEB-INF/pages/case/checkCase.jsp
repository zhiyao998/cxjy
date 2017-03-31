<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看病例</title>
<%@ include file="../../common.jsp"%>
<style type="text/css">
body{
	text-align: center;
	background-color: #FFFAF0;
}
#main{
	width: 100%;
	height: auto;
	text-align: center;
	background-color: #00FA9A;
}
#basic{
	margin: 30px;
	text-align: left;
}
#basic div {
	padding: 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#caseType option[value='" + ${requestScope.caseQuery.newCase.caseType} + "']").attr("selected","selected");
	})
</script>

</head>
<body>
	<div id="main">
		<label>基本信息</label>
		<div id="basic">
			<div>
				<label>病例名称</label>
				<label>${requestScope.caseQuery.newCase.caseTitle }</label>	
			</div>
			<div>
				<label>病人信息</label>
				<label>${requestScope.caseQuery.newCase.patientInfo }</label>
			</div>
			<div>
				<label>主诉</label>
				<label>${requestScope.caseQuery.newCase.chiefComplain }</label>
			</div>
			<div>
				<label>创建人</label>
				<label>${requestScope.caseQuery.newCase.creater }</label>
			</div>
			<div>
				<label>创建时间</label>
				<label>${requestScope.caseQuery.newCase.createTime }</label>
			</div>
			<div>
			<select id="caseType" disabled="disabled" >
				<option value="1">标准型</option>   
    			<option value="2">口腔科</option>   
    			<option value="3">内科</option>   
    			<option value="4">外科</option>   
    			<option value="5">胸外科</option>   
    			<option value="6">皮肤科</option> 
			</select>
			</div>
		</div>
	</div>
	<label>问诊信息</label>
	<div id="aa" class="easyui-accordion" style="width: 100%;height:500px;">   
    		<div title="一般情况及现病史" style="padding:10px;">
    			<table>
    				<thead>
    					<tr>
    						<th style='width: 200px'>问诊问题</th>
    						<th style='width: 200px'>病人回应</th>
    						<th>分值</th>
    					<tr>
    				</thead>
    				<tbody>
    				<c:forEach items="${requestScope.caseQuery.inquirys }" var="i">
    				<c:if test="${i.inquiryType == 1 }">
    						<tr><td><input class='easyui-textbox' style='height: 80px;width: 200px' disabled='true' data-options='multiline:true' value="${i.inquiryTitle }"></input></td>
    						<td><input class='easyui-textbox' style='height: 80px;width: 200px' disabled='true' type='text' data-options='multiline:true' value=" ${i.patientAnswer }"></input></td>
    						<td><input style='width:30px' disabled='true' class='easyui-numberbox' value='${i.score }'></td>
    					</c:if>
    				</c:forEach>
    				</tbody>
    			</table>	     
    		</div>   
    		<div title="系统回顾与既往史"  style="padding:10px;">
    		    <table>
    				<thead>
    					<tr>
    						<th style='width: 200px'>问诊问题</th>
    						<th style='width: 200px'>病人回应</th>
    						<th>分值</th>
    					<tr>
    				</thead>
    				<tbody>
    				<c:forEach items="${requestScope.caseQuery.inquirys }" var="i">
    				<c:if test="${i.inquiryType == 2 }">
    					<tr><td><input class='easyui-textbox' style='height: 80px;width: 200px' disabled='true' data-options='multiline:true' value="${i.inquiryTitle }"></input></td>
    					<td><input class='easyui-textbox' style='height: 80px;width: 200px' disabled='true' type='text' data-options='multiline:true' value=" ${i.patientAnswer }"></input></td>
    					<td><input style='width:30px' disabled='true' class='easyui-numberbox' value='${i.score }'></td>
    				</c:if>
    				</c:forEach>
    				</tbody>
    			</table>   
    		</div>   
    		<div title="个人史" style="padding:10px;"> 
    			<table>
    				<thead>
    					<tr>
    						<th style='width: 200px'>问诊问题</th>
    						<th style='width: 200px'>病人回应</th>
    						<th>分值</th>
    					<tr>
    				</thead>
    				<tbody>
    				<c:forEach items="${requestScope.caseQuery.inquirys }" var="i">
    				<c:if test="${i.inquiryType == 3 }">
    					<tr><td><input class='easyui-textbox' style='height: 80px;width: 200px' disabled='true' data-options='multiline:true' value="${i.inquiryTitle }"></input></td>
    					<td><input class='easyui-textbox' style='height: 80px;width: 200px' disabled='true' type='text' data-options='multiline:true' value=" ${i.patientAnswer }"></input></td>
    					<td><input style='width:30px' disabled='true' class='easyui-numberbox' value='${i.score }'></td>
    				</c:if>
    				</c:forEach>
    				</tbody>
    			</table>     
    		</div>   
	</div>
</body>
</html>