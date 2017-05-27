<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生成试卷详情</title>
<%@ include file="../../common.jsp"%>

<style type="text/css">
	#showText{
		margin: 20px;
	}
	#questionInfo tr th,#questionInfo tr td{
		border: 1px solid #196AC5;
		border-collapse: collapse;
		padding: 10px;
		text-align: center;
	}
</style>

<script type="text/javascript">

$(function() {
	
	$("#caseInfo").hide();
	$("#questionInfo").hide();
	init();

	$("#caseList").datagrid({
		onClickRow: function(index, row) {
			var num = $("#questionList").datagrid("getData").total;
			$("#questionList").datagrid({url:"/lcsw/question/list.action?caseId=" + row.caseId});		
			init();
			showCaseInfo(row);
		}
	});
	$("#questionList").datagrid({
		onClickRow: function (index, row) {
			$("#answers").empty();
			showQuestionInfo(row);
			$.ajax({
			    'type': 'POST',
			    'url': "/lcsw/TestPaperGen/findQuestionById.action?answers=" + row.answers,
			    'dataType': 'json', 
			    'success': function(data) {
					if (data.status) {
						var answers = data.answers;
						for(var i = 0; i < answers.length; i++){
							html = "<tr><td width='20%'><p id='info"+ i +"'></p></td>" + 
									"<td width='35%'><div id='result"+ i +"' style='width: 100%'></div>" + 
									"<td width='30%'><div id='analysis"+ i +"' style='width: 100%'></div></td>" +
									"<td width='10%'><p id='score" + i +"'></p></td>";
							if(i >= 3){
								html += "<td width='5%'><a href='#' onclick='removeAnswer(this)' class='easyui-linkbutton' data-options=\"iconCls:'fa-window-close'\"></a> </td>";
							}
							html += "<td><input id='id" + i + "' type='hidden'></td></tr>";
							$("#answers").append(html);
						}
						$.parser.parse("#answers");
						for(var i = 0; i < answers.length; i++) {
							$("#info" + i).text(answers[i].info);
							$("#analysis" + i).append(unescape(answers[i].analysis));
							$("#result" + i).append(unescape(answers[i].result));
							$("#score" + i).text(answers[i].score);
							$("#id" + i).val(answers[i].answerId);
						}
					}
				}
			});
		}
	});
});

function init() {
	var editor = CKEDITOR.instances.chiefComplain;//chiefComplain是我ckeditor的id
	if(editor != null){  
		editor.destroy();
	}
	$('#chiefComplain').hide();
	$('#showText').show();
	$('#editInfo').linkbutton("enable");
	$("#caseTitle").textbox("disable");
	$("#addInfo").linkbutton("disable");
	$("#synInfo").linkbutton("disable");
	$("#caseType").combobox("disable");
	$("#titleType").combobox("disable");
}

function editCaseInfo() {
	if($("#addInfo").linkbutton("options").disabled == true){
		$("#addInfo").linkbutton("enable");
		$("#synInfo").linkbutton("enable");
		$("#showText").hide();
		$('#chiefComplain').show();
		$('#chiefComplain').ckeditor();
		$("#editInfo").linkbutton("disable");
		$("#caseType").combobox("enable");
		$("#caseTitle").textbox("enable");
	}
}

function addCaseInfo() {
	var editor = CKEDITOR.instances.chiefComplain;//chiefComplain是我ckeditor的id
	if(editor != null){  
		editor.destroy();
	}
	$('#chiefComplain').hide();
	$('#showText').show();
	$('#editInfo').linkbutton("enable");
	$("#caseTitle").textbox("disable");
	$("#addInfo").linkbutton("disable");
	$("#caseType").combobox("disable");
	$("#titleType").combobox("disable");
}

function editQuestionInfo() {
	
}

function formatCaseOpt(val,row,index) {
	return "<button onclick='deleteCase(" + row.caseId + ")'>删除</button>";
}
function formatQuestionOpt(val,row,index) {
	return "<button onclick='deleteQuestion(" + row.questionId + ")'>删除</button>";
}
function showTitle(val,row,index) {
	return unescape(row.title);
}
function showCaseInfo(caseObj) {
	$("#questionInfo").hide();
	$("#caseInfo").show();
	$("#caseType").combobox("select",caseObj.caseType);
	$("#titleType").combobox("select",caseObj.titleType);
	$('#chiefComplain').val(caseObj.chiefComplain);
	$("#showText").empty();
	$("#showText").append(caseObj.chiefComplain);
	$("#caseTitle").textbox("setValue",caseObj.caseTitle);
}
function showQuestionInfo(questionObj) {
	$("#caseInfo").hide();
	$("#questionInfo").show();
	$("#ftheme").combobox("select",questionObj.ftheme);
	$("#ftheme").combobox("disable");
	$("#addQuestionInfo").linkbutton("disable");
	$("#synQuestionInfo").linkbutton("disable");
	$("#addNewAnswer").linkbutton("disable");
	$("#title").empty();
	$("#title").append(unescape(questionObj.title));
	$("#caseId").val(questionObj.caseId);
}

