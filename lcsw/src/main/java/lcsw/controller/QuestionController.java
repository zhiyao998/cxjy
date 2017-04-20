package lcsw.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import lcsw.domain.Answer;
import lcsw.domain.Case;
import lcsw.domain.Question;
import lcsw.service.CaseService;

@Controller
@RequestMapping(value="/question")
public class QuestionController {
	@Autowired
	private CaseService caseService;
	
	@RequestMapping(value="/toAddQuestion")
	public String toAddQuestion(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/case/addQuestion";
	}
	
	@RequestMapping(value="/addQuestion")
	@ResponseBody
	public Map addQuestion(HttpServletRequest request,HttpServletResponse response,@RequestBody Question question){
		Map map = new HashMap<String,Object>();
		System.out.println(question);
/*		System.out.println(answers);*/
		map.put("status", true);
		return map;
	}
	
	@RequestMapping(value="/addCaseInfo")
	@ResponseBody
	public Map addCaseInfo(HttpServletRequest request,HttpServletResponse response,Case newCase){
		Map map = new HashMap<String,Object>();
		if(newCase.getCaseId() == null){
			caseService.insert(newCase);
			Integer caseId = newCase.getCaseId();
		}else{
			caseService.updateByPrimaryKey(newCase);
			Integer caseId = newCase.getCaseId();
		}
		map.put("Newcase", newCase);
		map.put("status", true);
		return map;
	}
	
}
