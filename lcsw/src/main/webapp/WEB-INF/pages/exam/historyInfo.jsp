<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>历史记录</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
	.tab-pane p{
		font-size: 15px;
		padding: 5px;
	}
</style>
</head>
<body>
	  <!-- Nav tabs -->
  	<ul class="nav nav-tabs" role="tablist">
    	<li role="presentation" class="active"><a href="#patientinfo" aria-controls="patientinfo" role="tab" data-toggle="tab">病人信息</a></li>
    	<li role="presentation"><a href="#inquiryinfo" aria-controls="inquiryinfo" role="tab" data-toggle="tab">问诊信息</a></li>
    	<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>
    	<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>
  	</ul>

  	<!-- Tab panes -->
  	<div class="tab-content">
    	<div role="tabpanel" class="tab-pane active" id="patientinfo">
    		<h4>病人信息</h4>
			<p class="lead text-left">在 Bootstrap 2 中，我们对框架中的某些关键部分增加了对移动设备友好的样式。而在 Bootstrap 3 中，我们重写了整个框架，使其一开始就是对移动设备友好的。
									这次不是简单的增加一些可选的针对移动设备的样式，而是直接融合进了框架的内核中。也就是说，Bootstrap 是移动设备优先的。针对移动设备的样式融合进了框架的每
									个角落，而不是增加一个额外的文件。</p>
			<h4>病人主诉</h4>
			<p class="lead text-left">在 Bootstrap 2 中，我们对框架中的某些关键部分增加了对移动设备友好的样式。而在 Bootstrap 3 中，我们重写了整个框架，使其一开始就是对移动设备友好的。
							这次不是简单的增加一些可选的针对移动设备的样式，而是直接融合进了框架的内核中。也就是说，Bootstrap 是移动设备优先的。针对移动设备的样式融合进了框架的每
							个角落，而不是增加一个额外的文件。</p>
    	</div>
    	<div role="tabpanel" class="tab-pane" id="inquiryinfo">
    		<h4>一般情况及现病史</h4>
			<c:forEach begin="1" end="10" step="1">
				<div class="inline-block">
					<p class="text-primary">你最近常常感到疲倦吗？</p> <p class="text-success">我精神最近很不好</p>
				</div>
			</c:forEach>
			<h4>系统回顾与既往史</h4>
			<c:forEach begin="1" end="10" step="1">
				<div class="inline-block">
					<p class="text-primary">你最近常常感到疲倦吗？</p> <p class="text-success">我精神最近很不好</p>
				</div>
			</c:forEach>
    	</div>
    	<div role="tabpanel" class="tab-pane" id="messages">...</div>
    	<div role="tabpanel" class="tab-pane" id="settings">...</div>
  	</div>
</body>
</html>