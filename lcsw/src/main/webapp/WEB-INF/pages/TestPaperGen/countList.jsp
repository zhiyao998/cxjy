<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common.jsp"%>
<title>组卷列表</title>
</head>
<body>
	<div>
		<h3>使用双向细目表结构化组卷  </h3>
		<table>
			<thead>
				<tr>
					<th>
						<p>主题词</p>
					</th>
					<th>
						<p>A2</p>
					</th>
					<th>
						<p>A4</p>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ }">
					
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>