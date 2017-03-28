<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增辅助检查信息：</title>
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
</style>

<script type="text/javascript">
$(function() {	
	selectByResultType();
	$('#resultType').combobox({
		onSelect: function(){
			$("#accessoryExamType").combobox("clear");
			selectByResultType();
		}
	});
	$('#accessoryExamType').combobox({
		onSelect: function(){
			selectByAccessoryExamType();
		},
	});
	
});

function selectByResultType() {
	var resultType = $("#resultType").combobox("getValue");
	$.post("/lcsw/AccessoryExam/selectByResultType.action", { "resultType": resultType },
			   function(data){
			     if(data != null){
			    	 $("#main").empty();
			    	 var option =[];
			    	 for(var i = 0; i < data.length; i++){
			    		 option.push({ "text": data[i].accessoryExamType, "id": data[i].accessoryExamId });
			    	 }
			    	 var newobj=JSON.parse(JSON.stringify(option));
			    	 $("#accessoryExamType").combobox("loadData",newobj);
			     }
			   },"json");
}

function selectByAccessoryExamType() {
	var accessoryExamType = $("#accessoryExamType").combobox("getText");
	$.post("/lcsw/AccessoryExam/selectByAccessoryExamType.action", { "accessoryExamType": accessoryExamType },
			   function(data){
					$("#main").empty();
					if(data.length > 0){
						if(data[0].resultType == 1){
							var json = "<table><thead><tr><th>序号</th><th>项目名称</th><th>检验结果</th><th>单位</th><th>参考范围</th><tr></thead>";
							json += "<tbody>";
							for(var i = 0; i < data.length; i++){
								json += "<tr><td>" + data[i].accessoryExamOrder + "</td><td>" + data[i].accessoryExamName +"</td><td><input value='" + data[i].accessoryExamResult + "'></input></td><td>ww</td><td>qqq</td></tr>";
							}
							json += "</tbody></table>";
							$("#main").append(json);
						}else{
							var json = "<div><label>影像检查</label><br><label>" + data[0].accessoryExamName + "</label><br><input class='easyui-filebox'></input></div>";
							$("#main").append(json);
						}
						
					}
			   },"json");
}

function submitAccessoryExam() {
	var trs = $("tbody tr");
	if(trs != null){
		var json = "[";
		var flag = true;
		for(var i = 0; i < trs.length; i++){
			var td = $(trs[i]).children();
			var input = $(td[2]).children("input");
			if(flag){
				json += "{\"accessoryExamOrder\":\""+ $(td[0]).text() +"\",\"accessoryExamName\":\""+ $(td[1]).text() + "\",\"accessoryExamResult\":\""+ $(input).val() + "\",\"accessoryExamType\":\"" + $("#accessoryExamType").combobox("getValue") +"\"}"
				flag = false;
			}else{
				json += ",{\"accessoryExamOrder\":\""+ $(td[0]).text() +"\",\"accessoryExamName\":\""+ $(td[1]).text() + "\",\"accessoryExamResult\":\""+ $(input).val() + "\",\"accessoryExamType\":\"" + $("#accessoryExamType").combobox("getValue") +"\"}"
			}
		}
		json += "]";
		if(json=="[]")
			json=null;
		$.ajax({
		    headers: { 
		        'Accept': 'application/json',
		        'Content-Type': 'application/json' 
		    },
		    'type': 'POST',
		    'url': "/lcsw/AccessoryExam/next.action",
		    'data': json,
		    'dataType': 'json',
		    'success': function(data) {
				if (data.status) {
					parent.open($("#nextTitle").val(),$("#nextUrl").val(),$("#nextWidth").val(),$("#nextHight").val());
					parent.$('#${windowid}').window('close');
				}
			}
		});
	}
	return false;
}

</script>
</head>
<body>
		<div class="easyui-layout" data-options="fit:true">
		
	<div data-options="region:'center',border:false" style="padding: 10px;">
		<select id="resultType" name="resultType" class="easyui-combobox">
			<option value="1">实验室检查</option>
			<option value="2">影像检查</option>
		</select>
		<select id="accessoryExamType" name="accessoryExamType" class="easyui-combobox" style="width: 100px" data-options="valueField:'id', textField:'text'">
			
		</select>
		
		<div id="main">
			
		</div>
			<input type="hidden" id="nextUrl" value="/lcsw/diagnose/toAddDiagnose.action">
			<input type="hidden" id="nextTitle" value="添加确诊信息">
			<input type="hidden" id="nextHight" value="600">
			<input type="hidden" id="nextWidth" value="800">
			<input type="hidden" id="lastUrl" value="/lcsw/firstVisit/toAddFirstVisit.action">
			<input type="hidden" id="lastTitle" value="添加初诊信息">
			<input type="hidden" id="lastHight" value="600">
			<input type="hidden" id="lastWidth" value="800">
			
	</div>	
	<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
		<a id="submit" href="#" onclick="submitAccessoryExam()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">下一步</a>  
		<a id="close" href="#" onclick="parent.$('#${windowid}').window('close')" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
	</div>
		
	</div>
</body>
</html>