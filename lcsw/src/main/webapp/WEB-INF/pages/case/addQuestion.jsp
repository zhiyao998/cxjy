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
		if(type != "1"){
			html = "<tr><td><input class='easyui-textbox'></td><td><input class='easyui-textbox'></td><td><input class='easyui-numberspinner' style='width:50px;' required='required' data-options='min:-10,max:10,editable:true'></td><td><a href='#' onclick='removeAnswer(this)' class='easyui-linkbutton' data-options=\"iconCls:'fa-window-close'\"></a> </td></tr>";
		}else{
			html = "<tr><td><input class='easyui-textbox'></td><td><input class='easyui-filebox'></td><td><input class='easyui-numberspinner' style='width:50px;' required='required' data-options='min:-10,max:10,editable:true'></td><td><a href='#' onclick='removeAnswer(this)' class='easyui-linkbutton' data-options=\"iconCls:'fa-window-close'\"></a> </td></tr>";
		}
		$("#answers").append(html);
		$.parser.parse("#answers");
	};
	function removeAnswer(r) {
		var tr = $(r).parent().parent();
		$(tr).remove();
	};
	function submitQuestion() {
		parent.$("#questions").append("<tr><td>"+ $("#question").textbox("getValue") +"</td><td>"+ $("#first_theme").combobox("getText") +"</td></tr>");
		$.parser.parse("#questions");
		parent.$('#${windowid}').window('close');
	}
	$(function() {
		$("#type").hide();
		$('#first_theme').combobox({
			onSelect: function(){
				var value = $('#first_theme').combobox("getValue");
				if(value == "4"){
					$("#type").show();
				}else{
					$("#type").hide();
				}				
			}
		});
		$('#accessoryexamType').combobox({
			onSelect: function(){
				var type = $('#accessoryexamType').combobox("getValue");
				if(type == "1"){
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
		<form action="/lcsw/case/next.action" method="post" id="inputForm">
			<table>
				<tr>
					<td>
						<label for="first_theme">一级主题词：</label>
					</td>
					<td>
						<select id="first_theme" name="first_theme" class="easyui-combobox" data-options="required:true" style="width: 100px;">
							<option value="0"></option>
							<option value="1">问诊</option>   
    						<option value="2">体格检查</option>   
    						<option value="3">初步诊断</option>   
    						<option value="4">辅助检查</option>   
    						<option value="5">确诊</option>   
    						<option value="6">治疗方案</option>
    						<option value="7">病人管理</option>   
						</select> 
					</td>
					<td>
						<label for="second_theme">二级主题词：</label>
					</td>
					<td>
						<select id="second_theme" name="first_theme" class="easyui-combobox" data-options="required:true" style="width:100px;">
							
						</select>
					</td>
				</tr>
				<tr id="type">
					<td>
						<label for="accessoryexamType">辅助检查类型：</label>
					</td>
					<td>
						<select id="accessoryexamType" name="accessoryexamType" class="easyui-combobox" data-options="required:true" style="width:100px;">
							<option value="0"></option>
							<option value="1">影像检查</option>   
    						<option value="2">实验室检查</option> 
						</select>
					</td>
				</tr>
				<tr style="height: 30%;width: 50%">
					<td>
						<label for="question">题目：</label>
					</td>
					<td>
						<textarea rows="5" cols="30" class="easyui-textbox" id="question" name="question" data-options="required:true,multiline:true" style="height: 80px;width: 240px"></textarea>
					</td>
				</tr>
			</table>
		</form>
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
						<td><input class='easyui-textbox'></td>
						<td><input class='easyui-textbox'></td>
						<td><input class="easyui-numberspinner" style="width:50px;" required="required" data-options="min:-10,max:10,editable:true"></td>
						<td><a id="close" href="#" onclick="removeAnswer(this)" class="easyui-linkbutton" data-options="iconCls:'fa-window-close'"></a> </td>
					</tr>
				</tbody>
			</table>
		<a href="#" onclick="addNewAnswer()" class="easyui-linkbutton" data-options="iconCls:'fa-plus-square'">增加答案</a>  
	</div>	
	<div data-options="region:'south',border:false" style="text-align: right; margin-bottom:0px; padding: 5px; background-color: #D3D3D3">
		<a id="submit" href="#" onclick="submitQuestion()" class="easyui-linkbutton" data-options="iconCls:'fa-arrow-circle-right'">提交</a>  
		<a id="close" href="#" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'fa-window-close'">关闭</a>  
	</div>
	
	</div>
</body>
</html>