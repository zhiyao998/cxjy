<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common.jsp"%>
<link rel="stylesheet" type="text/css" href="/lcsw/public/bootstrap/css/bootstrap.min.css">
<script src="/lcsw/public/bootstrap/js/bootstrap-submenu.min.js" defer></script>
<script type="text/javascript" src="${ctx }/public/plugins/jquery.aCollapTable.min.js"></script>
<title>组卷列表</title>
<style type="text/css">
	table tr{
		height: auto;
	}
	
	table{
		border-radius: 4px;
		border: 1px solid #d0ddf4;
	}
	
	#count2,#count3{
		margin-right: 10px;
		width: 40px; 
		border-radius: 3px;
	}
	
	#all2,#all3,#all{
		width: 40px; 
		border-radius: 3px;
	}
	
	td, th {
	padding: 10px;
	line-height: 1.5;
	border: 1px solid #ddd;
	text-align: left;
}
</style>

<script type="text/javascript">
	$(function() {
		
		$('#types').aCollapTable({
		    startCollapsed: true,
		    addColumn: false,
		    plusButton: '<i class="glyphicon glyphicon-plus"></i> ', 
		    minusButton: '<i class="glyphicon glyphicon-minus"></i> ' 
		});

	});
	
	function sumbitData() {
		var map = new Array();
		var list = new Array();
		$("tbody td input").each(function() {
			var number = $(this).val();
			if(parseInt(number) > 0){
				var q = new Object();
				var tr = $(this).parent().parent();
				var td = $(tr).children()[0];
				q.ftheme = $(td).text(); 
				if($(this).attr("id") == "count2"){
					q.type = "A2";
				}else{
					q.type = "A3";
				}
				q.count = number;
				list.push(q);
			}
		});
		$.ajax({
		    headers: { 
		        'Accept': 'application/json',
		        'Content-Type': 'application/json' 
		    },
		    'type': 'POST',
		    'url': "/lcsw/TestPaperGen/genTestPaer.action",
		    'data':JSON.stringify(list),
		    'dataType': 'json',
		    'success': function(data) {
				alert(data);
		    }
		});	
	}
	
</script>

