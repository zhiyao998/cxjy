<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加病例</title>
<%@ include file="../../common.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#chiefComplain').ckeditor();
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
						$("#titleType").combobox("select",newCase.titleType);
						$("#chiefComplain").val(newCase.chiefComplain);
						$("#answerList").datagrid({url:"/lcsw/question/list.action?caseId=" + caseId});
						$("#answerList").datagrid("load");
						$("#caseType").combobox("disable");
						$("#chiefComplain").attr("disabled",true);
						$("#titleType").combobox("disable");
						$("#editInfo").linkbutton("enable");
						$("#addInfo").linkbutton("disable");
					}
				}
			});
		}
	});
	function addQuestion() {
		var rows = $('#answerList').datagrid('getRows');
		var caseId = $("#caseId").val();
		$.ajax({
		    'type': 'POST',
		    'url': "/lcsw/case/getCase.action?caseId=" + caseId,
		    'dataType': 'json',
		    'success': function(data) {
				if (data.status) {
					if(data.newCase.titleType == "A2" && rows.length > 0){
						alert("A2题型只允许一个分支！");
					}else{
						open("/lcsw/question/toAddQuestion.action?caseId=" + $("#caseId").val());
					}
				}
			}
		});
	};
	function editQuestion(id) {
		open("/lcsw/question/toEditQuestion.action?questionId=" + id);
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
									$("#caseType").combobox("disable");
									$("#chiefComplain").attr("disabled",true);
									$("#titleType").combobox("disable");
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
			$("#chiefComplain").attr("disabled",false);
			$("#editInfo").linkbutton("disable");
			$("#caseType").combobox("enable");
			$("#titleType").combobox("enable");
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
		<div data-options="region:'west',border:true" style="width:35%;height: 100%">
			<form action="/lcsw/question/addCaseInfo.action" method="post" id="inputForm">
				<input type="hidden" id="caseId" name="caseId" value="${requestScope.caseId }">
				<input id="creater" type="hidden" name="creater" value="rongyu">
				<table id="caseInfo" style="text-align: center;">
					<tr>
						<td colspan="2">
							<h3>主诉</h3>
							<textarea class="easyui-validatebox" name="chiefComplain" id="chiefComplain" rows="5" cols="80" style="height: 200px;">
            				</textarea>
						</td>
					</tr>
					<tr>
						<td>
							<label for="caseType">病例类型：</label>
						</td>
						<td>
							<select id="caseType" name="caseType" class="easyui-combobox" data-options="required:true" style="width:150px;">
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
						<td>
							<label for="titleType">题目类型：</label>
						</td>
						<td>
							<select id="titleType" name="titleType" class="easyui-combobox" data-options="required:true" style="width:150px;">
								<option value="A2">A2</option>   
    							<option value="A3">A3</option>    
							</select>  
						</td>
					</tr>
					<tr>
						<td><a id="editInfo" href="#" onclick="editCaseInfo()" class="easyui-linkbutton" data-options="iconCls:'fa-pencil',disabled:true">编辑</a> </td>
						<td><a id="addInfo" href="#" onclick="addCaseInfo()" class="easyui-linkbutton" data-options="iconCls:'fa-check-circle'">提交</a> </td>
					</tr>
				</table>
			</form>
		</div>
		<div id="center" data-options="region:'center',border:false" style="padding: 10px;height: 100%">
			<table id="answerList" class="easyui-datagrid" data-options="fitColumns:true,rownumbers:true,toolbar:toolbar,pagination:true,fit:true,remoteSort:true" style="width:100%;">
				<thead>
					<tr> 
    					<th data-options="field:'title'" style="width:22%;">题目简介</th>   
            			<th data-options="field:'ftheme',sortable:true"  style="width:22%;">一级主题词</th>
            			<th data-options="field:'stheme',sortable:true" style="width: 22%;">二级主题词</th>   
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