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
function submit(title, url, width, hight) {
	$('#inputForm').form('submit', {
		onSubmit : function() {
			var flag = $(this).form('enableValidation').form('validate');
			if(flag){
				var json = $("#inputForm").serializeArray();
			  	var url = $(this).attr("action");
				$.post(url, json, function(data) {
					if (data.status) {
						$.messager.alert('系统消息', data.msg, 'info', function() {
							//ok后的回调方法，去关闭父页面的窗口元素
							parent.$('#grid').datagrid('reload');
							parent.open($("#nextTitle").val(),$("#nextUrl").val(),$("#nextWidth").val(),$("#nextHight").val());
							parent.$('#${windowid}').window('close');
						});
					}
				}, "json");
			}
			//返回flase ，否则会提交表单
			return false;
		}
	});
}
</script>