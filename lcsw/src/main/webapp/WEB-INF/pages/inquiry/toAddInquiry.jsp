<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问诊信息</title>
<%@ include file="../../common.jsp"%>
<script type="text/javascript">
$(function() {	
	$("#aa").accordion('getSelected').panel('collapse')
 	$('#aa').accordion({   
	    onSelect:function(title, index)
	    {
			$.post("/lcsw/inquiry/selectByType.action", {"inquiryType":index+1}, function(data) {
				if (data.status) {
						var list = data.list;
						$.each(list, function(index, content){ 
							$("#aa").accordion('getSelected').append("<div><label>"+(index+1)+" :"+content.inquiryTitle+"</label>"+ 
								"<input type='text' class='easyui-textbox' value='" +content.patientAnswer+"'></input></div>");
						});
				}
			}, "json");
	    },
	    onUnselect:function(title, index){
	    	alert(title);
	    }
	}); 
});
</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		
		<div data-options="region:'center',border:false" style="padding: 10px;">
			<div id="aa" class="easyui-accordion" style="width:600px;height:500px;">   
    			<div title="一般情况及现病史" style="padding:10px;">     
    			</div>   
    			<div title="个人史"  style="padding:10px;">   
    			</div>   
    			<div title="婚姻史">     
    			</div>   
			</div>  
		</div>
		<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
			<a id="submit" href="#" onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">下一步</a>  
			<a id="close" href="#" onclick="parent.$('#${windowid}').window('close')" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
		</div>
	</div>

</body>
</html>