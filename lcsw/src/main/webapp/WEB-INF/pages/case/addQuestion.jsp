<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加问题</title>
<%@ include file="../../common.jsp"%>
<style type="text/css">
	tr th, tr td{
		border: 1px solid #196AC5;
		border-collapse: collapse;
	}
	.divStyle div{
		margin: 10px;
		padding: 5px;
	}
</style>
<script type="text/javascript">
	var newAnswer = 3;
	function addNewAnswer() {
		var html = ""; 
		html = "<tr><td width='20%'><div class='divStyle'><input id='id" + newAnswer +"' type='hidden'><div style='display: inline-block;'><label>" + (newAnswer+1) + "、</label><textarea id='info" + newAnswer + "' class='easyui-textbox' data-options='required:true,multiline:true' style='width: 100%;min-height: 60px;max-height:80px;'></textarea></div>";
		html += "<div><label>分值:</label><input id='score" + newAnswer + "' class='easyui-numberbox' style='width:40px;' required='required' data-options='min:-10,max:10,editable:true'></div> </div><a href='#' onclick='removeAnswer(this)' class='easyui-linkbutton' data-options=\"iconCls:'fa-window-close'\">删除选项</a></td>" + 
				"<td width='40%'><textarea id='result"+ newAnswer +"' class='easyui-validatebox' data-options='required:true' style='width: 100%'></textarea></td>" + 
				"<td width='40%'><textarea id='analysis"+ newAnswer +"' class='easyui-validatebox' data-options='required:true' style='width: 100%'></textarea></td>";
		$("#answers").append(html);
		$('#analysis' + newAnswer).ckeditor();
		$('#result' + newAnswer).ckeditor();
		$.parser.parse("#answers");
		newAnswer++;
	};
	function removeAnswer(r) {
		var tr = $(r).parent().parent();
		var input = $(tr).find(":hidden");
		var id = $(input).val();
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
			var title = escape($("#title").val());
			var caseid = $("#caseId").val();
			json += "\"question\":{\"questionId\":\""+ id +"\",\"ftheme\":\""+ ftheme +"\",\"title\":\""+ title + "\",\"caseId\":\""+ caseid  +"\"}";
	 		var trs = $("#answers tr");
			json += ",\"answers\":[";
			var flag = true;
			var length = 0;
			$(trs).each(function() {
				var id = $("#id" + length).val();
				var info = $("#info" + length).val();
				var result = escape($("#result" + length).val());
				var analysis = escape($("#analysis" + length).val());
				var score = $("#score" + length).val();
				if(flag){
					json += "{\"answerId\":\""+ id +"\",\"info\":\""+ info + "\",\"result\":\""+ result +"\",\"analysis\":\""+ analysis +"\",\"score\":\""+ score + "\"}";
					flag = false;
				}else{
					json += ",{\"answerId\":\""+ id +"\",\"info\":\""+ info + "\",\"result\":\""+ result +"\",\"analysis\":\""+ analysis +"\",\"score\":\""+ score + "\"}";					
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
			    		var c = data.newCase;
			    		parent.$("#inquiryCount").text(c.inquiryCount);
			    		parent.$("#phyEaxmCount").text(c.phyEaxmCount);
			    		parent.$("#fstVisitCount").text(c.fstVisitCount);
			    		parent.$("#aryEaxmCount").text(c.aryEaxmCount);
			    		parent.$("#diagnoseCount").text(c.diagnoseCount);
			    		parent.$("#treatmentCount").text(c.treatmentCount);
			    		parent.$("#patManCount").text(c.patManCount);
			    		parent.$("#totalCount").text(c.totalCount);
			    		parent.$("#panswerTotal").text(c.panswerTotal);
			    		parent.$("#nanswerTotal").text(c.nanswerTotal);
			    		parent.$("#zanswerTotal").text(c.zanswerTotal);
			    		parent.$("#answerTotal").text(c.answerTotal);
			    		parent.$("#answerList").datagrid('reload');
				    	parent.$('#${windowid}').window('close');
			    	}
				}
			});
		}

	}
	$(function() {
		$('#title').ckeditor();
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
						$("#title").val(unescape(question.title));
						$("#caseId").val(question.caseId);
						if(answers.length > 3){
							for(var i = 3; i < answers.length; i++){
								html = "<tr><td width='15%'><div class='divStyle'><input id='id" + i +"' type='hidden'><div style='display: inline-block;'><label>" + (i+1) + "、</label><textarea id='info" + i + "' class='easyui-textbox' data-options='required:true,multiline:true' style='width: 100%;min-height: 60px;max-height:80px;'></textarea></div>";
								html += "<div><label>分值:</label><input id='score" + i + "' class='easyui-numberbox' style='width:40px;' required='required' data-options='min:-10,max:10,editable:true'></div></div><a href='#' onclick='removeAnswer(this)' class='easyui-linkbutton' data-options=\"iconCls:'fa-window-close'\">删除选项</a> </td>" + 
										"<td width='40%'><textarea id='result"+ i +"' class='easyui-validatebox' data-options='required:true' style='width: 100%'></textarea></td>" + 
										"<td width='40%'><textarea id='analysis"+ i +"' class='easyui-validatebox' data-options='required:true' style='width: 100%'></textarea></td>";
								$("#answers").append(html);
							}
							$.parser.parse("#answers");
						}
						var trs = $("#answers tr");
						newAnswer = 0;
						for(var i = 0; i < trs.length; i++) {
							$('#analysis' + i).ckeditor();
							$('#result' + i).ckeditor();
							$("#info" + i).textbox("setValue",answers[i].info);
							$("#analysis" + i).val(unescape(answers[i].analysis));
							$("#result" + i).val(unescape(answers[i].result));
							$("#score" + i).numberbox("setValue",answers[i].score);
							$("#id" + i).val(answers[i].answerId);
							newAnswer++;
						}
					}
				}
			});	
		}else{
			$('#analysis0').ckeditor();
			$('#analysis1').ckeditor();
			$('#analysis2').ckeditor();
			$('#result0').ckeditor();
			$('#result1').ckeditor();
			$('#result2').ckeditor();
		}	
	});
