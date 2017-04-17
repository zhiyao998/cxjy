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
						$("#Rtable").append("<tr><td style='width:100px;'><input type='text' value='" + this.managementPlan + "'></input></td><td><input style='width:50px' class='easyui-numberbox' value='" + this.score + "'></td><td><input type='hidden' value='" + this.patientManagementType + "'></input><input type='hidden' value='" + this.patientManagementId + "'></input></td></tr>");					
					}else if(this.patientManagementType == 2){
						$("#Ftable").append("<tr><td style='width:100px;'><input type='text' value='" + this.managementPlan + "'></input></td><td><input style='width:50px' class='easyui-numberbox' value='" + this.score + "'></td><td><input type='hidden' value='" + this.patientManagementType + "'></input><input type='hidden' value='" + this.patientManagementId + "'></input></td></tr>");					
					}else{
						$("#Ctable").append("<tr><td style='width:100px;'><input type='text' value='" + this.managementPlan + "'></input></td><td><input style='width:50px' class='easyui-numberbox' value='" + this.score + "'></td><td><input type='hidden' value='" + this.patientManagementType + "'></input><input type='hidden' value='" + this.patientManagementId + "'></input></td></tr>");					
					}					
				});
				$.parser.parse("#main");
			}
		}
	})
});

function add(button,type) {
	var parent = $(button).parent();
	parent.append("<tr><td><input type='text' style='width:100px;'></td><td><input style='width:50px' class='easyui-numberbox' value='0'></td><td><input type='hidden'" + type + "'><input type='hidden'></td></tr>");
	$.parser.parse("#main");
}

function lastPage() {
	submitPatientMgmt();
	var step = $("#step").val();
	$.post("/lcsw/case/last.action", { 'step':step}, function(data) {
		if (data.status) {
				//ok后的回调方法，去关闭父页面的窗口元素
				parent.open(1,data.lastStep);
				parent.$('#${windowid}').window('close');
		}
	}, "json");
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
		var input4 = $(children[2]).children()[1];
 		var score = $(input2).val();
		var plan = $(input1).val();
		var type = $(input3).val();
		var id = $(input4).val();
		if(flag){
			json += "{\"managementPlan\":\""+ plan + "\",\"patientManagementType\":\""+ type + "\",\"patientManagementId\":\""+ id +   "\",\"score\":\"" + score +"\"}"
			flag = false;
		}else{
			json += ",{\"managementPlan\":\""+ plan + "\",\"patientManagementType\":\""+ type + "\",\"patientManagementId\":\""+ id +  "\",\"score\":\"" + score +"\"}";
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
				parent.$('#grid').datagrid('reload');
				parent.$('#${windowid}').window('close');
		}
	});
}

</script>
</head>
<body>
		<div class="easyui-layout" data-options="fit:true">
		
		<div id="main" data-options="region:'center',border:false" style="padding: 10px;width: 100%"> 
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
    		<input type="hidden" id="step" value="6">   
		</div>
		<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
			<a id="last" href="#" onclick="lastPage()" class="easyui-linkbutton" data-options="iconCls:'fa-arrow-circle-left'">上一步</a>  
			<a id="next" href="#" onclick="submitPatientMgmt()" class="easyui-linkbutton" data-options="iconCls:'fa-arrow-circle-right'">提交</a>  
			<a id="close" href="#" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'fa-window-close'">关闭</a>  
		</div>
	</div>
</body>
</html>