<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common.jsp"%>
<title>新增病人管理：</title>
<style type="text/css">
table, th, td
  {
  border: 1px solid pink;
  }
td
  {
  padding:15px;
  }
</style>
<script type="text/javascript">
$(function() {	
	/*初始化  */ 
		$.ajax({
	    'type': 'POST',
	    'url': "/lcsw/patientMgmt/getlastPatientMgmt.action",
	    'dataType': 'json',
	    'success': function(data) {
			if (data.status) {
				var patientMgmt = data.patientMgmt;
				$(patientMgmt).each(function() {
					if(this.patientManagementType == 1){
						$("#Rtable").append("<tr><td style='width:100px;'><input type='text' value='" + this.managementPlan + "'></input></td><td><select class='easyui-combobox'><option value='-3'>-3</option><option>-2</option><option>-1</option><option selected = 'selected'>0</option><option>1</option><option>2</option><option>3</option></select></td><td><input type='hidden' value='" + this.patientManagementType + "'></input></td></tr>");					
					}else if(this.patientManagementType == 2){
						$("#Ftable").append("<tr><td style='width:100px;'><input type='text' value='" + this.managementPlan + "'></input></td><td><select class='easyui-combobox'><option value='-3'>-3</option><option>-2</option><option>-1</option><option selected = 'selected'>0</option><option>1</option><option>2</option><option>3</option></select></td><td><input type='hidden' value='" + this.patientManagementType + "'></input></td></tr>");					
					}else{
						$("#Ctable").append("<tr><td style='width:100px;'><input type='text' value='" + this.managementPlan + "'></input></td><td><select class='easyui-combobox'><option value='-3'>-3</option><option>-2</option><option>-1</option><option selected = 'selected'>0</option><option>1</option><option>2</option><option>3</option></select></td><td><input type='hidden' value='" + this.patientManagementType + "'></input></td></tr>");					
					}					
				});
			}
		}
	})
});

function add(button,type) {
	var parent = $(button).parent();
	parent.append("<tr><td><input type='text' style='width:100px;'></input></td><td><select class='easyui-combobox'><option value='-3'>-3</option><option>-2</option><option>-1</option><option selected = 'selected'>0</option><option>1</option><option>2</option><option>3</option></select></td><td><input type='hidden' value='" + type + "'></input></td></tr>");
}

function lastPage() {
	submitPatientMgmt();
	parent.open($("#lastTitle").val(),$("#lastUrl").val(),$("#lastWidth").val(),$("#lastHight").val());
	parent.$('#${windowid}').window('close');
}

function submitPatientMgmt() {
	var json = "[";
	var flag = true;
	var tr = $("tr");
	$(tr).each(function() {
		var children = $(this).children();
		var input1 = $(children[0]).children()[0];
		var input2 = $(children[1]).children()[0];
		var input3 = $(children[2]).children()[0];
 		var score = $(input2).val();
		var plan = $(input1).val();
		var type = $(input3).val();
		if(flag){
			json += "{\"managementPlan\":\""+ plan + "\",\"patientManagementType\":\""+ type +   "\",\"score\":\"" + score +"\"}"
			flag = false;
		}else{
			json += ",{\"managementPlan\":\""+ plan + "\",\"patientManagementType\":\""+ type +  "\",\"score\":\"" + score +"\"}";
		} 
	});
	json += "]";
	if(json=="[]")
		alert("请添加病人管理！");
	$.ajax({
	    headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
	    'type': 'POST',
	    'url': "/lcsw/patientMgmt/next.action",
	    'data': json,
	    'dataType': 'json',
	    'success': function(data) {
			if (data.status) {
				parent.$('#grid').datagrid('reload');
				parent.$('#${windowid}').window('close');
			}else{
				alert("提交失败");
			}
		}
	});
}

</script>
</head>
<body>
		<div class="easyui-layout" data-options="fit:true">
		
		<div data-options="region:'center',border:false" style="padding: 10px;width: 100%"> 
    		<div style="padding:10px;" id="nRoutine">
    			<label>护理常规：</label>
    			<br>
    			<input type="button" onclick="add(this,1)" value="新增护理项目">
    			<table id="Rtable">
    			
    			</table>     
    		</div>   
    		<div style="padding:10px;" id="food">
    			<label>膳食：</label>
    			<br> 
    			<input type="button" onclick="add(this,2)" value="新增膳食方案">  
    			<table id="Ftable">
    			
    			</table>     
    		</div>   
    		<div style="padding:10px;" id="consultation"> 
    			<label>会诊：</label>
    			<br>
    			<input type="button" onclick="add(this,3)" value="新增会诊方案">      
    			<table id="Ctable">
    			
    			</table>
    		</div>    
			<input type="hidden" id="lastUrl" value="/lcsw/treatment/toAddTreatment">
			<input type="hidden" id="lastTitle" value="添加问诊信息">
			<input type="hidden" id="lastHight" value="600">
			<input type="hidden" id="lastWidth" value="800">    
		</div>
		<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
			<a id="last" href="#" onclick="lastPage()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">上一步</a>  
			<a id="next" href="#" onclick="submitPatientMgmt()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">提交</a>  
			<a id="close" href="#" onclick="parent.$('#${windowid}').window('close')" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
		</div>
	</div>
</body>
</html>