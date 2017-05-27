<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="../common.jsp"%>
<style type="text/css">
	#notice div{
		font-size: 15px;
		background-color: #489fdf;
		width: 60%;
		min-height:50px;
		max-height:1500px;
		margin: 30px;
		padding: 20px;
		border-radius: 5px;
	}
	#north{
		padding: 10px;
	}
	#welcome p{
		font-size: 50%;
		margin: 10px;
	}
	
</style>
<title>首页</title>
</head>
<body>
<div id="mianpage" class="easyui-layout" data-options="fit:true">   
    <div id="north" data-options="region:'north',collapsible:false" style="height: 60px;">
    	<h1 style="float: left;">临床思维系统</h1>
    	<shiro:authenticated>
    		<div id="welcome" style="float: left;height: 100%;">
    			<p>欢迎您，<shiro:principal property="name"></shiro:principal></p>
    		</div>
    	</shiro:authenticated>
    	<div style="float: right;height: 100%;">
    		<ul>
    			<li style="display: inline;"><a href="#" class="easyui-linkbutton" onclick="editPassword()"><i class="fa fa-lock"></i>修改密码</a></li>
          		<li style="display: inline;"><a href="#" class="easyui-linkbutton" onclick="exit()"><i class="fa fa-sign-out"></i>退出系统</a></li>
          	</ul>
    	</div>
    </div>   
	<div data-options="region:'west',split:true,title:'菜单导航'" style="width:10%;">
    	<div id="basicMgnt">
             <ul id="accordion" class="accordion">
                <li>
                	<shiro:hasPermission name="sys:mgmt">
             		<div class="link"><i class="fa  fa-user-circle"></i>系统管理<i class="fa fa-chevron-down"></i></div>
             		<ul class="submenu">
             			<shiro:hasPermission name="sys:user">
							<li><a href="/lcsw/user/userMagt.action" onclick=" return false; ">用户管理</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="sys:role">
							<li><a href="/lcsw/role/roleSet.action" onclick=" return false; ">角色设置</a></li>
						</shiro:hasPermission>
						<shiro:hasPermission name="sys:menu">
							<li><a href="/lcsw/user/userMagt.action" onclick=" return false; ">菜单设置</a></li>
						</shiro:hasPermission>
					</ul>
					</shiro:hasPermission>
             	</li>
             	<li>
             		<shiro:hasPermission name="case:mgmt">
             		<div class="link"><i class="fa  fa-pencil-square-o"></i>病例管理<i class="fa fa-chevron-down"></i></div>
             		<ul class="submenu">
             			<shiro:hasPermission name="case:list">
						<li><a href="/lcsw/case/management.action" onclick=" return false; ">病例列表</a></li>
						</shiro:hasPermission>
					</ul>
					</shiro:hasPermission>
             	</li>
             	<li>
             		<shiro:hasPermission name="paperGen:mgmt">
             		<div class="link"><i class="fa  fa-list"></i>组卷管理<i class="fa fa-chevron-down"></i></div>
             		<ul class="submenu">
             			<shiro:hasPermission name="paperGen:gen">
						<li><a href="/lcsw/TestPaperGen/findAllCase.action" onclick=" return false; ">普通组卷</a></li>
						</shiro:hasPermission>
					</ul>
					</shiro:hasPermission>
             	</li>
             </ul>
    	</div>				
	</div>
    <div data-options="region:'center'" id="mainPanle" style="padding:5px;background:#eee;">
    	<div id="tabs" class="easyui-tabs" fit="true" border="false">
            <div title="主页" style="padding: 20px;" id="home">
                <h1>临床思维系统</h1>
                <div id="notice">
            		<div>
            			基础功能：增加病例，手工组卷
            		</div>
            		<div>
            			预计功能：用户管理，权限管理，试卷管理，前台页面
            		</div>
            	</div>
            </div>
        </div>
    </div> 
</div>  

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

function editPassword() {
	var html = '<div id="editPasswordBox"><iframe frameborder="0" marginwidth="100%" width="100%" height="100%" src="/lcsw/user/toEditPassword" ></iframe></div>';
	$("body").append(html);
	$("#editPasswordBox").window({
		title: '修改密码',
		width : 600,
		height : 400,
		modal : true,
		//当window关闭时把这个窗口的代码清除。
		onClose : function() {
			$("#editPasswordBox").window('destroy');
			window.location.href = "/lcsw/toLogin";
		}
	});
}

function exit() {
	$.post("/lcsw/exit", function(data) {
		if (data.status) {
			window.location.href = "/lcsw/toLogin";
		}
	}, "json");
}
	
</script>
	
</body>
</html>