</head>
<body>
	<table id="types" class="table table-hover" width="100%" border="1" cellspacing="0" cellpadding="0">
	<thead>
		<tr>
			<th>病例类型</th>
			<th colspan="7">分支详情</th>
		</tr>
	</thead>
	<tbody>
        	<tr data-id="普通科" data-parent="">         
            	<td>普通科</td>
        	</tr>
        	<c:forEach items="${requestScope.cases }" var="c" varStatus="i">
        		<c:if test="${c.caseType == '普通科' }">
        			<tr data-id="${c.caseId }" data-parent="普通科">
        				<td>${c.caseTitle }</td>
        				<td><span>问诊:${c.inquiryCount }</span></td>
        				<td><span>体格检查:${c.phyEaxmCount }</span></td>
        				<td><span>初诊:${c.fstVisitCount }</span></td>
        				<td><span>辅助检查:${c.aryEaxmCount }</span></td>
        				<td><span>确诊:${c.diagnoseCount }</span></td>
        				<td><span>治疗方案:${c.treatmentCount }</span></td>
        				<td><span>病人管理:${c.patManCount }</span></td>
        			</tr>
        		</c:if>
        	</c:forEach>
        	<tr data-id="口腔科" data-parent=""> 
            	<td>口腔科</td>
        	</tr>
        	<c:forEach items="${requestScope.cases }" var="c" varStatus="i">
        		<c:if test="${c.caseType == '口腔科' }">
        			<tr data-id="${c.caseId }" data-parent="口腔科">
        				<td>${c.caseTitle }</td>
        				<td><span>问诊:${c.inquiryCount }</span></td>
        				<td><span>体格检查:${c.phyEaxmCount }</span></td>
        				<td><span>初诊:${c.fstVisitCount }</span></td>
        				<td><span>辅助检查:${c.aryEaxmCount }</span></td>
        				<td><span>确诊:${c.diagnoseCount }</span></td>
        				<td><span>治疗方案:${c.treatmentCount }</span></td>
        				<td><span>病人管理:${c.patManCount }</span></td>        			
        			</tr>
        		</c:if>
        	</c:forEach>
        	<tr data-id="内科" data-parent=""> 
            	<td>内科</td>
        	</tr>
        	<c:forEach items="${requestScope.cases }" var="c" varStatus="i">
        		<c:if test="${c.caseType == '内科' }">
        			<tr data-id="${c.caseId }" data-parent="内科">
        				<td>${c.caseTitle }</td>
        				<td><span>问诊:${c.inquiryCount }</span></td>
        				<td><span>体格检查:${c.phyEaxmCount }</span></td>
        				<td><span>初诊:${c.fstVisitCount }</span></td>
        				<td><span>辅助检查:${c.aryEaxmCount }</span></td>
        				<td><span>确诊:${c.diagnoseCount }</span></td>
        				<td><span>治疗方案:${c.treatmentCount }</span></td>
        				<td><span>病人管理:${c.patManCount }</span></td>        			
        			</tr>
        		</c:if>
        	</c:forEach>
        	<tr data-id="外科" data-parent=""> 
            	<td>外科</td>
        	</tr>
        	<c:forEach items="${requestScope.cases }" var="c" varStatus="i">
        		<c:if test="${c.caseType == '外科' }">
        			<tr data-id="${c.caseId }" data-parent="外科">
        				<td><span>问诊:${c.inquiryCount }</span></td>
        				<td><span>体格检查:${c.phyEaxmCount }</span></td>
        				<td><span>初诊:${c.fstVisitCount }</span></td>
        				<td><span>辅助检查:${c.aryEaxmCount }</span></td>
        				<td><span>确诊:${c.diagnoseCount }</span></td>
        				<td><span>治疗方案:${c.treatmentCount }</span></td>
        				<td><span>病人管理:${c.patManCount }</span></td>      			
        			</tr>
        		</c:if>
        	</c:forEach>
        	<tr data-id="胸外科" data-parent=""> 
            	<td>胸外科</td>
        	</tr>
        	<c:forEach items="${requestScope.cases }" var="c" varStatus="i">
        		<c:if test="${c.caseType == '胸外科' }">
        			<tr data-id="${c.caseId }" data-parent="胸外科">
        				<td>${c.caseTitle }</td>
        				<td><span>问诊:${c.inquiryCount }</span></td>
        				<td><span>体格检查:${c.phyEaxmCount }</span></td>
        				<td><span>初诊:${c.fstVisitCount }</span></td>
        				<td><span>辅助检查:${c.aryEaxmCount }</span></td>
        				<td><span>确诊:${c.diagnoseCount }</span></td>
        				<td><span>治疗方案:${c.treatmentCount }</span></td>
        				<td><span>病人管理:${c.patManCount }</span></td>         			
        			</tr>
        		</c:if>
        	</c:forEach>
       		<tr data-id="皮肤科" data-parent=""> 
            	<td>皮肤科</td>
        	</tr>
        	<c:forEach items="${requestScope.cases }" var="c" varStatus="i">
        		<c:if test="${c.caseType == '皮肤科' }">
        			<tr data-id="${c.caseId }" data-parent="皮肤科">
        				<td>${c.caseTitle }</td>
        				<td><span>问诊:${c.inquiryCount }</span></td>
        				<td><span>体格检查:${c.phyEaxmCount }</span></td>
        				<td><span>初诊:${c.fstVisitCount }</span></td>
        				<td><span>辅助检查:${c.aryEaxmCount }</span></td>
        				<td><span>确诊:${c.diagnoseCount }</span></td>
        				<td><span>治疗方案:${c.treatmentCount }</span></td>
        				<td><span>病人管理:${c.patManCount }</span></td>         			
        			</tr>
        		</c:if>
        	</c:forEach>
    </tbody>
<!-- 		<tfoot>
			<tr>
				<td>合计</td>
				<td><input id="all2" type="text" disabled="disabled" value="0">题</td>
				<td><input id="all3" type="text" disabled="disabled" value="0">题</td>
				<td><input id="all" type="text" disabled="disabled" value="0">题</td>
			</tr>
		</tfoot> -->
	</table>
	<div style="text-align: center;padding: 20px;">
			<a id="close" style="" href="#" onclick="sumbitData()" class="easyui-linkbutton" data-options="iconCls:'fa-check-circle'">提交</a>  
			<a id="close" href="#" onclick="back()" class="easyui-linkbutton" data-options="iconCls:'fa-window-close'">关闭</a>  
	</div>
	
</body>
</html>