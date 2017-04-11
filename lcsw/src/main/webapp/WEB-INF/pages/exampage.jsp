<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../examcommom.jsp"%>
<style type="text/css">
	#menu{
		background-color: #d9d9d9;
	}
	#menu li{
		padding-bottom: 5%;
		padding-top: 5%;
	}
	#header{
		background-color: #434343;
		
	}
	#slider{
		    top: 0;  
   		 	bottom:0;  
    		position:fixed;  
    		overflow-y:scroll;  
    		overflow-x:hidden;
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
  	        $("#menu li").each(function() {
				$(this).removeClass("active");
			});
	        current.addClass("active");  
	        $.get(target,function(data){ 
	        	$("#iframe").empty();
	            $("#iframe").html(data);   
	         });  
		});
		$("#caseInfo").click(function() {
	        var current = $(this),  
	        target = current.attr('target'); // 找到链接a中的targer的值  
	        $.get(target,function(data){ 
	        	$("#iframe").empty();
	            $("#iframe").html(data);   
	         }); 
	        return false;
		});
		/* 滑动侧边栏初始化  */
		 var slider = $("#slider").slideReveal({
			  	trigger: $("#history"),
			  	width: 500,
			  	top: 50,
		 		position: "right",
		 		push: false,
		 		show: function(obj) {
			        $.get("/lcsw/exam/historyInfo.action",function(data){ 
			        	obj.html(data);   
			         }); 
				},
				hidden: function(obj) {
					
				}
		});
	});
</script>
</head>
<body>

	<nav id="header" class="navbar navbar-default navbar-fixed-top ">
		<div class="navbar-header">
			<a class="navbar-brand" id="caseInfo" target="/lcsw/exam/caseInfo.action" href="#">病例信息</a>
		</div>
		
		<a href="#" class="navbar-link navbar-text" style="float: right;">退出练习</a>
		
	</nav>
	<div id="body" class="container-fluid" style="padding-top: 50px;">
		<div class="row">
			<div class="col-md-1">
				<ul id="menu" class="nav nav-pills nav-stacked text-center" data-spy="affix" data-offset-top="125">
  					<li target="/lcsw/exam/patientInfo.action"><a href="javascript:void(0)">病人信息</a></li>
  					<li target="/lcsw/exam/inquiryInfo.action"><a href="javascript:void(0)">问诊</a></li>
 					<li target="/lcsw/exam/physicalExamInfo.action"><a href="javascript:void(0)">体格检查</a></li>
 					<li target="/lcsw/exam/firstvisitInfo.action"><a href="javascript:void(0)">初诊</a></li>
 					<li target="/lcsw/exam/accessoryExamInfo.action"><a href="javascript:void(0)">辅助检查</a></li>
 					<li target="/lcsw/exam/diagnoseInfo.action"><a href="javascript:void(0)">确诊</a></li>
 					<li target="/lcsw/exam/treatmentInfo.action"><a href="javascript:void(0)">治疗方案</a></li>
 					<li target="/lcsw/exam/patientMgmtInfo.action"><a href="javascript:void(0)">病人管理</a></li>
				</ul>
			</div>
			<div class="col-md-11 center-block text-center" id="iframe">
				
			</div>
		</div>
	</div>
	<div id="slider" style="background-color: #fff2cc;">
		
	</div>
	<nav class="navbar navbar-default navbar-fixed-bottom">
		<a id="history" href="#" class="navbar-link navbar-text" style="float: right;">历史记录</a>
	</nav>
	

	
</body>
</html>