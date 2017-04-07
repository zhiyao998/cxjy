<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../common.jsp"%>
<style type="text/css">
	#menu{
		background-color: #F0FFF0;
		height: 100%;
	}
	#menu li{
		padding-bottom: 3%;
		padding-top: 3%;
	}
	.navbar{
		background-color: #F0FFFF;
		
	}
	
	
</style>
<script type="text/javascript">
	$(function() {
		$.get("/lcsw/exam/caseInfo.action",function(data){
			$("#iframe").html(data);
		});	
		$("#menu li").click(function() {
	        var current = $(this),  
	        target = current.attr('target'); // 找到链接a中的targer的值  
	        $.get(target,function(data){  
	            $("#iframe").html(data);   
	         });  
		});
		$("#caseInfo").click(function() {
			
		});
	});
</script>
</head>
<body>
<div id="mian">
	<nav class="navbar navbar-default navbar-fixed-top ">
		<div class="navbar-header">
			<a class="navbar-brand" id="caseInfo" href="#">病例信息</a>
		</div>
		
		<a href="#" class="navbar-link navbar-text navbar-right">退出练习</a>
		
	</nav>
	<div id="body" class="container-fluid" style="padding-top: 50px;">
		<div class="row">
			<div class="col-md-2" style="height: 750px;">
				<ul id="menu" class="nav nav-pills nav-stacked text-center">
  					<li target="/lcsw/exam/patientInfo.action"><a href="#">病人信息</a></li>
  					<li target="/lcsw/exam/inquiryInfo.action"><a href="#">问诊</a></li>
 					<li target="/lcsw/exam/physicalExamInfo.action"><a href="#">体格检查</a></li>
 					<li target="/lcsw/exam/firstvisitInfo.action"><a href="#">初诊</a></li>
 					<li target="/lcsw/exam/accessoryExamInfo.action"><a href="#">辅助检查</a></li>
 					<li target="/lcsw/exam/diagnoseInfo.action"><a href="#">确诊</a></li>
 					<li target="/lcsw/exam/treatmentInfo.action"><a href="#">治疗方案</a></li>
 					<li target="/lcsw/exam/patientMgmtInfo.action"><a href="#">病人管理</a></li>
				</ul>
			</div>
			<div class="col-md-10 center-block text-center" id="iframe">
				
			</div>
		</div>
	</div>
	<nav class="navbar navbar-default navbar-fixed-bottom">
		<a href="#" class="navbar-link navbar-text navbar-right">历史记录</a>
	</nav>
	
</div>	
	
</body>
</html>