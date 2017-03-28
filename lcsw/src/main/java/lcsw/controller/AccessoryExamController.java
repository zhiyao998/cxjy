package lcsw.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lcsw.domain.AccessoryExam;
import lcsw.domain.CaseQuery;
import lcsw.service.AccessoryExamService;

@Controller
@RequestMapping(value="/AccessoryExam")
public class AccessoryExamController {
	
	@Resource
	private AccessoryExamService accessoryExamService;
	
	@RequestMapping(value="/toAddAccessoryExam")
	public String toAddAccessoryExam(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/accessoryexam/toAddAccessoryExam";
	}
	
	@RequestMapping(value="/selectByResultType")
	@ResponseBody
	public List<AccessoryExam> selectByResultType(HttpServletRequest request){
		Integer resultType = Integer.valueOf(request.getParameter("resultType")) ;
		List<AccessoryExam> list = accessoryExamService.selectByResultType(resultType);
		return list;
	}
	
	@RequestMapping(value="/selectByAccessoryExamType")
	@ResponseBody
	public List<AccessoryExam> selectByAccessoryExamType(HttpServletRequest request){
		Integer accessoryExamType = Integer.valueOf(request.getParameter("accessoryExamType")) ;
		List<AccessoryExam> list = accessoryExamService.selectByAccessoryExamType(accessoryExamType);
		return list;
	}
	
	@RequestMapping(value="/next")
	@ResponseBody
	public CaseQuery next(HttpServletRequest request,@RequestBody List<AccessoryExam> accessoryExams){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		caseQuery.setAccessoryExams(accessoryExams);
		request.getSession().setAttribute("CaseQuery",caseQuery);
		return caseQuery;
	}
}
