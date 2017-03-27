<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common.jsp"%>
<title>新增治疗方案：</title>
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
	    'url': "/lcsw/treatment/getlastTreatment.action",
	    'dataType': 'json',
	    'success': function(data) {
			if (data.status) {
				var treatment = data.treatment;
				$(treatment).each(function() {
					if(this.treatmentType == 1){
						$("#Wtable").append("<tr><td style='width:100px;'><input type='text' value='" + this.treatmentPlan + "'></input></td><td><select class='easyui-combobox'><option value='-3'>-3</option><option>-2</option><option>-1</option><option selected = 'selected'>0</option><option>1</option><option>2</option><option>3</option></select></td><td><input type='hidden' value='" + this.treatmentType + "'></input></td></tr>");					
					}else if(this.treatmentType == 2){
						$("#Ctable").append("<tr><td style='width:100px;'><input type='text' value='" + this.treatmentPlan + "'></input></td><td><select class='easyui-combobox'><option value='-3'>-3</option><option>-2</option><option>-1</option><option selected = 'selected'>0</option><option>1</option><option>2</option><option>3</option></select></td><td><input type='hidden' value='" + this.treatmentType + "'></input></td></tr>");					
					}else{
						$("#Ttable").append("<tr><td style='width:100px;'><input type='text' value='" + this.treatmentPlan + "'></input></td><td><select class='easyui-combobox'><option value='-3'>-3</option><option>-2</option><option>-1</option><option selected = 'selected'>0</option><option>1</option><option>2</option><option>3</option></select></td><td><input type='hidden' value='" + this.treatmentType + "'></input></td></tr>");					
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

function submitTreatment() {
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
			json += "{\"treatmentPlan\":\""+ plan + "\",\"treatmentType\":\""+ type +   "\",\"score\":\"" + score +"\"}"
			flag = false;
		}else{
			json += ",{\"treatmentPlan\":\""+ plan + "\",\"treatmentType\":\""+ type +  "\",\"score\":\"" + score +"\"}";
		} 
	});
	json += "]";
	if(json=="[]")
		json=null;
	$.ajax({
	    headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
	    'type': 'POST',
	    'url': "/lcsw/treatment/next.action",
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

</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		
		<div data-options="region:'center',border:false" style="padding: 10px;width: 100%"> 
    		<div style="padding:10px;" id="Wmedicine">
    			<label>西药：</label>
    			<br>
    			<input type="button" onclick="add(this,1)" value="新增治疗药物">
    			<table id="Wtable">
    			
    			</table>     
    		</div>   
    		<div style="padding:10px;" id="Cmedicine">
    			<label>中药：</label>
    			<br> 
    			<input type="button" onclick="add(this,2)" value="新增治疗药物">  
    			<table id="Ctable">
    			
    			</table>     
    		</div>   
    		<div style="padding:10px;" id="treat"> 
    			<label>治疗方案：</label>
    			<br>
    			<input type="button" onclick="add(this,3)" value="新增治疗方案">      
    			<table id="Ttable">
    			
    			</table>
    		</div>    
			<input type="hidden" id="nextUrl" value="/lcsw/patientMgmt/toAddPatientMgmt.action">
			<input type="hidden" id="nextTitle" value="添加病人管理信息">
			<input type="hidden" id="nextHight" value="600">
			<input type="hidden" id="nextWidth" value="800">
			<input type="hidden" id="lastUrl" value="/lcsw/diagnose/toAddDiagnose.action">
			<input type="hidden" id="lastTitle" value="添加确诊信息">
			<input type="hidden" id="lastHight" value="600">
			<input type="hidden" id="lastWidth" value="800">    
		</div>
		<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
			<a id="last" href="#" onclick="last()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">上一步</a>  
			<a id="next" href="#" onclick="submitTreatment()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">下一步</a>  
			<a id="close" href="#" onclick="parent.$('#${windowid}').window('close')" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
		</div>
	</div>
</body>
</html>