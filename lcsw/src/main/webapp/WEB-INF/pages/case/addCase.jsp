<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加病例</title>
<%@ include file="../../common.jsp"%>
<script type="text/javascript">
	$(function() {
		var caseId = $("#caseId").val();
		if(caseId == null || caseId == ""){
			$("#center").hide();
		}else{
			$.ajax({
			    'type': 'POST',
			    'url': "/lcsw/case/getCase.action?caseId=" + caseId,
			    'dataType': 'json',
			    'success': function(data) {
					if (data.status) {
						var newCase = data.newCase;
						$("#caseType").combobox("select",newCase.caseType);
						$("#chiefComplain").textbox("setValue",newCase.chiefComplain);
						$("#answerList").datagrid({url:"/lcsw/question/list.action?caseId=" + caseId});
						$("#answerList").datagrid("load");
						$("#chiefComplain").textbox("disable");
						$("#caseType").combobox("disable");
						$("#editInfo").linkbutton("enable");
						$("#addInfo").linkbutton("disable");
					}
				}
			});
		}
	});
	function addQuestion() {
		open(0,"/lcsw/question/toAddQuestion.action?caseId=" + $("#caseId").val());
	};
	function editQuestion(id) {
		open(0,"/lcsw/question/toEditQuestion.action?questionId=" + id);
	};
	function deleteQuestion(id) {
		$.messager.confirm('确认对话框', '确认你是否要删除数据？', function(r) {
			if (r) {
	 			$.post("/lcsw/question/deleteQuestion.action", {
					'id':id,
					}, function(data) {
	 					if (data.status) {
							$.messager.alert('系统消息', "删除成功", 'info',
								function() {
									$('#answerList').datagrid('reload');
							});
						} 
					}, "json"); 
			}
		});
	};
	function addCaseInfo() {
		$("#inputForm").form("submit",{
			onSubmit: function() {
				var flag = $(this).form('enableValidation').form('validate'); 
				if(flag){
					var json = $("#inputForm").serializeArray();
				  	var url = $(this).attr("action");
					$.post(url, json, function(data) {
						if (data.status) {
								//ok后的回调方法，去关闭父页面的窗口元素
								if($("#center").is(":hidden")){
									$("#center").show();
								}
								if($("#editInfo").linkbutton("options").disabled == true){
									if(data.Newcase.caseId != null){
										$("#caseId").val(data.Newcase.caseId);
										$("#answerList").datagrid({url:"/lcsw/question/list.action?caseId=" + $("#caseId").val()});
									}
									$("#chiefComplain").textbox("disable");
									$("#caseType").combobox("disable");
									$("#editInfo").linkbutton("enable");
									$("#addInfo").linkbutton("disable");
								}
						}
					}, "json");
				}
				return false;
			}
		});
	}
	function editCaseInfo() {
		if($("#addInfo").linkbutton("options").disabled == true){
			$("#addInfo").linkbutton("enable");
			$("#editInfo").linkbutton("disable");
			$("#chiefComplain").textbox("enable");
			$("#caseType").combobox("enable");
		}
	}
	function formatOpt(val,row,index) {
		return "<button onclick='editQuestion(" + row.questionId + ")'>编辑</button> <button onclick='deleteQuestion(" + row.questionId + ")'>删除</button>";
	}

</script>

<style type="text/css">
	
</style>

</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',border:false" style="width:100%;">
			<form action="/lcsw/question/addCaseInfo.action" method="post" id="inputForm">
				<input type="hidden" id="caseId" name="caseId" value="${requestScope.caseId }">
				<table id="caseInfo" style="text-align: center;">
					<tr style="height: 30%;width: 50%">
						<td>
							<label for="chiefComplain">主诉：</label>
						</td>
						<td>
							<textarea rows="5" cols="50" class="easyui-textbox" id="chiefComplain" name="chiefComplain" data-options="required:true,multiline:true" style="height: 80px;width: 240px"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<label for="caseType">病例类型：</label>
						</td>
						<td>
							<select id="caseType" name="caseType" class="easyui-combobox" data-options="required:true" style="width:200px;">
								<option value="1">普通科</option>   
    							<option value="2">口腔科</option>   
    							<option value="3">内科</option>   
    							<option value="4">外科</option>   
    							<option value="5">胸外科</option>   
    							<option value="6">皮肤科</option>   
							</select>  
						</td>
					</tr>
					<tr>
						<td><a id="editInfo" href="#" onclick="editCaseInfo()" class="easyui-linkbutton" data-options="iconCls:'fa-pencil',disabled:true">编辑</a> </td>
						<td><a id="addInfo" href="#" onclick="addCaseInfo()" class="easyui-linkbutton" data-options="iconCls:'fa-check-circle'">提交</a> </td>
					</tr>
				</table>
				<input id="creater" type="hidden" value="rongyu">
			</form>
		</div>
		<div id="center" data-options="region:'center',border:false" style="padding: 10px;width: 100%">
			<table id="answerList" class="easyui-datagrid" data-options="fitColumns:true,rownumbers:true,toolbar:toolbar" style="width:100%;">
				<thead>
					<tr> 
    					<th data-options="field:'title'" style="width:22%;">题目简介</th>   
            			<th data-options="field:'ftheme'"  style="width:22%;">题目类型</th>
            			<th data-options="field:'ftheme'" style="width: 22%;">主题词</th>   
            			<th data-options="field:'opt',formatter:formatOpt,align:'center'"  style="width:22%;">操作</th> 
					</tr>
				</thead>
				<tbody  id="questions">
						
				</tbody>
			</table>
	<script type="text/javascript">
		var toolbar = [{
			text:'新增分支',
			iconCls:'fa-plus-square',
			handler:function(){
				addQuestion();
			}
		}];
	</script>
		</div>
		<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #e0e8f5">
			<a id="close" href="#" onclick="back();" class="easyui-linkbutton " data-options="iconCls:'fa-arrow-left'">返回</a>  
		</div>
	</div>
</body>
</html>