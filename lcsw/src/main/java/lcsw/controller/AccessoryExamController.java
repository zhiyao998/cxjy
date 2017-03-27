package lcsw.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lcsw.service.AccessoryExamService;

@Controller
@RequestMapping(value="/AccessoryExam")
public class AccessoryExamController {
	
	@Resource
	private AccessoryExamService accessoryExamService;
	
	@RequestMapping(value="/toAddAccessoryExam")
	public String toAddAccessoryExam(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/physicalexam/toAddPhysicalExam";
	}
	
}
