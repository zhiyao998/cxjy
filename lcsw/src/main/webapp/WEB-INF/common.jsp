<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!-- easyui install pack -->
<%
	//清除页面缓存
	response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1    
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0    
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server   
	String ctx = request.getContextPath();
	request.setAttribute("ctx", ctx);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="/lcsw/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/lcsw/js/easyui/themes/icon.css">
<script type="text/javascript" src="/lcsw/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/lcsw/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/lcsw/js/easyui/easyui-lang-zh_CN.js?id=2"></script>
<script type="text/javascript" src="/lcsw/js/form/jquery.form.3.5.js"></script>
