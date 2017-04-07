<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问诊信息</title>
<%@ include file="../../common.jsp"%>
<style type="text/css">
table, td
  {
  border: 1px solid pink;
  }
td,th
  {
  padding:15px;
  text-align: center;
  }
</style>
<script type="text/javascript">
$(function() {	
	$("#aa").accordion('getSelected').panel('collapse');
	/*初始化  */
 	$('#aa').accordion({   
	    onSelect:function(title, index)
	    {
			$.post("/lcsw/inquiry/selectByType.action", {"inquiryType":index+1}, function(data) {
				if (data.status) {
						var list = data.list;
						var panel =$("#aa").accordion('getSelected');
						if(panel[0].children.length==0){
							panel.append("<table><thead><tr><th style='width: 200px'>问诊问题</th><th style='width: 200px'>病人回应</th><th>分值</th><th>是否修改</th><tr></thead><tbody>");
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
							$("#aa").accordion('getSelected').append("</tbody></table>");
							$.parser.parse("#aa");
						}
				}
			}, "json");
	    },
	    onUnselect:function(title, index){
/* 	    	var panel = $("#aa").accordion("getPanel",index);
	    	panel.empty(); */
	    }
	}); 
});


function submitInquery() {
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
	if(json=="[]")
		alert("请选择至少一条问诊信息！");
	else{
	$.ajax({
	    headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
	    'type': 'POST',
	    'url': "/lcsw/inquiry/next.action",
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
}

</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		
		<div data-options="region:'center',border:false" style="padding: 10px;width: 100%">
			<div id="aa" class="easyui-accordion" style="width: 100%;height:500px;">   
    			<div title="一般情况及现病史" style="padding:10px;">     
    			</div>   
    			<div title="系统回顾与既往史"  style="padding:10px;">   
    			</div>   
    			<div title="个人史" style="padding:10px;">     
    			</div>   
			</div>
			<input type="hidden" id="nextUrl" value="/lcsw/physicalExam/toAddPhysicalExam.action">
			<input type="hidden" id="nextTitle" value="添加体检信息">
			<input type="hidden" id="nextHight" value="600">
			<input type="hidden" id="nextWidth" value="800">
			<input type="hidden" id="lastUrl" value="/lcsw/case/toAdd.action">
			<input type="hidden" id="lastTitle" value="新增病例">
			<input type="hidden" id="lastHight" value="600">
			<input type="hidden" id="lastWidth" value="800">   
		</div>
		<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
			<a id="last" href="#" onclick="last()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">上一步</a>  
			<a id="next" href="#" onclick="submitInquery()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">下一步</a>  
			<a id="close" href="#" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
		</div>
	</div>

</body>
</html>