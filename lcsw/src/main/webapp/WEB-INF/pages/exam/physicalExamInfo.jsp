<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>体检信息</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
	
	#physicalExamInfo{
		height: 600px;
		width: 100%;
		padding: 50PX;
	}
	#physicalExamInfo ul li{
		padding-top: 20px;
		padding-bottom: 20px;
		width: 100%;
	}
	#physicalExamInfo ul{
		width: 150px;
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
		$(".check").click(function() {
			var p = $(this).next("p");
			$(p).removeClass("hidden");
		});
	})
</script>
</head>
<body>
	<div id="physicalExamInfo" class="container">
		<div class="row">
			<div class="col-md-1">
				<ul id="physicalExamType" class="nav nav-tabs nav-stacked text-center affix" data-spy="affix" data-offset-top="200">
  					<li><a href="#p1">生命体征</a></li>
  					<li><a href="#p2">一般情况</a></li>
 					<li><a href="#p3">皮肤粘膜</a></li>
 					<li><a href="#p4">淋巴结</a></li>
 					<li><a href="#p5">头颈部</a></li>
				</ul>
			</div>
			<div id="physicalExamBody" class="col-md-11 text-left">
				<div>
					<h4>生命体征</h4>
					<div>
						<a class="check" class="text-primary" href="javascript:void(0)">脉率（次/分）</a> <p class="text-success hidden">70</p>
					</div>
					<div>
						<a class="check" class="text-primary" href="javascript:void(0)">血压（mmHg）</a> <p class="text-success hidden">110/70</p>
					</div>
					<div>
						<a class="check" class="text-primary" href="javascript:void(0)">体温（℃）</a> <p class="text-success hidden">110/70</p>
					</div>
				</div>
				<div>
					<h4>一般情况</h4>
					<c:forEach begin="1" end="2" step="1">
					<div>
						<a class="check" class="text-primary" href="javascript:void(0)">脉率（次/分）</a> <p class="text-success hidden">70</p>
					</div>
					<div>
						<a class="check" class="text-primary" href="javascript:void(0)">血压（mmHg）</a> <p class="text-success hidden">110/70</p>
					</div>
					<div>
						<a class="check" class="text-primary" href="javascript:void(0)">体温（℃）</a> <p class="text-success hidden">110/70</p>
					</div>				
					</c:forEach>
				</div>
				<div>
					<h4>皮肤粘膜</h4>
					<c:forEach begin="1" end="2" step="1">
					<div>
						<a class="check" class="text-primary" href="javascript:void(0)">脉率（次/分）</a> <p class="text-success hidden">70</p>
					</div>
					<div>
						<a class="check" class="text-primary" href="javascript:void(0)">血压（mmHg）</a> <p class="text-success hidden">110/70</p>
					</div>
					<div>
						<a class="check" class="text-primary" href="javascript:void(0)">体温（℃）</a> <p class="text-success hidden">110/70</p>
					</div>
					</c:forEach>
				</div>
				<div>
				<h4>淋巴结</h4>
				<c:forEach begin="1" end="2" step="1">
				<div>
					<a class="check" class="text-primary" href="javascript:void(0)">脉率（次/分）</a> <p class="text-success hidden">70</p>
				</div>
				<div>
					<a class="check" class="text-primary" href="javascript:void(0)">血压（mmHg）</a> <p class="text-success hidden">110/70</p>
				</div>
				<div>
					<a class="check" class="text-primary" href="javascript:void(0)">体温（℃）</a> <p class="text-success hidden">110/70</p>
				</div>
				</c:forEach>
				</div>
				<div>
				<h4>头颈部</h4>
				<c:forEach begin="1" end="2" step="1">
				<div>
					<a class="check" class="text-primary" href="javascript:void(0)">脉率（次/分）</a> <p class="text-success hidden">70</p>
				</div>
				<div>
					<a class="check" class="text-primary" href="javascript:void(0)">血压（mmHg）</a> <p class="text-success hidden">110/70</p>
				</div>
				<div>
					<a class="check" class="text-primary" href="javascript:void(0)">体温（℃）</a> <p class="text-success hidden">110/70</p>
				</div>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>