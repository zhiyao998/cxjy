<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="../common.jsp"%>
<style type="text/css">
        .easyui-accordion ul
        {
            list-style-type: none;
            margin: 0px;
            padding: 10px;
        }
        .easyui-accordion ul li
        {
            padding: 0px;
        }
        .easyui-accordion ul li a
        {
            line-height: 24px;
            text-decoration: none;
        }
        .easyui-accordion ul li div
        {
            margin: 2px 0px;
            padding-left: 10px;
            padding-top: 2px;
        }
        .easyui-accordion ul li div.hover
        {
            border: 1px dashed #99BBE8;
            background: #E0ECFF;
            cursor: pointer;
        }
        .easyui-accordion ul li div.hover a
        {
            color: #416AA3;
        }
        .easyui-accordion ul li div.selected
        {
            border: 1px solid #99BBE8;
            background: #E0ECFF;
            cursor: default;
        }
        .easyui-accordion ul li div.selected a
        {
            color: #416AA3;
            font-weight: bold;
        }
</style>
<script type="text/javascript">

$(function () {
    InitMenu();
    $('body').layout();
})

	function InitMenu() {
		$(".easyui-accordion li a").click(function() {
			var tabtitle = $(this).text();
			var href = $(this).attr("href");
			addtab(tabtitle,href);
		      $('.easyui-accordion li div').removeClass("selected");
		        $(this).parent().addClass("selected");
		    }).hover(function () {
		        $(this).parent().addClass("hover");
		    }, function () {
		        $(this).parent().removeClass("hover");
		});
	}
	
</script>
<title>首页</title>
</head>
<body>
<div id="mianpage" class="easyui-layout" data-options="fit:true">   
    <div data-options="region:'north',title:'临床思维系统',collapsible:false" style="overflow: hidden; height: 30px; background: #D2E0F2 repeat-x center 50%;
        line-height: 20px; color: #fff;"></div>   
	<div data-options="region:'west',split:true,title:'菜单导航'" style="width:200px;">
		<div class="easyui-accordion" fit="true">
             <div title="基本业务" style="padding: 10px;">
                    <ul>
                        <li>
                            <div>
                                <a target="mainFrame" href="/lcsw/case/management.action">病例管理</a>
                            </div>
                        </li>
                        <li>
                            <div>
                                <a target="mainFrame" href="/lcsw/standard/mgmt.action">标准管理</a>
                            </div>
                        </li>
                        <li>
                            <div>
                                <a target="mainFrame" href="Product/Default.htm">试题管理</a>
                            </div>
                        </li>
                        <li>
                            <div>
                                <a target="mainFrame" href="Product/Default.htm">学生管理</a>
                            </div>
                        </li>
                    </ul>
               </div>	
               <div title="权限控制" style="padding: 10px;">
               		<ul>
                        <li>
                            <div>
                                <a target="mainFrame" href="Product/Default.htm">用户管理</a>
                            </div>
                            <div>
                                <a target="mainFrame" href="Product/Default.htm">权限管理</a>
                            </div>
                            <div>
                                <a target="mainFrame" href="Product/Default.htm">系统设置</a>
                            </div>
                        </li>
                    </ul>
               </div>
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