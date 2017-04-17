<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看病例</title>
<%@ include file="../../common.jsp"%>
<style type="text/css">
/* Border styles */
table thead, table tr {
border-top-width: 1px;
border-top-style: solid;
border-top-color: rgb(230, 189, 189);
}
table {
border-bottom-width: 1px;
border-bottom-style: solid;
border-bottom-color: rgb(230, 189, 189);
}

/* Padding and font style */
table td, table th {
padding: 5px 10px;
font-size: 12px;
font-family: Verdana;
color: rgb(177, 106, 104);
}

/* Alternating background colors */
table tr:nth-child(even) {
background: rgb(238, 211, 210)
}
table tr:nth-child(odd) {
background: #FFF
}

label{
	text-align:
	padding: 5px 10px;
	font-size: 12px;
	font-family: Verdana;
	color: rgb(177, 106, 104);
}

body{
	text-align: center;
	background-color: #FFFAF0;
}
#main{
	width: 100%;
	height: auto;
	text-align: center;
	background-color: #FFE4E1;
}
#basic{
	text-align: left;
}
#basic div {
	padding: 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#caseType option[value='" + ${sessionScope.CaseQuery.newCase.caseType} + "']").attr("selected","selected");
	});
</script>

</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center',border:false" style="padding: 10px;">
	<label>基本信息</label>
	<div id="main">
		<div id="basic">
			<div>
				<label>病例名称</label>
				<label>${sessionScope.CaseQuery.newCase.caseTitle }</label>	
			</div>
			<div>
				<label>主诉</label>
				<label>${sessionScope.CaseQuery.newCase.chiefComplain }</label>
			</div>
			<div>
				<label>创建人</label>
				<label>${sessionScope.CaseQuery.newCase.creater }</label>
			</div>
			<div>
				<label>创建时间</label>
				<label>${sessionScope.CaseQuery.newCase.createTime }</label>
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
	<c:if test="${not empty sessionScope.CaseQuery.inquirys}">
	<label>问诊信息</label>
	<table>
    	<thead>
    		<tr>
    			<th style='width: 200px'>问诊问题</th>
    			<th style='width: 200px'>病人回应</th>
    			<th>分值</th>
    			<th>分类</th>
    		<tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${sessionScope.CaseQuery.inquirys }" var="i"> 
    			<tr>
    				<td>${i.inquiryTitle }</td>
    				<td>${i.patientAnswer }</td>
    				<td>${i.score }</td>
    				<c:if test="${i.inquiryType == 1 }">
    					<td>一般情况及现病史</td>
    				</c:if>
    				<c:if test="${i.inquiryType == 2 }">
    					<td>系统回顾与既往史</td>
    				</c:if>
    				<c:if test="${i.inquiryType == 3 }">
    					<td>个人史</td>
    				</c:if>
    			</tr>
    		</c:forEach>  
    	</tbody>
    </table>	       
	</c:if>
	<c:if test="${not empty sessionScope.CaseQuery.physicalExams}">
	<label>体检信息</label>
	<table>
    	<thead>
    		<tr>
    			<th style='width: 200px'>体检项目</th>
    			<th style='width: 200px'>体检结果</th>
    			<th>分值</th>
    			<td>分类</td>
    		<tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${sessionScope.CaseQuery.physicalExams }" var="p">   
			 	<tr>
			 		<td>${p.physicalExamName }</td>
    				<td>${p.physicalExamResult }</td>
    				<td>${p.score }</td>
    				<c:if test="${p.physicalExamType == 1 }">
    					<td>生命特征</td>
    				</c:if>
    				<c:if test="${p.physicalExamType == 2 }">
    					<td>一般情况</td>
    				</c:if>
    				<c:if test="${p.physicalExamType == 3 }">
    					<td>皮肤粘膜</td>
    				</c:if>
    				<c:if test="${p.physicalExamType == 3 }">
    					<td>淋巴结</td>
    				</c:if>
    				<c:if test="${p.physicalExamType == 4 }">
    					<td>头颈部</td>
    				</c:if>
    				<c:if test="${p.physicalExamType == 5 }">
    					<td>胸</td>
    				</c:if>
    				<c:if test="${p.physicalExamType == 6 }">
    					<td>肺</td>
    				</c:if>
    			</tr>
    				
    		</c:forEach> 
    	</tbody>
    </table>          
	</c:if>
	<c:if test="${not empty sessionScope.CaseQuery.firstVisit}">
	<label>初诊信息</label>
	<div style="width: 100%">
		<table>
				<tr>
					<td>
						<label>分值：</label>
					</td>
					<td>
						${sessionScope.CaseQuery.firstVisit.score }
					</td>
				</tr>
				<tr>
					<td>
						<label for="fvResultA">确诊选项A：</label>
					</td>
					<td>
						${sessionScope.CaseQuery.firstVisit.fvResultA }
					</td>
				</tr>
				<tr style="height: 30%;width: 50%">
					<td>
						<label for="fvResultB">确诊选项B：</label>
					</td>
					<td>
						${sessionScope.CaseQuery.firstVisit.fvResultB }
					</td>
				</tr>
				<tr>
					<td>
						<label for="fvResultC">确诊选项C：</label>
					</td>
					<td>
							${sessionScope.CaseQuery.firstVisit.fvResultC }
					</td>
				</tr>
				<tr>
					<td>
						<label for="fvResultD">确诊选项D：</label>
					</td>
					<td>
						${sessionScope.CaseQuery.firstVisit.fvResultD }
					</td>
				</tr>
				<tr>
					<td>
						<label for="fvResultE">确诊选项E：</label>
					</td>
					<td>
						${sessionScope.CaseQuery.firstVisit.fvResultE }
					</td>
				</tr>
				<tr>
					<td>
						<label>请添加初诊信息分析：</label>
					</td>
					<td>
						${sessionScope.CaseQuery.firstVisit.analysis }
					</td>
				</tr>
			</table>
	</div>
	</c:if>
	<c:if test="${not empty sessionScope.CaseQuery.accessoryExams}">
	<div id="accessoryExams">
		<label>实验室检查</label>
		<div style="width: 100%">
			<table>
				<thead>
					<tr>
						<th>项目名称</th>
						<th>检验结果</th>
						<th>单位</th>
						<th>参考范围</th>
						<th>分值</th>
					<tr>
				</thead>
				<tbody>
				<c:forEach items="${sessionScope.CaseQuery.accessoryExams }" var="a">
					<c:if test="${a.resultType == 1 }">
						<tr>
							<td>${a.accessoryExamName }</td>
							<td>${a.accessoryExamResult }</td>
							<td>mg</td>
							<td>1~100</td>
							<td>${a.score }</td>
						</tr>
					</c:if>
				</c:forEach>
				</tbody>
			</table>		
		</div>
		<label>影像检查</label>
		<div style="width: 100%">
			<c:forEach items="${sessionScope.CaseQuery.accessoryExams }" var="a">
				<c:if test="${a.resultType == 2 }">
					<label>${a.accessoryExamName }</label>
					<img alt="" src="${a.accessoryExamResult }">
				</c:if>
			</c:forEach>
		</div>
	</div>
	</c:if>
	<c:if test="${not empty sessionScope.CaseQuery.diagnose}">
	<label>确诊信息</label>
	<div id="diagnose" style="width: 100%">
		<table>
				<tr>
					<td>
						<label>分值：</label>
					</td>
					<td>
						<input style='width:50px' disabled='true' class='easyui-numberbox' value="${sessionScope.CaseQuery.diagnose.score }">
					</td>
				</tr>
				<tr>
					<td>
						<label for="fvResultA">确诊选项A：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" disabled='true'  data-options="multiline:true" style="height: 80px;width: 240px" value="${sessionScope.CaseQuery.diagnose.diagnoseResultA }">
					</td>
				</tr>
				<tr style="height: 30%;width: 50%">
					<td>
						<label for="fvResultB">确诊选项B：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" disabled='true' data-options="multiline:true" style="height: 80px;width: 240px" value="${sessionScope.CaseQuery.diagnose.diagnoseResultB }">
					</td>
				</tr>
				<tr>
					<td>
						<label for="fvResultC">确诊选项C：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" disabled='true' data-options="multiline:true" style="height: 80px;width: 240px" value="${sessionScope.CaseQuery.diagnose.diagnoseResultC }">
					</td>
				</tr>
				<tr>
					<td>
						<label for="fvResultD">确诊选项D：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" disabled='true' data-options="multiline:true" style="height: 80px;width: 240px" value="${sessionScope.CaseQuery.diagnose.diagnoseResultD }">
					</td>
				</tr>
				<tr>
					<td>
						<label for="fvResultE">确诊选项E：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" disabled='true' data-options="multiline:true" style="height: 80px;width: 240px" value="${sessionScope.CaseQuery.diagnose.diagnoseResultE }">
					</td>
				</tr>
				<tr>
					<td>
						<label>请添加确诊信息分析：</label>
					</td>
					<td>
						<input class="easyui-textbox" type="text" disabled='true' data-options="multiline:true" style="height: 80px;width: 240px" value="${sessionScope.CaseQuery.diagnose.diagnoseAnswer }">
					</td>
				</tr>
			</table>
	</div>
	</c:if>
	<c:if test="${not empty sessionScope.CaseQuery.treatments}">
	<label>治疗方案</label>
	<div>
		<table>
				<thead>
					<tr>
						<th>治疗方案</th>
						<th>分值</th>
					<tr>
				</thead>
				<tbody>
				<c:forEach items="${sessionScope.CaseQuery.treatments}" var="t">
						<tr>
							<td>${t.treatmentPlan }</td>
							<td>${t.score }</td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
	</div>
	</c:if>
	<c:if test="${not empty sessionScope.CaseQuery.patientManagements}">
	<label>病人管理</label>
	<div>
		<table>
				<thead>
					<tr>
						<th>管理方案</th>
						<th>分值</th>
					<tr>
				</thead>
				<tbody>
				<c:forEach items="${sessionScope.CaseQuery.patientManagements}" var="pm">
						<tr>
							<td>${pm.managementPlan }</td>
							<td>${pm.score }</td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
	</div>
	</c:if>
	</div>
		<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3"> 
			<a id="close" href="#" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
		</div>
	</div>
</body>
</html>