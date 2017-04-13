<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增辅助检查信息：</title>
<%@ include file="../../common.jsp"%>
<style type="text/css">
/* Border styles */
table thead, table tr {
border-top-width: 1px;
border-top-style: solid;
border-top-color: rgb(230, 189, 189);
}
table {
border-bottom-width: 1px;
border-bottom-style: solid;
border-bottom-color: rgb(230, 189, 189);
}

/* Padding and font style */
table td, table th {
padding: 5px 10px;
font-size: 12px;
font-family: Verdana;
color: rgb(177, 106, 104);
}

/* Alternating background colors */
table tr:nth-child(even) {
background: rgb(238, 211, 210)
}
table tr:nth-child(odd) {
background: #FFF
}

form div{
	padding: 20px;
}
</style>

<script type="text/javascript">
var isChange = false;
var nextStep = null;
$(function() {	
	selectByResultType();
	$('#resultType').combobox({
		onSelect: function(){
			$("#accessoryExamType").combobox("clear");
			selectByResultType();
		}
	});
	$('#accessoryExamType').combobox({
		onSelect: function(){
			selectByAccessoryExamType();
		},
	});
	
});

function uploadFile() {
        if($("#file").filebox("getValue")==""){  
            $.messager.alert("提示","请选择文件夹");  
            return false;  
        }  
         $("#upload").ajaxSubmit({    
            type:"post",  //提交方式    
            url:"/lcsw/AccessoryExam/filesUpload.action", //请求url    
            success:function(data){ //提交成功的回调函数    
				alert("提交成功");
				isChange = true; 
            }    
        });  
};

function selectByResultType() {
	var resultType = $("#resultType").combobox("getValue");
	$.post("/lcsw/AccessoryExam/selectByResultType.action", { "resultType": resultType },
			   function(data){
			     if(data != null){
			    	 $("#main").empty();
			    	 var option =[];
			    	 for(var i = 0; i < data.length; i++){
			    		 option.push({ "text": data[i], "id": data[i] });
			    	 }
			    	 var newobj=JSON.parse(JSON.stringify(option));
			    	 $("#accessoryExamType").combobox("loadData",newobj);
			     }
			   },"json");
}

function selectByAccessoryExamType() {
	var accessoryExamType = $("#accessoryExamType").combobox("getText");
	$.post("/lcsw/AccessoryExam/selectByAccessoryExamType.action", { "accessoryExamType": accessoryExamType },
			   function(data){
					$("#main").empty();
					if(data.length > 0){
						if(data[0].resultType == 1){
							var json = "<table><thead><tr><th>序号</th><th>项目名称</th><th>检验结果</th><th>单位</th><th>参考范围</th><th>分值</th><th>是否修改</th><tr></thead>";
							json += "<tbody>";
							for(var i = 0; i < data.length; i++){
								if(data[i].caseId == 0){
									json += "<tr><td>" + data[i].accessoryExamOrder + "</td><td>" + data[i].accessoryExamName +"</td><td><input disabled='true' class='easyui-textbox' value='" + data[i].accessoryExamResult + "'><input type='hidden' value='" + data[i].accessoryExamId + "'></td><td>wwwww</td><td>qqqqqqq</td>" + 
									"<td><input disabled='true' class='easyui-numberbox' value='0'></td><td><input type='checkbox' onclick='changeResult(this)' value='1'/></td></tr>";
								}else{
									json += "<tr><td>" + data[i].accessoryExamOrder + "</td><td>" + data[i].accessoryExamName +"</td><td><input class='easyui-textbox' value='" + data[i].accessoryExamResult + "'><input type='hidden' value='" + data[i].accessoryExamId + "'></td><td>wwwww</td><td>qqqqqqq</td>" + 
									"<td><input class='easyui-numberbox' value='" + data[i].score +"'></td><td><input type='checkbox' onclick='changeResult(this)' checked='checked' value='1'/></td></tr>";
								}								
							}
							json += "<tr><td><input type='button' id='btn' colspan='5' value='提交修改' bgcolor='rgb(238, 211, 210)' onclick='submitAccessoryExam()'></input></td></tr></tbody></table>";
							$("#main").append(json);
							$.parser.parse("#main");
						}else{
							var json = "<form id='upload' enctype='multipart/form-data' method='post' >" + 
										"<input type='hidden' name='accessoryExamId' value='" + data[0].accessoryExamId + "'></input>" +
										"<input type='hidden' name='accessoryExamName' value='" + data[0].accessoryExamName + "'></input>" + 
										"<input type='hidden' name='accessoryExamOrder' value='" + data[0].accessoryExamOrder + "'></input>" + 
										"<input type='hidden' name='accessoryExamType' value='" + $("#accessoryExamType").combobox("getValue") + "'></input>" +
										"<input type='hidden' name='resultType' value='2'></input>" +
										"<div><label>影像检查</label></div><div><label>" + data[0].accessoryExamName + ":</label><br><input name='score' class='easyui-numberbox' value='" + data[0].score + "'>" + 
										"<input id='file' data-options=\"buttonText:'选择图片',accept:'image/*',onChange:change_photo\" name='file' class='easyui-filebox'><input type='button' id='uploadBtn' value='提交修改' bgcolor='rgb(238, 211, 210)' onclick='uploadFile()'></input>" + 
										" </div></form>";
							if(data[0].accessoryExamResult != null){
								json += "<div id='Imgdiv'><img id='Img' width='200px' height='200px' src='" + data[0].accessoryExamResult  + "'/></div>";
							}else{
								json += "<div id='Imgdiv'><img id='Img' width='200px' height='200px'/></div>";
							}		
							$("#main").append(json);
							//重新渲染样式
							$.parser.parse("#main");
						}
						
					}
			   },"json");
}

