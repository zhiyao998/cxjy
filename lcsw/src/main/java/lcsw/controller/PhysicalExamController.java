package lcsw.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lcsw.service.PhysicalExamService;

@Controller("/physicalExam")
public class PhysicalExamController {
	
	@Resource
	private PhysicalExamService physicalExamService;
	
	@RequestMapping(value="/toAddPhysicalExam")
	public String toAddPhysicalExam(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/physicalexam/toAddPhysicalExam";
	}
}
