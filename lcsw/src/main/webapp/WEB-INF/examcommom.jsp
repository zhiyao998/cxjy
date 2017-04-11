<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
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
<script type="text/javascript" src="/lcsw/public/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/lcsw/public/form/jquery.form.3.5.js"></script>
<link rel="stylesheet" type="text/css" href="/lcsw/public/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/lcsw/public/bootstrap/css/bootstrap-submenu.min.css">
<script type="text/javascript" src="/lcsw/public/bootstrap/js/bootstrap.min.js"></script>
<script src="/lcsw/public/bootstrap/js/bootstrap-submenu.min.js" defer></script>
<script src="/lcsw/public/plugins/jquery.slidereveal.min.js" defer></script>