function change_photo(){
    PreviewImage($("input[name='file']")[0], 'Img', 'Imgdiv');
}

function submitAccessoryExam() {
	var trs = $("tbody tr");
	if(trs != null){
		var json = "[";
		var flag = true;
		$(":checkbox").each(function(c) {
			var pre = $(this).parent().prevAll();
			var td1 = pre[0];
			var td2 = pre[3];
			var td3 = pre[4];
			var td4 = pre[5];
			var input1 = $(td1).children()[0];
			var input2 = $(td2).children()[0];
			var input3 = $(td2).children()[2];
			if(this.checked){
				if(flag){
					json += "{\"accessoryExamOrder\":\""+ $(td4).text() +"\",\"accessoryExamName\":\""+ $(td3).text() + "\",\"accessoryExamResult\":\"" + $(input2).val()
						+ "\",\"accessoryExamId\":\"" + $(input3).val()
						+ "\",\"score\":\""+ $(input1).val() + "\",\"resultType\":\""+ $(this).val()
						+ "\",\"accessoryExamType\":\"" + $("#accessoryExamType").combobox("getValue") +"\"}"
					flag = false;
				}else{
					json += ",{\"accessoryExamOrder\":\""+ $(td4).text() +"\",\"accessoryExamName\":\""+ $(td3).text() + "\",\"accessoryExamResult\":\""+ $(input2).val()
						+ "\",\"accessoryExamId\":\"" + $(input3).val()
						+ "\",\"score\":\""+ $(input1).val() + "\",\"resultType\":\""+ $(this).val()
						+ "\",\"accessoryExamType\":\"" + $("#accessoryExamType").combobox("getValue") +"\"}"
				}
			}
		});
		json += "]";
		if(json=="[]"){
			alert("请选择辅助检查！");
		}else{
			$.ajax({
			    headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json' 
			    },
			    'type': 'POST',
			    'url': "/lcsw/AccessoryExam/next.action",
			    'data': json,
			    'dataType': 'json',
			    'success': function(data) {
					if (data.status) {
						alert("提交成功");
						isChange = true;
						nextStep = data.nextStep;
					}
				}
			});
		}
	}
	return false;
}

function next() {
	if(isChange){
		parent.open(nextStep);
		parent.$('#${windowid}').window('close');
	}else{
		alert("尚未选择辅助信息");
	}
}

</script>
</head>
<body>
		<div class="easyui-layout" data-options="fit:true">
		
	<div data-options="region:'center',border:false" style="padding: 10px;">
		<select id="resultType" name="resultType" class="easyui-combobox">
			<option value="1">实验室检查</option>
			<option value="2">影像检查</option>
		</select>
		<select id="accessoryExamType" name="accessoryExamType" class="easyui-combobox" style="width: 100px" data-options="valueField:'id', textField:'text'">
			
		</select>
		
		<div id="main">
			
		</div>
	<input type="hidden" id="step" value="4">
			
	</div>	
	<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
		<a id="last" href="#" onclick="last()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">上一步</a>  
		<a id="submit" href="#" onclick="next()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">下一步</a>  
		<a id="close" href="#" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'icon-no'">关闭</a>  
	</div>
		
	</div>
</body>
</html>