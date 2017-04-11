<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>辅助检查</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
	#accessoryExamInfo{
		height: 600px;
		width: 100%;
		padding: 50PX;
	}
	#accessoryExamInfo ul li{
		padding-top: 20px;
		padding-bottom: 20px;
		width: 100%;
	}
	#accessoryExamInfo ul{
		width: 150px;
	}
	
	#accessoryExamType{
		background-color: #434343;
	}
	#accessoryExamBody div{
		margin: 30px;
	}
</style>
</head>
<body>
	<div id="accessoryExamInfo">
		<div class="row">
			<div class="col-md-1">
				<ul id="accessoryExamType" class="nav nav-tabs nav-stacked text-center affix" data-spy="affix" data-offset-top="200">
  					<li><a href="#now">实验室检查</a></li>
  					<li><a href="#last">影像检查</a></li>
				</ul>
			</div>
			<div id="accessoryExamBody" class="col-md-5 text-left">
				<div>
					<h4>实验室检查</h4>
					<div>
						<a class="check" class="text-primary" href="javascript:void(0)" data-toggle="modal" data-target="#myModal">肝功能全套</a> 
					</div>
					<div>
						<a class="check" class="text-primary" href="javascript:void(0)" data-toggle="modal" data-target="#myModal">血脂全套</a> 
					</div>
				</div>
				<div>
					<h4>影像检查</h4>
					<div>
						<a class="check" class="text-primary" href="javascript:void(0)" data-toggle="modal" data-target="#myModal">心电图检查</a> 
					</div>
				</div>
			</div>
			<div id="accessoryExamShow" class="col-md-6">
				<div>
					
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  	<div class="modal-dialog" role="document">
    	<div class="modal-content">
     		<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        	<h4 class="modal-title" id="myModalLabel">肝功能全套</h4>
      	</div>
      	<div class="modal-body">
      		<table class="table">
      			<thead>
      				<tr>
      					<td>序号</td>
      					<td>项目名称</td>
      					<td>检验结果</td>
      					<td>单位</td>
      					<td>参考范围</td>
      				</tr>
      			</thead>
      			<tbody>
      				<c:forEach varStatus="i" begin="1" end="10" step="1">
      					<tr>
      						<td>${i.count }</td>
      						<td>磷脂</td>
      						<td>2</td>
      						<td>mmol/L</td>
      						<td>1.9~3.2</td>
      					</tr>
      				</c:forEach>
      			</tbody>
      		</table>
      	</div>
      	<div class="modal-footer">
        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      	</div>
   </div>
  </div>
</div>
</body>
</html>