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
		Map<String,Object> typeMap = new HashMap<String,Object>();
		for(String t: type){
			Map<String,Integer> fthemeMap = new HashMap<>();
			for(String f:ftheme){
				fthemeMap.put(f, 0);
			}
			typeMap.put(t, fthemeMap);
		}
		for(Case c:cases){
			Map<String,Integer> fthemeMap = (Map<String, Integer>) typeMap.get(c.getCaseType());
			int count = fthemeMap.get("问诊") + c.getInquiryCount();
			fthemeMap.put("问诊", count);
			count = fthemeMap.get("体格检查") + c.getPhyExamCount();
			fthemeMap.put("体格检查", count);
			count = fthemeMap.get("初步诊断") + c.getFstVisitCount();
			fthemeMap.put("初步诊断", count);
			count = fthemeMap.get("辅助检查") + c.getAryExamCount();
			fthemeMap.put("辅助检查", count);
			count = fthemeMap.get("确诊") + c.getDiagnoseCount();
			fthemeMap.put("确诊", count);
			count = fthemeMap.get("治疗方案") + c.getTreatmentCount();
			fthemeMap.put("治疗方案", count);
			count = fthemeMap.get("病人管理") + c.getPatManCount();
			fthemeMap.put("病人管理", count);
			typeMap.put(c.getCaseType(), fthemeMap);
		}
		request.setAttribute("typeCount", typeMap);
		request.setAttribute("cases", cases);
		return "/TestPaperGen/countList";
	}
	
	@RequestMapping(value="/genTestPaper")
	@ResponseBody
	public Map genTestPaer(HttpServletRequest request,HttpServletResponse response,@RequestBody List<QuestionCount> questionCounts){
		Map<String,Object> map = new HashMap<String,Object>();
		System.out.println(questionCounts);
		
		map.put("status", true);
		map.put("url", "/TestPaperGen/showTestPaperInfo.action");
		return map;
	}
	
}
