<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增体检信息</title>
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
$(function() {	
	$("ul").datalist({ 
		onClickRow: function(index, row) {
			var panel =$("#aa");
			if(panel.children().length > 0){
				submitPhysicalExam();
				panel.empty();
			}
			$.post("/lcsw/physicalExam/selectByType.action", {"physicalExamType":row.value}, function(data) {
				if (data.status) {
						var list = data.list;
						panel.append("<table><thead><tr><th style='width: 200px'>体检项目</th><th style='width: 200px'>体检结果</th><th style='width:50px'>分值</th><th style='width: 60px'>是否修改</th><tr></thead><tbody>");
						$.each(list, function(index, content){ 
							if(content.caseId == 0){
								panel.append("<tr><td style='width: 200px'><input disabled='true' class='easyui-textbox' value='"+content.physicalExamName+"'></input></td>"+ 
									"<td style='width: 200px'><input disabled='true' type='text' class='easyui-textbox' value='" +content.physicalExamResult+"'></input></td>"+
									"<td><input style='width:50px' disabled='true' class='easyui-numberbox' value='0'><input type='hidden' value='" + content.physicalExamId + "''></td>"+
									"<td><input type='hidden' value='" + content.physicalExamType + "'><input style='width: 60px' type='checkbox' onclick='change(this)' value='"+ (content.physicalExamOrder) +"'/></td>"+"</tr>");
							}else{
								panel.append("<tr><td style='width: 200px'><input class='easyui-textbox' value='"+content.physicalExamName+"'></input></td>"+ 
										"<td style='width: 200px'><input type='text' class='easyui-textbox' value='" +content.physicalExamResult+"'></input></td>"+
										"<td><input style='width:50px' class='easyui-numberbox' value='" + content.score + "'><input type='hidden' value='" + content.physicalExamId + "''></td>" +
										"<td><input type='hidden' value='" + content.physicalExamType + "'><input style='width: 60px' type='checkbox' checked='checked' onclick='change(this)' value='"+ (content.physicalExamOrder) +"'/></td>"+"</tr>");
							}
						});
						panel.append("</tbody></table>");
						$.parser.parse("#aa");
				}
			}, "json");
	    }
	}); 	
});


function submitPhysicalExam() {
	var json = "[";
	var flag = true;
	$(":checkbox").each(function(c) {
		var pre = $(this).parent().prevAll();
		var td1 = pre[0];
		var td2 = pre[1];
		var td3 = pre[2];
		var input1 = $(td1).children()[0];
		var input2 = $(td2).children()[0];
		var input3 = $(td3).children()[0];
		var input4 = $(this).prev();
		var input5 = $(td1).children()[2];
		if(this.checked){
			var score = $(input1).val();
			var result = $(input2).val();
			var name = $(input3).val();
			var type = $(input4).val();
			var order = $(this).val();
			var id = $(input5).val();
			if(flag){
				json += "{\"physicalExamName\":\""+ name +"\",\"physicalExamId\":\""+ id +"\",\"physicalExamResult\":\""+ result + "\",\"physicalExamType\":\""+ type + "\",\"physicalExamOrder\":\""+ order + "\",\"score\":\"" + score +"\"}"
				flag = false;
			}else{
				json += ",{\"physicalExamName\":\""+ name +"\",\"physicalExamId\":\""+ id +"\",\"physicalExamResult\":\""+ result + "\",\"physicalExamType\":\""+ type + "\",\"physicalExamOrder\":\""+ order + "\",\"score\":\"" + score +"\"}"
			}
		}
	});
	json += "]";
	if(json=="[]"){
		
	}
	else{
	$.ajax({
	    headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
	    'type': 'POST',
	    'url': "/lcsw/physicalExam/submitPhysicalExam.action",
	    'data': json,
	    'dataType': 'json',
	    'success': function(data) {
	    	isChange = true;
		}
	});
	}
}

function next() {
	debugger;
	submitPhysicalExam()
	if(isChange){
		$.ajax({
		    headers: { 
		        'Accept': 'application/json',
		        'Content-Type': 'application/json' 
		    },
		    'type': 'POST',
		    'url': "/lcsw/physicalExam/next.action",
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
    			<li value="1">生命体征</li> 
    			<li value="2">一般情况</li> 
   				<li value="3">皮肤粘膜</li> 
   				<li value="4">淋巴结</li> 
   				<li value="5">头颈部</li> 
   				<li value="6">胸</li> 
   				<li value="7">肺</li> 
			</ul>  
		</div>
		
		<div data-options="region:'center',border:false" style="padding: 10px;width: 100%">
			<div id="aa">   
     
			</div>
			<input type="hidden" id="step" value="2">    
		</div>
		<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
			<a id="last" href="#" onclick="last()" class="easyui-linkbutton" data-options="iconCls:'fa-arrow-circle-left'">上一步</a>  
			<a id="next" href="#" onclick="next()" class="easyui-linkbutton" data-options="iconCls:'fa-arrow-circle-right'">下一步</a>  
			<a id="close" href="#" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'fa-window-close'">关闭</a>  
		</div>
	</div>
</body>
</html>