<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common.jsp"%>
<title>组卷列表</title>
<style type="text/css">
	table tr{
		text-align: center;
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
}
</style>

<script type="text/javascript">
	$(function() {
		$("#count2,#count3").change(function() {
			var number = parseInt($(this).val());
			if(!isNaN(number)){
				var span = $(this).next("span");
				var count = parseInt($(span).text());
				if(number <= count){
					if($(this).attr("id") == "count2"){
						var sum = number + parseInt($("#all2").val());
						$("#all2").val(sum);
					}else{
						var sum = number + parseInt($("#all3").val());
						$("#all3").val(sum);
					}
					$("#all").val(number + parseInt($("#all").val()));
				}else{
					$(this).val("")
					alert("题目数量不能超过现有题目！");
				}
			}else{
				$(this).val("")
				alert("请输入整数!");
			}
		});
	});
	
	function sumbitData() {
		var map = new Array();
		var list = new Array();
		var total2 = $("#all2").val();
		var total3 = $("#all3").val();
		var total = $("#all").val();
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
		    'type': 'POST',
		    'url': "/lcsw/TestPaperGen/genTestPaer.action",
		    'data':{
		    	'total':total,
		    	'total2':total2,
		    	'total3':total3,
		    	'list':JSON.stringify(list)
		    },
		    'dataType': 'json',
		    'success': function(data) {
				
		    }
		});	
	}
	
</script>

</head>
<body>
	<table width="100%" border="1" cellspacing="0" cellpadding="0">
		<thead>
			<tr>
				<th>主题词</th>
				<th>A2</th>
				<th>A3</th>	
				<th>合计</th>		
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list }" var="i">
				<tr>
					<td>${i.ftheme }</td>
					<c:choose>
						<c:when test="${i.count2 ==0 }">
							<td><input id="count2" disabled="disabled"><span>${i.count2 }</span></td>
						</c:when>
						<c:otherwise>
							<td><input id="count2"><span>${i.count2 }</span></td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${i.count3 ==0 }">
							<td><input id="count3" disabled="disabled"><span>${i.count3 }</span></td>
						</c:when>
						<c:otherwise>
							<td><input id="count3"><span>${i.count3 }</span></td>
						</c:otherwise>
					</c:choose>
					<td></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td>合计</td>
				<td><input id="all2" type="text" disabled="disabled" value="0">题</td>
				<td><input id="all3" type="text" disabled="disabled" value="0">题</td>
				<td><input id="all" type="text" disabled="disabled" value="0">题</td>
			</tr>
		</tfoot>
	</table>
	<div style="text-align: center;padding: 20px;">
			<a id="close" style="" href="#" onclick="sumbitData()" class="easyui-linkbutton" data-options="iconCls:'fa-check-circle'">提交</a>  
			<a id="close" href="#" onclick="back()" class="easyui-linkbutton" data-options="iconCls:'fa-window-close'">关闭</a>  
	</div>
	
</body>
</html>