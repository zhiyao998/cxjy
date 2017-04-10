<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
	#physicalExamInfo{
		height: 600px;
		width: 100%;
		padding: 50PX;
	}
	#physicalExamInfo ul li{
		padding-top: 50px;
		padding-bottom: 50px;
	}
		#physicalExamInfo ol li{
		margin-top: 30px;
		margin-bottom: 30px;
	}
	#physicalExamType{
		background-color: #434343;
	}
	#physicalExamBody div{
		margin: 30px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$(".question").click(function() {
			var p = $(this).next("p");
			$(p).removeClass("hidden");
		});
	})
</script>
</head>
<body>
	<div id="physicalExamInfo" class="container">
		<div class="row">
			<div class="col-md-1 scrollnav" style="height: 750px;">
				<ul id="physicalExamType" class="nav nav-tabs nav-stacked text-center affix" data-spy="affix" data-offset-top="200">
  					<li><a href="#now">一般情况及现病史</a></li>
  					<li><a href="#last">系统回顾与既往史</a></li>
 					<li><a href="#person">个人史</a></li>
				</ul>
			</div>
			<div id="physicalExamBody" class="col-md-11 text-left">
				<div id="now">
					<h4>一般情况及现病史</h4>
					<c:forEach begin="1" end="10" step="1">
						<div>
							<a class="question" class="text-primary" href="javascript:void(0)">你最近常常感到疲倦吗？</a> <p class="text-success hidden">我精神最近很不好</p>
						</div>
					</c:forEach>
				</div>
				<div id="last">
					<h4>系统回顾与既往史</h4>
					<c:forEach begin="1" end="10" step="1">
						<div>
							<a class="question" class="text-primary" href="javascript:void(0)">你最近常常感到疲倦吗？</a> <p class="text-success hidden">我精神最近很不好</p>
						</div>
					</c:forEach>
				</div>
				<div id="person">
					<h4>个人史</h4>
					<c:forEach begin="1" end="10" step="1">
						<div>
							<a class="question" class="text-primary" href="javascript:void(0)">你最近常常感到疲倦吗？</a> <p class="text-success hidden">我精神最近很不好</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>