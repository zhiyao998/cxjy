<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加病例</title>
<%@ include file="../../common.jsp"%>
<style type="text/css">
	#questionInfo{
		font-size: 14px;
		color: 	black;
		line-height: 2;
	}
	
	h2{
		color: red;
	}
	
	#caseInfo{
		color: black;
	}
	
	#caseInfo td{
		margin: 20px;
	}
	
	#showText{
		text-align: center;
		line-height: 2;
	}
		
</style>
<script type="text/javascript">
	$(function() {
		var caseId = $("#caseId").val();
		if(caseId == null || caseId == ""){
			$("#center").hide();
			$("#showText").hide();
			$('#chiefComplain').ckeditor();
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
						$("#caseTitle").textbox("setValue",newCase.caseTitle);
						$("#chiefComplain").hide();
						$("#showText").append(newCase.chiefComplain);
						$("#answerList").datagrid({url:"/lcsw/question/list.action?caseId=" + caseId});
						$("#answerList").datagrid("load");
						$("#caseType").combobox("disable");
						$("#titleType").combobox("disable");
						$("#editInfo").linkbutton("enable");
						$("#addInfo").linkbutton("disable");
						$("#caseTitle").textbox("disable");
			    		$("#inquiryCount").text(newCase.inquiryCount);
			    		$("#phyExamCount").text(newCase.phyExamCount);
			    		$("#fstVisitCount").text(newCase.fstVisitCount);
			    		$("#aryExamCount").text(newCase.aryExamCount);
			    		$("#diagnoseCount").text(newCase.diagnoseCount);
			    		$("#treatmentCount").text(newCase.treatmentCount);
			    		$("#patManCount").text(newCase.patManCount);
			    		$("#totalCount").text(newCase.totalCount);
			    		$("#panswerTotal").text(newCase.panswerTotal);
			    		$("#nanswerTotal").text(newCase.nanswerTotal);
			    		$("#zanswerTotal").text(newCase.zanswerTotal);
			    		$("#answerTotal").text(newCase.answerTotal);
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
	 						var newCase = data.newCase;
				    		$("#inquiryCount").text(newCase.inquiryCount);
				    		$("#phyExamCount").text(newCase.phyExamCount);
				    		$("#fstVisitCount").text(newCase.fstVisitCount);
				    		$("#aryExamCount").text(newCase.aryExamCount);
				    		$("#diagnoseCount").text(newCase.diagnoseCount);
				    		$("#treatmentCount").text(newCase.treatmentCount);
				    		$("#patManCount").text(newCase.patManCount);
				    		$("#totalCount").text(newCase.totalCount);
				    		$("#panswerTotal").text(newCase.panswerTotal);
				    		$("#nanswerTotal").text(newCase.nanswerTotal);
				    		$("#zanswerTotal").text(newCase.zanswerTotal);
				    		$("#answerTotal").text(newCase.answerTotal);
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
								var newCase = data.Newcase;
								if($("#center").is(":hidden")){
									$("#center").show();
								}
								if($("#editInfo").linkbutton("options").disabled == true){
									if(data.Newcase.caseId != null){
										$("#caseId").val(data.Newcase.caseId);
										$("#answerList").datagrid({url:"/lcsw/question/list.action?caseId=" + $("#caseId").val()});
									}
									$("#caseType").combobox("disable");
									var editor = CKEDITOR.instances.chiefComplain;//chiefComplain是我ckeditor的id
									editor.destroy();
									$("#chiefComplain").hide();
									$("#showText").empty();
									$("#showText").append(newCase.chiefComplain);
									$("#showText").show();
									$("#titleType").combobox("disable");
									$("#editInfo").linkbutton("enable");
									$("#addInfo").linkbutton("disable");
									$("#caseTitle").textbox("disable");
								}
					    		$("#inquiryCount").text(newCase.inquiryCount);
					    		$("#phyExamCount").text(newCase.phyExamCount);
					    		$("#fstVisitCount").text(newCase.fstVisitCount);
					    		$("#aryExamCount").text(newCase.aryExamCount);
					    		$("#diagnoseCount").text(newCase.diagnoseCount);
					    		$("#treatmentCount").text(newCase.treatmentCount);
					    		$("#patManCount").text(newCase.patManCount);
					    		$("#totalCount").text(newCase.totalCount);
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
			$("#showText").hide();
			$('#chiefComplain').ckeditor();
			$("#editInfo").linkbutton("disable");
			$("#caseType").combobox("enable");
			$("#caseTitle").textbox("enable");
		}
	}
	function formatOpt(val,row,index) {
		return "<button onclick='editQuestion(" + row.questionId + ")'>编辑</button> <button onclick='deleteQuestion(" + row.questionId + ")'>删除</button>";
	}
	function showTitle(val,row,index) {
		return unescape(row.title);
	}

</script>

<style type="text/css">
	
</style>

</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',border:true" style="width:40%;height: 100%;background-color: #C4D8ED;padding: 10px">
			<form action="/lcsw/question/addCaseInfo.action" method="post" id="inputForm" style="background-color: white;">
				<input type="hidden" id="caseId" name="caseId" value="${requestScope.caseId }">
				<input id="creater" type="hidden" name="creater" value="rongyu">
				<div  id="caseInfo">
				<table style="text-align: center;width: 100%;margin: 10px;padding: 10px;">
					<tr style="padding: 20px">
						<td>
							<h2>串题主干编辑</h2>
						</td>
						 <td>
							<a id="editInfo" href="#" onclick="editCaseInfo()" class="easyui-linkbutton" data-options="iconCls:'fa-pencil',disabled:true">编辑</a> 
							<a id="addInfo" href="#" onclick="addCaseInfo()" class="easyui-linkbutton" data-options="iconCls:'fa-check-circle'">提交</a> 
						</td>
					</tr>
					<tr>
						<td>
							<label for="caseTitle">病例名称：</label>
							<input class="easyui-textbox" data-options="required:true" name="caseTitle" id="caseTitle" style="width:150px;">
						</td>
					</tr>
					<tr>
						<td colspan="2" style="padding: 10px;">
							<textarea class="easyui-validatebox" name="chiefComplain" id="chiefComplain" style="height: 150px;"></textarea>
							<div id="showText" style="height: 150px;border: 2px solid red;"></div>
						</td>
					</tr>
					<tr>
						<td>
							<label for="caseType">病例类型：</label>
							<select id="caseType" name="caseType" class="easyui-combobox" data-options="required:true" style="width:150px;">
								<option value="普通科">普通科</option>   
    							<option value="口腔科">口腔科</option>   
    							<option value="内科">内科</option>   
    							<option value="外科">外科</option>   
    							<option value="胸外科">胸外科</option>   
    							<option value="皮肤科">皮肤科</option>   
							</select>  
						</td>
						<td>
							<label for="titleType">题目类型：</label>
							<select id="titleType" name="titleType" class="easyui-combobox" data-options="required:true" style="width:150px;">
								<option value="A2">A2</option>   
    							<option value="A3">A3</option>    
							</select>  
						</td>
					</tr>
				</table>
				</div>
				<div id="questionInfo">
					<h2>串题信息</h2>
					<table style="border: 2px solid red;width: 100%">
						<tr>
							<td colspan="4">
								<h3>各分支数目：</h3>
							</td>
						</tr>
						<tr>
							<td width="25%">
								问诊:<p id="inquiryCount" name="inquiryCount" style="display: inline;"></p>题
							</td>
							<td  width="25%">
								体格检查:<p id="phyExamCount" name="phyExamCount" style="display: inline;"></p>题
							</td>
							<td width="25%">
								初步诊断:<p id="fstVisitCount" name="fstVisitCount" style="display: inline;"></p>题
							</td>
							<td width="25%">
								辅助检查:<p id="aryExamCount" name="aryExamCount" style="display: inline;"></p>题
							</td>
						</tr>
						<tr>
							<td>
								确诊:<p id="diagnoseCount" name="diagnoseCount" style="display: inline;"></p>题
							</td>
							<td>
								治疗方案:<p id="treatmentCount" name="treatmentCount" style="display: inline;"></p>题
							</td>
							<td>
								病人管理:<p id="patManCount" name="patManCount" style="display: inline;"></p>题
							</td>
							<td>
								总计:<p id="totalCount" name="totalCount" style="display: inline;"></p>题
							</td>
						</tr>
						<tr>
							<td><h3>分支选项信息</h3></td>
						</tr>
						<tr>
							<td>正确选项总数:<p id="panswerTotal" name="panswerTotal" style="display: inline;"></p>个</td>
							<td>错误选项总数:<p id="nanswerTotal" name="nanswerTotal" style="display: inline;"></p>个</td>
							<td>无关选项总数:<p id="zanswerTotal" name="zanswerTotal" style="display: inline;"></p>个</td>
							<td>选项总数:<p id="answerTotal" name="answerTotal" style="display: inline;"></p>个</td>
						</tr>
					</table>
				</div>
			</form>

		</div>
		<div id="center" data-options="region:'center',border:false">
		<div class="easyui-layout" data-options="fit:true">
			<div id="center" data-options="region:'center',border:false">
			<table id="answerList" class="easyui-datagrid" data-options="fitColumns:true,rownumbers:true,toolbar:toolbar,pagination:true,fit:true,remoteSort:true" style="width:100%;">
				<thead>
					<tr> 
    					<th data-options="field:'title',formatter:showTitle" style="width:13%;">题目简介</th>   
            			<th data-options="field:'ftheme',sortable:true"  style="width:13%;">一级主题词</th>
            			<th data-options="field:'pscoreCount'"  style="width:10%;">正确选项数目</th>
            			<th data-options="field:'pscoreTotal'"  style="width:10%;">正确选项总分</th>
            			<th data-options="field:'nscoreCount'" style="width:10%;">错误选项数目</th>
            			<th data-options="field:'nscoreTotal'"  style="width:10%;">错误选项总分</th>
            			<th data-options="field:'zscoreCount'"  style="width:10%;">无关选项数目</th>
            			<th data-options="field:'answersTotal'"  style="width:10%;">选项总数目</th>
            			<th data-options="field:'opt',formatter:formatOpt,align:'center'"  style="width:13%;">操作</th> 
					</tr>
				</thead>
				<tbody  id="questions">
						
				</tbody>
			</table>
		</div>
	<script type="text/javascript">
		var toolbar = [{
			text:'新增分支',
			iconCls:'fa-plus-square',
			handler:function(){
				addQuestion();
			}
		}];
	</script>
		<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; background-color: #e0e8f5">
			<a id="close" href="#" onclick="back();" class="easyui-linkbutton " data-options="iconCls:'fa-arrow-left'">返回</a>  
		</div>
	</div>
	</div>
	</div>
</body>
</html>