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
<link rel="stylesheet" type="text/css" href="${ctx }/public/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx }/public/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${ctx }/public/Font-Awesome/css/font-awesome.min.css">
<script type="text/javascript" src="${ctx }/public/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/public/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx }/public/easyui/easyui-lang-zh_CN.js?id=2"></script>
<script type="text/javascript" src="${ctx }/public/form/jquery.form.3.5.js"></script>
<style>
	.l-btn-icon,.panel-icon,.menu-icon,.tabs-icon {
    font-family:FontAwesome;
    font-size:14px !important;
    line-height:normal !important;
    text-rendering:auto;
    -webkit-font-smoothing:antialiased;
    -moz-osx-font-smoothing:grayscale;
    color:#6699cc;text-align:center;
}
.tabs-icon {
    font-size:16px !important;
    font-weight:normal;
}
</style>
<script type="text/javascript">
var flag = false;

function addtab(title,url) {
	var chiose = $('#tabs').tabs("exists",title);
	if(chiose){
		$('#tabs').tabs("select",title);
	}else{
		// 在用户点击的时候提示
	       $('#tabs').tabs('add', {
	            title: title,
	            content: createFrame(url),
	            closable: true,
	            width: $('#mainPanle').width() - 10,
	            height: $('#mainPanle').height() - 26
	        });
	}
}


function back(){
	var tab = window.parent.$('#tabs').tabs('getSelected');
	var index = window.parent.$('#tabs').tabs('getTabIndex',tab);
	window.parent.$('#tabs').tabs('close',index);
}

function createFrame(url) {
    var s = '<iframe name="mainFrame" scrolling="no" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
    return s;
}


function closeWindow(){
	parent.closeWindow('${windowid}');
}
function closeWindow(id) {
	$('#' +id).window('close', true);
}
function open(url) {
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
		width : "900",
		height : "500",
		modal : true,
		//当window关闭时把这个窗口的代码清除。
		onClose : function() {
			$('#'+windowid).window('destroy');
		}
	});
}

function closeWin() {
	parent.$('#${windowid}').window('close');
}
</script>