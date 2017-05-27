package lcsw.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lcsw.domain.Answer;
import lcsw.domain.AverageCount;
import lcsw.domain.Case;
import lcsw.domain.Paper;
import lcsw.domain.Question;
import lcsw.domain.QuestionCount;
import lcsw.service.AnswerService;
import lcsw.service.CaseService;
import lcsw.service.PaperService;
import lcsw.service.QuestionService;


@Controller
@RequestMapping(value="/TestPaperGen")  
public class TestPaperGenController {
	
	@Resource
	private QuestionService qService;
	@Resource
	private CaseService caseService;
	@Resource
	private PaperService paperService;
	@Autowired
	private AnswerService answerService;
	
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
	public String genTestPaer(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="ids") String ids){
		Map<String,Object> map = new HashMap<String,Object>();
		System.out.println(ids);
		request.getSession().setAttribute("ids", ids);
		return "/TestPaperGen/showTestPaperInfo";
	}
	
	@RequestMapping(value="/showTestPaperInfo")
	@ResponseBody
	public String showTestPaperInfo(HttpServletRequest request,HttpServletResponse response){
		
		return "/TestPaperGen/showTestPaperInfo";
	}
	
	@RequestMapping(value="getCaseList")
	@ResponseBody
	public Map getCaseList(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> map = new HashMap<String,Object>();
		String ids = (String) request.getSession().getAttribute("ids");
		String id[] = ids.split(",");
		List<Integer> idsList = new ArrayList<Integer>();
		List<Case> caseList = new ArrayList<Case>();
 		for(String s: id){
			idsList.add(Integer.parseInt(s));
		}
 		caseList = caseService.selectCaseByIds(idsList);
		map.put("total", caseList.size());
		map.put("rows", caseList);
		return map;
	}
	
	@RequestMapping(value="findQuestionById")
	@ResponseBody
	public Map findQuestionById(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> map = new HashMap<String,Object>();
		String s[] = request.getParameter("answers").split(",");
		List<Answer> answers = new ArrayList<Answer>();
		for(int i = 0; i < s.length; i++){
			Answer a = answerService.selectByPrimaryKey(Integer.valueOf(s[i]));
			answers.add(a);
		}
		map.put("answers", answers);
		map.put("status", true);
		return map;
	}
}
