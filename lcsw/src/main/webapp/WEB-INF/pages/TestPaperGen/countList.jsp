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
		
		$(":checkbox").change(function() {
			var tr = $(this).parent().parent();
			var total = $("#total");
			if($(this).is(':checked')){
				for(var i = 1; i <= 7; i++){
					var td = $(tr).children()[i];
					var span = $(td).children()[0];
					var totaltd = $(total).children()[i];
					var input = $(totaltd).children()[0];
					var spancount = parseInt($(span).text());
					var inputcount = parseInt($(input).val())
					$(input).val(spancount + inputcount);
				}
			}else{
				for(var i = 1; i <= 7; i++){
					var td = $(tr).children()[i];
					var span = $(td).children()[0];
					var totaltd = $(total).children()[i];
					var input = $(totaltd).children()[0];
					var spancount = parseInt($(span).text());
					var inputcount = parseInt($(input).val())
					$(input).val(inputcount - spancount);
				}
			}
		})
	});
	
	function sumbitData() {
		var ids = new Array();
		$("input:checked").each(function() {
			var input = $(this).next();
			var id = $(input).val();
			ids.push(id);
		});
		var url = '/lcsw/TestPaperGen/genTestPaper.action?ids=' + ids;
		var tab = window.parent.$('#tabs').tabs('getSelected');
		window.parent.$('#tabs').tabs('update', {
			tab: tab,
			options: {
				title: '出卷',
 				/* href: url  // 新内容的URL  */
 				content: createFrame(url)
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
			<th>问诊</th>
			<th>体格检查</th>
			<th>初步诊断</th>
			<th>辅助检查</th>
			<th>确诊</th>
			<th>治疗方案</th>
			<th>病人管理</th>
		</tr>
	</thead>
	<tbody>
        	<tr data-id="普通科" data-parent="">         
            	<td>普通科</td>
            	<td><span>问诊:${requestScope.typeCount.普通科.问诊 }</span></td>
         		<td><span>体格检查:${requestScope.typeCount.普通科.体格检查 }</span></td>
        		<td><span>初步诊断:${requestScope.typeCount.普通科.初步诊断 }</span></td>
        		<td><span>辅助检查:${requestScope.typeCount.普通科.辅助检查 }</span></td>
        		<td><span>确诊:${requestScope.typeCount.普通科.确诊 }</span></td>
        		<td><span>治疗方案:${requestScope.typeCount.普通科.治疗方案 }</span></td>
        		<td><span>病人管理:${requestScope.typeCount.普通科.病人管理 }</span></td>
        	</tr>
        	<c:forEach items="${requestScope.cases }" var="c" varStatus="i">
        		<c:if test="${c.caseType == '普通科' }">
        			<tr data-id="${c.caseId }" data-parent="普通科">
        				<td>${c.caseTitle }</td>
        				<td><span>${c.inquiryCount }</span></td>
        				<td><span>${c.phyExamCount }</span></td>
        				<td><span>${c.fstVisitCount }</span></td>
        				<td><span>${c.aryExamCount }</span></td>
        				<td><span>${c.diagnoseCount }</span></td>
        				<td><span>${c.treatmentCount }</span></td>
        				<td><span>${c.patManCount }</span></td>
        				<td><input type="checkbox"><input type="hidden" value="${c.caseId }"></td>
        			</tr>
        		</c:if>
        	</c:forEach>
        	<tr data-id="口腔科" data-parent=""> 
            	<td>口腔科</td>            	
            	<td><span>问诊:${requestScope.typeCount.口腔科.问诊 }</span></td>
         		<td><span>体格检查:${requestScope.typeCount.口腔科.体格检查 }</span></td>
        		<td><span>初步诊断:${requestScope.typeCount.口腔科.初步诊断 }</span></td>
        		<td><span>辅助检查:${requestScope.typeCount.口腔科.辅助检查 }</span></td>
        		<td><span>确诊:${requestScope.typeCount.口腔科.确诊 }</span></td>
        		<td><span>治疗方案:${requestScope.typeCount.口腔科.治疗方案 }</span></td>
        		<td><span>病人管理:${requestScope.typeCount.口腔科.病人管理 }</span></td> 
        	</tr>
        	<c:forEach items="${requestScope.cases }" var="c" varStatus="i">
        		<c:if test="${c.caseType == '口腔科' }">
        			<tr data-id="${c.caseId }" data-parent="口腔科">
        				<td>${c.caseTitle }</td>
        				<td><span>${c.inquiryCount }</span></td>
        				<td><span>${c.phyExamCount }</span></td>
        				<td><span>${c.fstVisitCount }</span></td>
        				<td><span>${c.aryExamCount }</span></td>
        				<td><span>${c.diagnoseCount }</span></td>
        				<td><span>${c.treatmentCount }</span></td>
        				<td><span>${c.patManCount }</span></td>
        				<td><input type="checkbox"><input type="hidden" value="${c.caseId }"></td>       			
        			</tr>
        		</c:if>
        	</c:forEach>
        	<tr data-id="内科" data-parent=""> 
            	<td>内科</td>
            	<td><span>问诊:${requestScope.typeCount.内科.问诊 }</span></td>
         		<td><span>体格检查:${requestScope.typeCount.内科.体格检查 }</span></td>
        		<td><span>初步诊断:${requestScope.typeCount.内科.初步诊断 }</span></td>
        		<td><span>辅助检查:${requestScope.typeCount.内科.辅助检查 }</span></td>
        		<td><span>确诊:${requestScope.typeCount.内科.确诊 }</span></td>
        		<td><span>治疗方案:${requestScope.typeCount.内科.治疗方案 }</span></td>
        		<td><span>病人管理:${requestScope.typeCount.内科.病人管理 }</span></td>
        	</tr>
        	<c:forEach items="${requestScope.cases }" var="c" varStatus="i">
        		<c:if test="${c.caseType == '内科' }">
        			<tr data-id="${c.caseId }" data-parent="内科">
        				<td>${c.caseTitle }</td>
        				<td><span>${c.inquiryCount }</span></td>
        				<td><span>${c.phyExamCount }</span></td>
        				<td><span>${c.fstVisitCount }</span></td>
        				<td><span>${c.aryExamCount }</span></td>
        				<td><span>${c.diagnoseCount }</span></td>
        				<td><span>${c.treatmentCount }</span></td>
        				<td><span>${c.patManCount }</span></td> 
        				<td><input type="checkbox"><input type="hidden" value="${c.caseId }"></td>      			
        			</tr>
        		</c:if>
        	</c:forEach>
        	<tr data-id="外科" data-parent=""> 
            	<td>外科</td>
            	<td><span>问诊:${requestScope.typeCount.外科.问诊 }</span></td>
         		<td><span>体格检查:${requestScope.typeCount.外科.体格检查 }</span></td>
        		<td><span>初步诊断:${requestScope.typeCount.外科.初步诊断 }</span></td>
        		<td><span>辅助检查:${requestScope.typeCount.外科.辅助检查 }</span></td>
        		<td><span>确诊:${requestScope.typeCount.外科.确诊 }</span></td>
        		<td><span>治疗方案:${requestScope.typeCount.外科.治疗方案 }</span></td>
        		<td><span>病人管理:${requestScope.typeCount.外科.病人管理 }</span></td>
        	</tr>
        	<c:forEach items="${requestScope.cases }" var="c" varStatus="i">
        		<c:if test="${c.caseType == '外科' }">
        			<tr data-id="${c.caseId }" data-parent="外科">
        				<td>${c.caseTitle }</td>
        				<td><span>${c.inquiryCount }</span></td>
        				<td><span>${c.phyExamCount }</span></td>
        				<td><span>${c.fstVisitCount }</span></td>
        				<td><span>${c.aryExamCount }</span></td>
        				<td><span>${c.diagnoseCount }</span></td>
        				<td><span>${c.treatmentCount }</span></td>
        				<td><span>${c.patManCount }</span></td>
        				<td><input type="checkbox"><input type="hidden" value="${c.caseId }"></td>     			
        			</tr>
        		</c:if>
        	</c:forEach>
        	<tr data-id="胸外科" data-parent=""> 
            	<td>胸外科</td>
            	<td><span>问诊:${requestScope.typeCount.胸外科.问诊 }</span></td>
         		<td><span>体格检查:${requestScope.typeCount.胸外科.体格检查 }</span></td>
        		<td><span>初步诊断:${requestScope.typeCount.胸外科.初步诊断 }</span></td>
        		<td><span>辅助检查:${requestScope.typeCount.胸外科.辅助检查 }</span></td>
        		<td><span>确诊:${requestScope.typeCount.胸外科.确诊 }</span></td>
        		<td><span>治疗方案:${requestScope.typeCount.胸外科.治疗方案 }</span></td>
        		<td><span>病人管理:${requestScope.typeCount.胸外科.病人管理 }</span></td>
        	</tr>
        	<c:forEach items="${requestScope.cases }" var="c" varStatus="i">
        		<c:if test="${c.caseType == '胸外科' }">
        			<tr data-id="${c.caseId }" data-parent="胸外科">
        				<td>${c.caseTitle }</td>
        				<td><span>${c.inquiryCount }</span></td>
        				<td><span>${c.phyExamCount }</span></td>
        				<td><span>${c.fstVisitCount }</span></td>
        				<td><span>${c.aryExamCount }</span></td>
        				<td><span>${c.diagnoseCount }</span></td>
        				<td><span>${c.treatmentCount }</span></td>
        				<td><span>${c.patManCount }</span></td>
        				<td><input type="checkbox"><input type="hidden" value="${c.caseId }"></td>         			
        			</tr>
        		</c:if>
        	</c:forEach>
       		<tr data-id="皮肤科" data-parent=""> 
            	<td>皮肤科</td>
            	<td><span>问诊:${requestScope.typeCount.皮肤科.问诊 }</span></td>
         		<td><span>体格检查:${requestScope.typeCount.皮肤科.体格检查 }</span></td>
        		<td><span>初步诊断:${requestScope.typeCount.皮肤科.初步诊断 }</span></td>
        		<td><span>辅助检查:${requestScope.typeCount.皮肤科.辅助检查 }</span></td>
        		<td><span>确诊:${requestScope.typeCount.皮肤科.确诊 }</span></td>
        		<td><span>治疗方案:${requestScope.typeCount.皮肤科.治疗方案 }</span></td>
        		<td><span>病人管理:${requestScope.typeCount.皮肤科.病人管理 }</span></td>
        	</tr>
        	<c:forEach items="${requestScope.cases }" var="c" varStatus="i">
        		<c:if test="${c.caseType == '皮肤科' }">
        			<tr data-id="${c.caseId }" data-parent="皮肤科">
        				<td>${c.caseTitle }</td>
        				<td><span>${c.inquiryCount }</span></td>
        				<td><span>${c.phyExamCount }</span></td>
        				<td><span>${c.fstVisitCount }</span></td>
        				<td><span>${c.aryExamCount }</span></td>
        				<td><span>${c.diagnoseCount }</span></td>
        				<td><span>${c.treatmentCount }</span></td>
        				<td><span>${c.patManCount }</span></td>
        				<td><input type="checkbox"><input type="hidden" value="${c.caseId }"></td>         			
        			</tr>
        		</c:if>
        	</c:forEach>
    </tbody>
		<tfoot>
			<tr id = "total">
				<td>合计</td>
				<td><input type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
				<td><input type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
				<td><input type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
				<td><input type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
				<td><input type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
				<td><input type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
				<td><input type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
			</tr>
		</tfoot>
	</table>
	<div style="text-align: center;padding: 20px;">
			<shiro:hasPermission name="paperGen:show">
				<a id="close" style="" href="#" onclick="sumbitData()" class="easyui-linkbutton" data-options="iconCls:'fa-check-circle'">提交</a>  
			</shiro:hasPermission>
			<a id="close" href="#" onclick="back()" class="easyui-linkbutton" data-options="iconCls:'fa-window-close'">关闭</a>  
	</div>
	
</body>
</html>