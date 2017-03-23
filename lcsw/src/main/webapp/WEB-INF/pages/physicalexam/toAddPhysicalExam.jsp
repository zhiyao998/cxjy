<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增体检信息</title>
<%@ include file="../../common.jsp"%>
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
			<input type="hidden" id="nextUrl" value="/lcsw/physicalexam/toAdd.action">
			<input type="hidden" id="nextTitle" value="添加体检信息">
			<input type="hidden" id="nextHight" value="600">
			<input type="hidden" id="nextWidth" value="800">  
		</div>
		<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
			<a id="submit" href="#" onclick="submitInquery()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">下一步</a>  
			<a id="close" href="#" onclick="parent.$('#${windowid}').window('close')" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
		</div>
	</div>
</body>
</html>