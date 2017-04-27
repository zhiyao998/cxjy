<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加问题</title>
<%@ include file="../../common.jsp"%>
<script type="text/javascript">
	function addNewAnswer() {
		var html = "";
		var type = $('#accessoryexamType').combobox("getValue");
		if(type != "2"){
			html = "<tr><td><input class='easyui-textbox' data-options='required:true'></td><td><input class='easyui-textbox' data-options='required:true'></td><td><input class='easyui-numberbox' style='width:50px;' required='required' data-options='min:-10,max:10,editable:true'></td><td><a href='#' onclick='removeAnswer(this)' class='easyui-linkbutton' data-options=\"iconCls:'fa-window-close'\"></a> </td><td><input type='hidden'></td></tr>";
		}else{
			html = "<tr><td><input class='easyui-textbox' data-options='required:true'></td><td><input class='easyui-filebox' data-options='required:true'></td><td><input class='easyui-numberbox' style='width:50px;' required='required' data-options='min:-10,max:10,editable:true'></td><td><a href='#' onclick='removeAnswer(this)' class='easyui-linkbutton' data-options=\"iconCls:'fa-window-close'\"></a> </td></tr>";
		}
		$("#answers").append(html);
		$.parser.parse("#answers");
	};
	function removeAnswer(r) {
		var tr = $(r).parent().parent();
		var td = $(r).parent().next();
		var id = $(td).children()[0].value;
		if(id != "" && id != null){
			$.post("/lcsw/question/deleteAnswer.action", {
				'id':id,
			}, function(data) {
					if (data.status) {
					$.messager.alert('系统消息', "删除成功", 'info',
							function() {
								$('#grid').datagrid('reload');
							});
				} 
			}, "json");
		}
		$(tr).remove();
	};
	function submitQuestion() {
		var flag1 = $("#inputForm").form('enableValidation').form('validate'); 
		if(flag1){
			var json1 = $("#inputForm").serializeArray();
			var json = "{";
			var id = $("#questionId").val();
			var ftheme = $("#ftheme").combobox("getText");
			var stheme = $("#stheme").combobox("getValue");
			var title = $("#title").textbox("getValue");
			var caseid = $("#caseId").val();
			json += "\"question\":{\"questionId\":\""+ id +"\",\"ftheme\":\""+ ftheme +"\",\"stheme\":\""+ stheme +"\",\"title\":\""+ title + "\",\"caseId\":\""+ caseid  +"\"}";
	 		var trs = $("#answers tr");
			json += ",\"answers\":[";
			var flag = true;
			var length = 0;
			$(trs).each(function() {
				var tds = $(this).children();
				var type = $('#accessoryexamType').combobox("getValue");
				if(type == "2"){
					var id = $(tds[4]).children()[0].value;
				}else{
					if(length < 3){
						var id = $(tds[3]).children()[0].value;
					}else{
						var id = $(tds[4]).children()[0].value;
					}
				}
				var info = $(tds[0]).children()[0].value;
				var analysis = $(tds[1]).children()[0].value;
				var score = $(tds[2]).children()[0].value;
				if(flag){
					json += "{\"answerId\":\""+ id +"\",\"info\":\""+ info +"\",\"analysis\":\""+ analysis +"\",\"score\":\""+ score + "\"}";
					flag = false;
				}else{
					json += ",{\"answerId\":\""+ id +"\",\"info\":\""+ info +"\",\"analysis\":\""+ analysis +"\",\"score\":\""+ score + "\"}";					
				}
				length++;
			});
			json += "]}"; 
			$.ajax({
			    headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json' 
			    },
			    'type': 'POST',
			    'url': "/lcsw/question/addQuestion.action",
			    'data': json,
			    
			    'dataType': 'json',
			    'success': function(data) {
			    	if(data.status){
			    		parent.$("#answerList").datagrid('reload');
				    	parent.$('#${windowid}').window('close');
			    	}
				}
			});
		}

	}
	$(function() {
		if($("#questionId").val() != null && $("#questionId").val() != ""){
			$.ajax({
			    'type': 'POST',
			    'url': "/lcsw/question/getQuestion.action?questionId=" + $("#questionId").val(),
			    'dataType': 'json',
			    'success': function(data) {
					if (data.status) {
						var answers = data.answers;
						var question = data.question;
						$("#ftheme").combobox("select",question.ftheme);
						$("#title").textbox("setValue",question.title);
						$("#caseId").val(question.caseId);
						if(answers.length > 3){
							for(var i = 3; i < answers.length; i++){
								html = "<tr><td><input id='info"+ i +"' class='easyui-textbox' data-options='required:true'></td>" + 
										"<td><input id='analysis" + i + "' class='easyui-textbox' data-options='required:true'></td>" + 
										"<td><input id='score" + i +"' class='easyui-numberbox' style='width:50px;' required='required' data-options='min:-10,max:10,editable:true'></td>" + 
										"<td><a href='#' onclick='removeAnswer(this)' class='easyui-linkbutton' data-options=\"iconCls:'fa-window-close'\"></a> </td>" + 
										"<td><input id='id" + i + "' type='hidden'></td></tr>";
								$("#answers").append(html);
							}
							$.parser.parse("#answers");
						}
						var trs = $("#answers tr");
						for(var i = 0; i < trs.length; i++) {
							$("#info" + i).textbox("setValue",answers[i].info);
							$("#analysis" + i).textbox("setValue",answers[i].analysis);
							$("#score" + i).numberbox("setValue",answers[i].score);
							$("#id" + i).val(answers[i].answerId);
						}
					}
				}
			});	
		}	
		$('#accessoryexamType').combobox({
			onSelect: function(){
				var type = $('#accessoryexamType').combobox("getValue");
				if(type == "2"){
					$("#answers").empty();
				}			
			}
		});
	});
