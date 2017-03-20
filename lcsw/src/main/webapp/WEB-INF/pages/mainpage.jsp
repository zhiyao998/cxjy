<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
	
	a{
		margin: 10px;
	}
	
</style>
<%@ include file="../common.jsp"%>
<title>首页</title>
</head>
<body>
<div id="cc" class="easyui-layout" data-options="fit:true">   
    <div data-options="region:'north',title:'后台管理',split:true" style="height:100px;"></div>   
	<div data-options="region:'west',split:true,title:'菜单导航'" style="width:200px;">		
		<a>病例管理</a>
		<a>试卷管理</a>
		<a>考试管理</a>
		<a>学生管理</a>			
	</div>
    <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;">
    	<table class="easyui-datagrid" data-options="fitColumns:true,fit:true,rownumbers:true,url:'/lcsw/case/list.action'">
    		<thead>
    			<th data-options="field:'caseId'">病例id</th>   
    			<th data-options="field:'caseTitle'">病例名称</th>   
            	<th data-options="field:'createTime'">创建时间</th>   
            	<th data-options="field:'creater'">创建人</th> 
            	<th data-options="field:'caseType'">病例类型</th>
    		</thead>
    	</table>
    
    </div>   
</div>  
	
	
</body>
</html>