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
<link rel="stylesheet" type="text/css" href="/lcsw/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/lcsw/js/easyui/themes/icon.css">
<script type="text/javascript" src="/lcsw/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/lcsw/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/lcsw/js/easyui/easyui-lang-zh_CN.js?id=2"></script>
<script type="text/javascript" src="/lcsw/js/form/jquery.form.3.5.js"></script>
<script type="text/javascript">
function closeWindow(){
	parent.closeWindow('${windowid}');
}
function closeWindow(id) {
	$('#' +id).window('close', true);
}
function open(title, url, width, hight) {
	//生成随机数
	var windowid = "windowid" +Math.floor(Math.random() *Math.pow(10, 12));
	if (url.indexOf("?") != -1) {
		url = url +"&windowid=" +windowid;
	} else {
		url = url +"?windowid=" +windowid;
	}
	var html = '<div id="'+windowid+'"><iframe frameborder="0" marginwidth="100%" width="100%" height="100%" src="'
			+ url + '" ></iframe></div>';
	$("body").append(html);
	$('#'+windowid).window({
		title : title,
		width : width,
		height : hight,
		modal : true,
		//当window关闭时把这个窗口的代码清除。
		onClose : function() {
			$('#'+windowid).window('destroy');
		}
	});
}

function last() {
	parent.open($("#lastTitle").val(),$("#lastUrl").val(),$("#lastWidth").val(),$("#lastHight").val());
	parent.$('#${windowid}').window('close');
}

/* 设置输入框的可编辑性  */
function change(checkbox) {
	var pre = $(checkbox).parent().prevAll();
	var td1 = pre[0];
	var td2 = pre[1];
	var td3 = pre[2];
	var input1 = $(td1).children()[0];
	var input2 = $(td2).children()[0];
	var input3 = $(td3).children()[0];
	if(checkbox.checked){
			$(input1).attr("disabled",false);
			$(input2).attr("disabled",false);
			$(input3).attr("disabled",false);
	}else{
			$(input1).attr("disabled",true);
			$(input2).attr("disabled",true);
			$(input3).attr("disabled",true);
	}
}
</script>