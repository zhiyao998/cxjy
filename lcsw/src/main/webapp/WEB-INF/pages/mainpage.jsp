<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="../common.jsp"%>
<style type="text/css">
	
</style>
<script type="text/javascript">

$(function () {
    InitMenu();
    $('body').layout();
})

	function InitMenu() {
		$("#basicMgnt a").click(function() {
			var tabtitle = $(this).text();
			var href = $(this).attr("href");
			addtab(tabtitle,href);
		    });
	}
	
</script>
<title>首页</title>
</head>
<body>
<div id="mianpage" class="easyui-layout" data-options="fit:true">   
    <div data-options="region:'north',title:'临床思维系统',collapsible:false" style="overflow: hidden; height: 30px; background: #D2E0F2 repeat-x center 50%;
        line-height: 20px; color: #fff;"></div>   
	<div data-options="region:'west',split:true,title:'菜单导航'" style="width:10%;">
    	<div id="basicMgnt">
             <ul id="accordion" class="accordion">
             	<li>
             		<div class="link"><i class="fa fa-paint-brush"></i>病例管理<i class="fa fa-chevron-down"></i></div>
             		<ul class="submenu">
						<li><a href="/lcsw/case/management.action" onclick=" return false; ">病例列表</a></li>
						<li><a href="#">审核病例</a></li>
					</ul>
             	</li>
             	<li>
             		<div class="link"><i class="fa fa-paint-brush"></i>组卷管理<i class="fa fa-chevron-down"></i></div>
             		<ul class="submenu">
						<li><a href="/lcsw/TestPaperGen/findAllCase.action" onclick=" return false; ">结构化组卷</a></li>
					</ul>
             	</li>
             </ul>
    	</div>				
	</div>
    <div data-options="region:'center'" id="mainPanle" style="padding:5px;background:#eee;">
    	<div id="tabs" class="easyui-tabs" fit="true" border="false">
            <div title="主页" style="padding: 20px;" id="home">
                <h1>
                    	临床思维系统</h1>
            </div>
        </div>
    </div> 
</div>  
	
	
</body>
</html>