<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增体检信息</title>
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
			$.post("/lcsw/physicalExam/selectByType.action", {"physicalExamType":index+1}, function(data) {
				if (data.status) {
						var list = data.list;
						var panel =$("#aa").accordion('getSelected');
						if(panel[0].children.length==0){
							panel.append("<table><thead><tr><th style='width: 200px'>体检项目</th><th style='width: 200px'>体检结果</th><th>分值</th><th>是否修改</th><tr></thead><tbody>");
							$.each(list, function(index, content){ 
								if(content.caseId == 0){
									panel.append("<tr><td><input disabled='true' class='easyui-textbox' value='"+content.physicalExamName+"'></input></td>"+ 
										"<td><input disabled='true' type='text' class='easyui-textbox' value='" +content.physicalExamResult+"'></input></td>"+
										"<td><input style='width:50px' disabled='true' class='easyui-numberbox' value='0'><input type='hidden' value='" + content.physicalExamId + "''></td>"+
										"<td><input type='hidden' value='" + content.physicalExamType + "'><input style='width: 60px' type='checkbox' onclick='change(this)' value='"+ (content.physicalExamOrder) +"'/></td>"+"</tr>");
								}else{
									panel.append("<tr><td><input class='easyui-textbox' value='"+content.physicalExamName+"'></input></td>"+ 
											"<td><input type='text' class='easyui-textbox' value='" +content.physicalExamResult+"'></input></td>"+
											"<td><input style='width:50px' class='easyui-numberbox' value='" + content.score + "'><input type='hidden' value='" + content.physicalExamId + "''></td>" +
											"<td><input type='hidden' value='" + content.physicalExamType + "'><input style='width: 60px' type='checkbox' checked='checked' onclick='change(this)' value='"+ (content.physicalExamOrder) +"'/></td>"+"</tr>");
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
	if(json=="[]")
		alert("请选择至少一条体检信息！");
	else{
	$.ajax({
	    headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
	    'type': 'POST',
	    'url': "/lcsw/physicalExam/next.action",
	    'data': json,
	    'dataType': 'json',
	    'success': function(data) {
			if (data.status) {
				parent.open(data.nextStep);
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
    			<div title="生命体征" style="padding:10px;">     
    			</div>   
    			<div title="一般情况"  style="padding:10px;">   
    			</div>   
    			<div title="皮肤粘膜" style="padding:10px;">     
    			</div>
    			<div title="淋巴结" style="padding:10px;">     
    			</div>   
    			<div title="头颈部" style="padding:10px;">     
    			</div>   
    			<div title="胸" style="padding:10px;">     
    			</div>   
    			<div title="肺" style="padding:10px;">     
    			</div>      
			</div>
			<input type="hidden" id="step" value="2">    
		</div>
		<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
			<a id="last" href="#" onclick="last()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">上一步</a>  
			<a id="next" href="#" onclick="submitPhysicalExam()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">下一步</a>  
			<a id="close" href="#" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
		</div>
	</div>
</body>
</html>