</script>

</head>
<body>
<div class="easyui-layout" data-options="fit:true">
		
	<div id="main" data-options="region:'center',border:false" style="padding: 10px;">
	<form id="inputForm" method="post">  
		<input type="hidden" id="questionId" name="questionId" value="${requestScope.questionId }">
		<input type="hidden" id="caseId" name="caseId" value="${requestScope.caseId }">
		<table>
			<tr>
				<td>
					<label for="ftheme">一级主题词：</label>
				</td>
				<td>
					<select id="ftheme" name="ftheme" class="easyui-combobox" data-options="required:true" style="width: 100px;">
						<option value="0"></option>
						<option value="问诊">问诊</option>   
    					<option value="体格检查">体格检查</option>   
    					<option value="初步诊断">初步诊断</option>   
    					<option value="辅助检查">辅助检查</option>   
    					<option value="确诊">确诊</option>   
    					<option value="治疗方案">治疗方案</option>
    					<option value="病人管理">病人管理</option>   
					</select> 
				</td>
				<td>
					<label for="stheme">二级主题词：</label>
				</td>
				<td>
					<select id="stheme" name="stheme" class="easyui-combobox" style="width:100px;">
							<option value="0"></option>
					</select>
				</td>
			</tr>
			<tr id="type">
				<td>
					<label for="accessoryexamType">答案类型：</label>
				</td>
				<td>
					<select id="accessoryexamType" name="accessoryexamType" class="easyui-combobox" data-options="required:true" style="width:100px;">
						<option value="1">文本</option>   
    					<option value="2">图像</option> 
					</select>
				</td>
			</tr>
			<tr style="height: 30%;width: 50%">
				<td>
					<label for="title">题目：</label>
				</td>
				<td>
					<textarea rows="5" cols="30" class="easyui-textbox" id="title" name="title" data-options="required:true,multiline:true" style="height: 80px;width: 240px"></textarea>
				</td>
			</tr>
		</table>
		<table>
			<thead>
				<tr>
					<th>答案选项</th>
					<th>答案分析</th>
					<th>分值</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="answers">
				<tr>
					<td><input id="info0" class='easyui-textbox' data-options='required:true'></td>
					<td><input id="analysis0" class='easyui-textbox' data-options='required:true'></td>
					<td><input id="score0" class="easyui-numberbox" style="width:50px;" required="required" data-options="min:-10,max:10,editable:true"></td>
					<td><input id="id0" type="hidden"></td>
				</tr>
				<tr>
					<td><input id="info1" class='easyui-textbox' data-options='required:true'></td>
					<td><input id="analysis1" class='easyui-textbox' data-options='required:true'></td>
					<td><input id="score1" class="easyui-numberbox" style="width:50px;" required="required" data-options="min:-10,max:10,editable:true"></td>
					<td><input id="id1" type="hidden"></td>
				</tr>
				<tr>
					<td><input id="info2" class='easyui-textbox' data-options='required:true'></td>
					<td><input id="analysis2" class='easyui-textbox' data-options='required:true'></td>
					<td><input id="score2" class="easyui-numberbox" style="width:50px;" required="required" data-options="min:-10,max:10,editable:true"></td>
					<td><input id="id2" type="hidden"></td>
				</tr>
			</tbody>
		</table>
		<a href="#" onclick="addNewAnswer()" class="easyui-linkbutton" data-options="iconCls:'fa-plus-square'">增加答案</a>  
	</form>
	</div>	
	<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
		<a id="close" href="#" onclick="submitQuestion()" class="easyui-linkbutton" data-options="iconCls:'fa-check-circle'">提交</a>  
		<a id="close" href="#" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'fa-window-close'">关闭</a>  
	</div>
	
	</div>
</body>
</html>