</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',border:true" style="width:25%;height: 100%">
			<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'north',border:true" style="width:100%;height: 40%">
					<table id="caseList" class="easyui-datagrid" data-options="url:'/lcsw/TestPaperGen/getCaseList.action',fitColumns:true,toolbar:toolbar,fit:true,singleSelect:true" style="width:100%;">
						<thead>
							<tr>  
    							<th data-options="field:'caseTitle',sortable:true" style="width:30%;">病例名称</th>
    							<th data-options="field:'caseType'" style="width:20%;">病例类型</th>     
            					<th data-options="field:'titleType',sortable:true" style="width:15%;">题目类型</th>
            					<th data-options="field:'totalCount',sortable:true" style="width:15%;">分支数目</th>
            					<th data-options="field:'opt',formatter:formatCaseOpt,align:'center'"  style="width:20%;">操作</th> 
							</tr>
						</thead>
					</table>
			<script type="text/javascript">
				var toolbar = [{
				text:'从病例库添加病例',
				handler:function(){
				alert('从病例库添加病例');
				}
				}];
			</script>
				</div>
				<div id="south" data-options="region:'south',border:false" style="width: 100%;height: 60%;">
					<table id="questionList" class="easyui-datagrid" data-options="fitColumns:true,toolbar:questiontoolbar,pagination:true,fit:true,singleSelect:true" style="width:100%;">
						<thead>
							<tr>  
    							<th data-options="field:'title',formatter:showTitle" style="width:20%;">题目简介</th>   
            					<th data-options="field:'ftheme',sortable:true"  style="width:20%;">一级主题词</th>
            					<th data-options="field:'pscoreCount'"  style="width:10%;">正确选项数目</th>
            					<th data-options="field:'nscoreCount'" style="width:10%;">错误选项数目</th>
            					<th data-options="field:'zscoreCount'"  style="width:10%;">无关选项数目</th>
            					<th data-options="field:'answersTotal'"  style="width:10%;">选项总数目</th>
            					<th data-options="field:'opt',formatter:formatQuestionOpt,align:'center'"  style="width:20%;">操作</th> 
							</tr>
						</thead>
					</table>
				<script type="text/javascript">
						var questiontoolbar = [{
						text:'添加分支',
						handler:function(){
						alert('新增分支');
						}
				}];
				</script>
				</div>
			</div>
		</div>

		<div id="center" data-options="region:'east',border:false" style="height: 100%;width: 75%;">
			<input type="hidden" id="caseId" name="caseId" value="">
			<div id="caseInfo">
				<form action="/lcsw/question/addCaseInfo.action" method="post" id="caseForm" style="background-color: white;">
					<table style="text-align: center;width: 100%;margin: 10px;padding: 10px;">
						<tr style="padding: 20px">
							<td>
								<h2>串题主干编辑</h2>
							</td>
							 <td>
								<a id="editInfo" href="#" onclick="editCaseInfo()" class="easyui-linkbutton" data-options="iconCls:'fa-pencil'">编辑</a> 
								<a id="addInfo" href="#" onclick="addCaseInfo()" class="easyui-linkbutton" data-options="iconCls:'fa-check-circle'">更新</a> 
								<a id="synInfo" href="#" onclick="SynCaseInfo()" class="easyui-linkbutton" data-options="iconCls:'fa-check-circle'">同步到病例库</a> 
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
								<div id="showText" style="min-height: 150px;max-height:300px;"></div>
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
				</form>
			</div>
			<div id="questionInfo" class="easyui-layout" data-options="fit:true">
					<div data-options="region:'north',border:true" style="width:100%;height: 30%">
						<input type="hidden" id="questionId" name="questionId" value="">
						<table style="text-align: center;width: 100%;height: 100%;">
							<tr height="20%">
								<td colspan="2">
									<h2>分支详情</h2>
									<a id="editQuestionInfo" href="#" onclick="editQuestionInfo()" class="easyui-linkbutton" data-options="iconCls:'fa-pencil'">编辑</a> 
									<a id="addQuestionInfo" href="#" onclick="addQuestionInfo()" class="easyui-linkbutton" data-options="iconCls:'fa-check-circle'">更新</a> 
									<a id="synQuestionInfo" href="#" onclick="SynQuestionInfo()" class="easyui-linkbutton" data-options="iconCls:'fa-check-circle'">同步到病例库</a> 
									<a id="addNewAnswer" href="#" onclick="addNewAnswer()" class="easyui-linkbutton" data-options="iconCls:'fa-plus-square'">增加选项</a>  
								</td>
							</tr>
							<tr height="80%">
								<td width="20%">
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
								<td width="80%">
									<h3 for="title">分支题目</h3>
									<div id="title" name="title"></div>
								</td>
							</tr>
						</table>
					</div>
					<div id="south" data-options="region:'south',border:false" style="width: 100%;height: 70%;">
						<table style="width: 100%;" border="1" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th>选项</th>
									<th>结果</th>
									<th>分析</th>
									<th>分值</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="answers">
							
							</tbody>
						</table>
					</div>
			</div>
		</div>
		<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; background-color: #e0e8f5">
			<a id="close" href="#" onclick="backToPaperGen();" class="easyui-linkbutton " data-options="iconCls:'fa-arrow-left'">返回</a>  
		</div>
	</div>
</body>
</html>