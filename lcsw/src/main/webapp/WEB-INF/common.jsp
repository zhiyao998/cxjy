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
<link rel="stylesheet" type="text/css" href="/lcsw/public/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/lcsw/public/easyui/themes/icon.css">
<script type="text/javascript" src="/lcsw/public/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/lcsw/public/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/lcsw/public/easyui/easyui-lang-zh_CN.js?id=2"></script>
<script type="text/javascript" src="/lcsw/public/form/jquery.form.3.5.js"></script>
<script type="text/javascript">
function closeWindow(){
	parent.closeWindow('${windowid}');
}
function closeWindow(id) {
	$('#' +id).window('close', true);
}
function open(step) {
	//生成随机数
	switch (step) {
	case "0":
		url="/lcsw/case/toAdd.action";
		break;
	case "1":
		url ="/lcsw/inquiry/toAdd.action";
		break;
	case "2":
		url="/lcsw/physicalExam/toAddPhysicalExam.action";
		break;
	case "3":
		url="/lcsw/firstVisit/toAddFirstVisit.action";
		break;
	case "4":
		url="/lcsw/AccessoryExam/toAddAccessoryExam.action";
		break;
	case "5":
		url="/lcsw/diagnose/toAddDiagnose.action";
		break;
	case "6":
		url="/lcsw/treatment/toAddTreatment.action";
		break;
	default:
		url="/lcsw/case/management.action";
		break;
	}
	
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
	$.post("/lcsw/case/clear.action",null,function(data){
		if(data.status){
			resertForm();
			parent.$('#${windowid}').window('close');
		}
	});
}

function  resertForm(){
     $(':input','#inputForm') 
     .not(':button, :submit, :reset, :hidden') 
     .val('') 
     .removeAttr('checked') 
     .removeAttr('selected');
}

function last() {
	var step = $("#step").val();
	$.post("/lcsw/case/last.action", { 'step':step}, function(data) {
		if (data.status) {
				//ok后的回调方法，去关闭父页面的窗口元素
				parent.open(data.lastStep);
				parent.$('#${windowid}').window('close');
		}
	}, "json");
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
			$(input1).textbox("enable");
			$(input2).textbox("enable");
			$(input3).textbox("enable");
	}else{
			$(input1).textbox("disable");
			$(input2).textbox("disable");
			$(input3).textbox("disable");
	}
}

function changeResult(checkbox) {
	var parent = $(checkbox).parent().parent();
	var children = $(parent).children();
	var td1 = children[2];
	var td2 = children[5];
	var input1 = $(td1).children()[0];
	var input2 = $(td2).children()[0];
	if(checkbox.checked){
			$(input1).textbox("enable");
			$(input2).numberbox("enable");
	}else{
			$(input1).textbox("disable");
			$(input2).numberbox("disable");
	}
}

//网上找的缩略图代码
function PreviewImage(fileObj,imgPreviewId,divPreviewId){  
    var allowExtention=".jpg,.bmp,.gif,.png";//允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;  
    var extention=fileObj.value.substring(fileObj.value.lastIndexOf(".")+1).toLowerCase();              
    var browserVersion= window.navigator.userAgent.toUpperCase();  
    if(allowExtention.indexOf(extention)>-1){   
        if(fileObj.files){//HTML5实现预览，兼容chrome、火狐7+等  
            if(window.FileReader){  
                var reader = new FileReader();   
                reader.onload = function(e){  
                    document.getElementById(imgPreviewId).setAttribute("src",e.target.result);  
                }    
                reader.readAsDataURL(fileObj.files[0]);  
            }else if(browserVersion.indexOf("SAFARI")>-1){  
                alert("不支持Safari6.0以下浏览器的图片预览!");  
            }  
        }else if (browserVersion.indexOf("MSIE")>-1){  
            if(browserVersion.indexOf("MSIE 6")>-1){//ie6  
                document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);  
            }else{//ie[7-9]  
                fileObj.select();  
                if(browserVersion.indexOf("MSIE 9")>-1)  
                    fileObj.blur();//不加上document.selection.createRange().text在ie9会拒绝访问  
                var newPreview =document.getElementById(divPreviewId+"New");  
                if(newPreview==null){  
                    newPreview =document.createElement("div");  
                    newPreview.setAttribute("id",divPreviewId+"New");  
                    newPreview.style.width = document.getElementById(imgPreviewId).width+"px";  
                    newPreview.style.height = document.getElementById(imgPreviewId).height+"px";  
                    newPreview.style.border="solid 1px #d2e2e2";  
                }  
                newPreview.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";                              
                var tempDivPreview=document.getElementById(divPreviewId);  
                tempDivPreview.parentNode.insertBefore(newPreview,tempDivPreview);  
                tempDivPreview.style.display="none";                      
            }  
        }else if(browserVersion.indexOf("FIREFOX")>-1){//firefox  
            var firefoxVersion= parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);  
            if(firefoxVersion<7){//firefox7以下版本  
                document.getElementById(imgPreviewId).setAttribute("src",fileObj.files[0].getAsDataURL());  
            }else{//firefox7.0+                      
                document.getElementById(imgPreviewId).setAttribute("src",window.URL.createObjectURL(fileObj.files[0]));  
            }  
        }else{  
            document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);  
        }           
    }else{  
        alert("仅支持"+allowExtention+"为后缀名的文件!");  
        fileObj.value="";//清空选中文件  
        if(browserVersion.indexOf("MSIE")>-1){                          
            fileObj.select();  
            document.selection.clear();  
        }                  
        fileObj.outerHTML=fileObj.outerHTML;  
    }  
}
</script>