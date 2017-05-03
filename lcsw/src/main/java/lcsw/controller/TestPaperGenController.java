package lcsw.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lcsw.domain.Case;
import lcsw.domain.Question;
import lcsw.domain.QuestionCount;
import lcsw.domain.QuestionType;
import lcsw.service.CaseService;
import lcsw.service.QuestionService;


@Controller
@RequestMapping(value="/TestPaperGen")  
public class TestPaperGenController {
	
	@Resource
	private QuestionService qService;
	@Resource
	private CaseService caseService;
	
	@RequestMapping(value="/findAllCase")
	public String findAllCase(HttpServletRequest request,HttpServletResponse response){
		List<Case> cases = caseService.selectAll();
		String type[] = {"普通科","口腔科","内科","外科","胸外科","皮肤科"};
		String ftheme[] = {"问诊","体格检查","初步诊断","辅助检查","确诊","治疗方案","病人管理"};
		for(Case c:cases){
			
		}
		request.setAttribute("cases", cases);
		return "/TestPaperGen/countList";
	}
	
	@RequestMapping(value="/getCount")
	@ResponseBody
	public Map getCount(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> map = new HashMap<String,Object>();
		List<QuestionType> list = qService.selectCountByThemeAndType();	
		map.put("rows", list);
		return map;
	}
	
	@RequestMapping(value="/genTestPaer")
	@ResponseBody
	public Map genTestPaer(HttpServletRequest request,HttpServletResponse response,@RequestBody List<QuestionCount> list){
		Map<String,Object> map = new HashMap<String,Object>();
		System.out.println(list);
		return map;
	}
	
}
