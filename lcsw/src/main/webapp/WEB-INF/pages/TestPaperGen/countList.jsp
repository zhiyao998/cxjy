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
		
/* 		$('#types').aCollapTable({
		    startCollapsed: true,
		    addColumn: false,
		    plusButton: '<i class="glyphicon glyphicon-plus"></i> ', 
		    minusButton: '<i class="glyphicon glyphicon-minus"></i> ' 
		}); */
		
		$("input:enabled").change(function() {
			var tr = $(this).parent().parent();
			var tds = tr.children();
			var parent = $(this).parent();
			var total = $("#total");
			var span = $(this).next();
			var index = $(tds).index($(parent));
			if(parseInt($(span).text()) >= parseInt($(this).val()) && parseInt($(this).val()) >= 0){
				switch (index) {
				case 1:
					updateCount(1,total);
					break;
				case 2:
					updateCount(2,total);
					break;
				case 3:
					updateCount(3,total);
					break;
				case 4:
					updateCount(4,total);
					break;
				case 5:
					updateCount(5,total);
					break;
				case 6:
					updateCount(6,total);
					break;
				default:
					updateCount(7,total);
					break;
				}
			}else{
				alert("请填写正确的题目数量!");
				$(this).val(0);
				switch (index) {
				case 1:
					updateCount(1,total);
					break;
				case 2:
					updateCount(2,total);
					break;
				case 3:
					updateCount(3,total);
					break;
				case 4:
					updateCount(4,total);
					break;
				case 5:
					updateCount(5,total);
					break;
				case 6:
					updateCount(6,total);
					break;
				default:
					updateCount(7,total);
					break;
				}
			}

		})

	});
	
	function sumbitData() {
		var counts = new Array();
		$("tbody tr").each(function() {
			var children = $(this).children();
			var count = new Object();
			var total = 0;
			$(children).each(function(i,val) {
				var input = $(val).children()[0];
				if(i > 0){
					total = parseInt(total) + parseInt($(input).val());
				}
				switch (i) {
				case 0:
					count.caseType = $(val).text();
					break;
				case 1:
					count.inquiryCount = $(input).val();
					break;
				case 2:
					count.phyExamCount = $(input).val();
					break;
				case 3:
					count.fstVisitCount = $(input).val();
					break;
				case 4:
					count.aryExamCount = $(input).val();
					break;
				case 5:
					count.diagnoseCount = $(input).val();
					break;
				case 6:
					count.treatmentCount = $(input).val();
					break;
				default:
					count.patManCount = $(input).val();
					break;
				}
			});
			count.total = total;
			counts.push(count);
		});
		alert(JSON.stringify(counts));
		$.ajax({
		    headers: { 
		        'Accept': 'application/json',
		        'Content-Type': 'application/json' 
		    },
		    'type': 'POST',
		    'url': "/lcsw/TestPaperGen/genTestPaper.action",
		    'data': JSON.stringify(counts),		    
		    'dataType': 'json',
		    'success': function(data) {
		    	if(data.status){
		    		var tab = window.parent.$('#tabs').tabs('getSelected');
					window.parent.$('#tabs').tabs('update', {
						tab: tab,
						options: {
							title: "出卷",
							content: createFrame(data.url) // 新内容的URL
						}
					});
		    	}
			}
		});
	}
	
	function updateCount(index,total) {
		var sum = 0;
		var td = $(total).children()[index];
		var input = $(td).children()[0];
		$("tbody tr").each(function(i,val) {
			var tr = val;
			var ttd = $(tr).children()[index];
			var input1 = $($(ttd)).children()[0];
			sum = parseInt(sum) + parseInt($(input1).val());
		});
		$(input).val(sum);
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
            	<td><c:choose><c:when test="${requestScope.typeCount.普通科.问诊  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.普通科.问诊 }</span></td>
         		<td><c:choose><c:when test="${requestScope.typeCount.普通科.体格检查  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.普通科.体格检查 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.普通科.初步诊断  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.普通科.初步诊断 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.普通科.辅助检查  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.普通科.辅助检查 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.普通科.确诊  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.普通科.确诊 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.普通科.治疗方案  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.普通科.治疗方案 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.普通科.病人管理  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.普通科.病人管理 }</span></td>
        	</tr>
        	<tr data-id="口腔科" data-parent=""> 
            	<td>口腔科</td>            	
            	<td><c:choose><c:when test="${requestScope.typeCount.口腔科.问诊  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.口腔科.问诊 }</span></td>
         		<td><c:choose><c:when test="${requestScope.typeCount.口腔科.体格检查  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.口腔科.体格检查 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.口腔科.初步诊断  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.口腔科.初步诊断 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.口腔科.辅助检查  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.口腔科.辅助检查 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.口腔科.确诊  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.口腔科.确诊 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.口腔科.治疗方案  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.口腔科.治疗方案 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.口腔科.病人管理  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.口腔科.病人管理 }</span></td> 
        	</tr>
        	<tr data-id="内科" data-parent=""> 
            	<td>内科</td>
            	<td><c:choose><c:when test="${requestScope.typeCount.内科.问诊  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.内科.问诊 }</span></td>
         		<td><c:choose><c:when test="${requestScope.typeCount.内科.体格检查  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.内科.体格检查 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.内科.初步诊断  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.内科.初步诊断 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.内科.辅助检查  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.内科.辅助检查 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.内科.确诊  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.内科.确诊 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.内科.治疗方案  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.内科.治疗方案 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.内科.病人管理  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.内科.病人管理 }</span></td>
        	</tr>
        	<tr data-id="外科" data-parent=""> 
            	<td>外科</td>
            	<td><c:choose><c:when test="${requestScope.typeCount.外科.问诊  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.外科.问诊 }</span></td>
         		<td><c:choose><c:when test="${requestScope.typeCount.外科.体格检查  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.外科.体格检查 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.外科.初步诊断  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.外科.初步诊断 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.外科.辅助检查  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.外科.辅助检查 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.外科.确诊  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.外科.确诊 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.外科.治疗方案  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.外科.治疗方案 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.外科.病人管理  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.外科.病人管理 }</span></td>
        	</tr>
        	<tr data-id="胸外科" data-parent=""> 
            	<td>胸外科</td>
            	<td><c:choose><c:when test="${requestScope.typeCount.胸外科.问诊  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.胸外科.问诊 }</span></td>
         		<td><c:choose><c:when test="${requestScope.typeCount.胸外科.体格检查  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.胸外科.体格检查 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.胸外科.初步诊断  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.胸外科.初步诊断 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.胸外科.辅助检查  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.胸外科.辅助检查 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.胸外科.确诊  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.胸外科.确诊 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.胸外科.治疗方案  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.胸外科.治疗方案 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.胸外科.病人管理  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.胸外科.病人管理 }</span></td>
        	</tr>
       		<tr data-id="皮肤科" data-parent=""> 
            	<td>皮肤科</td>
            	<td><c:choose><c:when test="${requestScope.typeCount.皮肤科.问诊  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.皮肤科.问诊 }</span></td>
         		<td><c:choose><c:when test="${requestScope.typeCount.皮肤科.体格检查  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.皮肤科.体格检查 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.皮肤科.初步诊断  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.皮肤科.初步诊断 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.皮肤科.辅助检查  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.皮肤科.辅助检查 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.皮肤科.确诊  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.皮肤科.确诊 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.皮肤科.治疗方案  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.皮肤科.治疗方案 }</span></td>
        		<td><c:choose><c:when test="${requestScope.typeCount.皮肤科.病人管理  > 0}"><input type="text" value="0" style="width: 40px;"></c:when><c:otherwise><input type="text" disabled="disabled" value="0" style="width: 40px;"></c:otherwise></c:choose><span>${requestScope.typeCount.皮肤科.病人管理 }</span></td>
        	</tr>
    </tbody>
		<tfoot>
			<tr id = "total">
				<td>合计</td>
				<td><input id="inquiryCount" type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
				<td><input id="phyEaxmCount" type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
				<td><input id="fstVisitCount" type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
				<td><input id="aryEaxmCount" type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
				<td><input id="diagnoseCount" type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
				<td><input id="treatmentCount" type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
				<td><input id="patManCount" type="text" disabled="disabled" value="0" style="width: 40px;">题</td>
			</tr>
		</tfoot>
	</table>
	<div style="text-align: center;padding: 20px;">
			<a id="close" style="" href="#" onclick="sumbitData()" class="easyui-linkbutton" data-options="iconCls:'fa-check-circle'">提交</a>  
			<a id="close" href="#" onclick="back()" class="easyui-linkbutton" data-options="iconCls:'fa-window-close'">关闭</a>  
	</div>
	
</body>
</html>