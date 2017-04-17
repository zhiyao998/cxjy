<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问诊信息</title>
<%@ include file="../../common.jsp"%>
<style type="text/css">
td,th
  {
  padding:15px;
  text-align: center;
  border: 1px solid pink;
  }
</style>
<script type="text/javascript">
var isChange = false;
$(function() {		
	$("ul").datalist({
		onSelect: function(index, row) {
			var panel =$("#aa");
			if(panel.children().length > 0){
				submitInquery();
				panel.empty();
			}
			$.post("/lcsw/inquiry/selectByType.action", {"inquiryType":row.value}, function(data) {	
				if (data.status) {
						var list = data.list;
						panel.append("<table><thead><tr><th style='width: 200px'>问诊问题</th><th style='width: 200px'>病人回应</th><th>分值</th><th>是否加入病例</th><tr></thead><tbody>");
						$.each(list, function(index, content){
							if(content.caseId == 0){
								panel.append("<tr><td><input class='easyui-textbox' style='height: 80px;width: 200px' disabled='true' data-options='multiline:true' value='"+content.inquiryTitle+"'></input></td>"+ 
									"<td><input class='easyui-textbox' style='height: 80px;width: 200px' disabled='true' type='text' data-options='multiline:true' value='" +content.patientAnswer+"'></input></td>"+
									"<td><input style='width:50px' disabled='true' class='easyui-numberbox' value='0'><input type='hidden' value='" + content.inquiryId + "'></td>"+
									"<td><input type='hidden' value='" + content.inquiryType + "'><input style='width: 60px' type='checkbox' onclick='change(this)' value='"+ (content.inquiryOrder) +"'/></td>"+"</tr>");
							}else{
								panel.append("<tr><td><input class='easyui-textbox' style='height: 80px;width: 200px' data-options='multiline:true' value='"+content.inquiryTitle+"'></input></td>"+ 
										"<td><input class='easyui-textbox' style='height: 80px;width: 200px' type='text' data-options='multiline:true' value='" +content.patientAnswer+"'></input></td>"+
										"<td><input style='width:50px' class='easyui-numberbox' value='" + content.score + "'><input type='hidden' value='" + content.inquiryId + "'></td>" +
										"<td><input type='hidden' value='" + content.inquiryType + "'><input  type='checkbox' checked='checked' onclick='change(this)' value='"+ (content.inquiryOrder) +"'/></td>"+"</tr>");
							}
						});
						panel.append("</tbody></table>");
						$.parser.parse("#aa");
					}
			}, "json");
		}
	});
});

function submitInquery() {
	var json = "[";
	var flag = true;
	$(":checkbox").each(function(c) {
		if(this.checked){
			isChange = true;
			var pre = $(this).parent().prevAll();
			var td1 = pre[0];
			var td2 = pre[1];
			var td3 = pre[2];
			var input1 = $(td1).children()[0];
			var input2 = $(td2).children()[0];
			var input3 = $(td3).children()[0];
			var input4 = $(this).prev();
			var input5 = $(td1).children()[2];
			var score = $(input1).val();
			var answer = $(input2).val();
			var title = $(input3).val();
			var type = $(input4).val();
			var order = $(this).val();
			var id = $(input5).val();
			if(flag){
				json += "{\"inquiryTitle\":\""+ title +"\",\"inquiryId\":\""+ id +"\",\"patientAnswer\":\""+ answer +"\",\"inquiryType\":\""+ type + "\",\"inquiryOrder\":\""+ order + "\",\"score\":\"" + score +"\"}"
				flag = false;
			}else{
				json += ",{\"inquiryTitle\":\""+ title +"\",\"inquiryId\":\""+ id  +"\",\"patientAnswer\":\""+ answer +"\",\"inquiryType\":\""+ type + "\",\"inquiryOrder\":\""+ order + "\",\"score\":\"" + score +"\"}"
			}
		}
	});
	json += "]";
	if(json=="[]"){
		
	}else{
	$.ajax({
	    headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
	    'type': 'POST',
	    'url': "/lcsw/inquiry/submitInquery.action",
	    'data': json,
	    'dataType': 'json',
	    'success': function(data) {
	    	
		}
	});
	}
}

function next() {
	submitInquery();
	if(isChange){
		$.ajax({
		    headers: { 
		        'Accept': 'application/json',
		        'Content-Type': 'application/json' 
		    },
		    'type': 'POST',
		    'url': "/lcsw/inquiry/next.action",
		    'dataType': 'json',
		    'success': function(data) {
				if (data.status == 1) {
					parent.open(1,data.CaseQuery.nextStep);
					parent.$('#${windowid}').window('close',true);
				}else if(data.status == 2){
					parent.$('#grid').datagrid('reload');
					parent.$('#${windowid}').window('close');
				}else{
					alert("操作失败");
				}
			}
		});
	}else{
		alert("尚未选择辅助信息");
	}
}

</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		
		<div data-options="region:'west',border:false" style="width: 20%;height: 100%;">
			<ul class="easyui-datalist" style="height: 100%;"> 
    			<li value="1">一般情况及现病史</li> 
    			<li value="2">系统回顾与既往史</li> 
   				<li value="3">个人史</li> 
			</ul>  
		</div>
		
		<div data-options="region:'center',border:false" style="padding: 10px;width: 100%">
			<div id="aa">   
   				
			</div>
			<input type="hidden" id="step" value="1">
		</div>
		<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #e0e8f5">
			<a id="last" href="#" onclick="last()" class="easyui-linkbutton" data-options="iconCls:'fa-arrow-circle-left'">上一步</a>  
			<a id="next" href="#" onclick="next()" class="easyui-linkbutton" data-options="iconCls:' fa-arrow-circle-right'">下一步</a>  
			<a id="close" href="#" onclick="closeWin()" class="easyui-linkbutton " data-options="iconCls:'fa-window-close'">关闭</a>  
		</div>
	</div>

</body>
</html>