</script>

</head>
<body>
<div class="easyui-layout" data-options="fit:true">
		
	<div id="main" data-options="region:'center',border:false" style="padding: 10px;">
	<form id="inputForm" method="post">  
		<input type="hidden" id="questionId" name="questionId" value="${requestScope.questionId }">
		<input type="hidden" id="caseId" name="caseId" value="${requestScope.caseId }">
		<table style="text-align: center;">
			<tr style="height: 30%;width: 50%">
				<td>
					<label for="ftheme">一级主题词：</label>
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
					<h3>分支题干</h3>
					<textarea rows="5" cols="30" class="easyui-validatebox" id="title" name="title" style="height: 80px;width: 240px"></textarea>
				</td>
			</tr>
		</table>
		<table style="width: 100%;" border="1" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th>选项详情</th>
					<th>结果</th>
					<th>分析</th>
				</tr>
			</thead>
			<tbody id="answers">
				<tr>
					<td width="15%">
						<div class="divStyle">
							<input id="id0" type="hidden">
							<div style="display: inline-block;">
								<label>1、</label><textarea id="info0" class='easyui-textbox' data-options='required:true,multiline:true' style='width: 100%;min-height: 60px;max-height:80px;'></textarea>
							</div>
							<div>
								<label>分值:</label>
								<input id="score0" class="easyui-numberbox" style="width:40px;" required="required" data-options="min:-10,max:10,editable:true">
							</div>
						</div>
					</td>
					<td width="40%"><textarea id="result0" class='easyui-validatebox' data-options='required:true' style="width: 100%"></textarea></td>
					<td width="40%"><textarea id="analysis0" class='easyui-validatebox' data-options='required:true' style="width: 100%"></textarea></td>
				</tr>
				<tr>
					<td width="15%">
						<div class="divStyle">
							<input id="id1" type="hidden">
							<div>
								<label>2、</label><textarea id="info1" class='easyui-textbox' data-options='required:true,multiline:true' style='width: 100%;min-height: 60px;max-height:80px;'></textarea>
							</div>
							<div>
								<label>分值:</label>
								<input id="score1" class="easyui-numberbox" style="width:40px;" required="required" data-options="min:-10,max:10,editable:true">
							</div>
						</div>
					</td>
					<td width="40%"><textarea id="result1" class='easyui-validatebox' data-options='required:true' style="width: 100%"></textarea></td>
					<td width="40%"><textarea id="analysis1" class='easyui-validatebox' data-options='required:true' style="width: 100%"></textarea></td>
				</tr>
				<tr>
					<td width="15%">
						<div class="divStyle">
							<input id="id2" type="hidden">
							<div style="display: inline-block;">
								<label>3、</label><textarea id="info2" class='easyui-textbox' data-options='required:true,multiline:true' style='width: 100%;min-height: 60px;max-height:80px;'></textarea>
							</div>
							<div>
								<label>分值:</label>
								<input id="score2" class="easyui-numberbox" style="width:40px;" required="required" data-options="min:-10,max:10,editable:true">
							</div>
						</div>
					</td>
					<td width="40%"><textarea id="result2" class='easyui-validatebox' data-options='required:true' style="width: 100%"></textarea></td>
					<td width="40%"><textarea id="analysis2" class='easyui-validatebox' data-options='required:true' style="width: 100%"></textarea></td>
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