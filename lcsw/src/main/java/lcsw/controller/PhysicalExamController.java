package lcsw.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lcsw.domain.CaseQuery;
import lcsw.domain.PhysicalExam;
import lcsw.service.PhysicalExamService;

@Controller()
@RequestMapping(value="/physicalExam")
public class PhysicalExamController {
	
	@Resource
	private PhysicalExamService physicalExamService;
	
	@RequestMapping(value="/toAddPhysicalExam")
	public String toAddPhysicalExam(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/physicalexam/toAddPhysicalExam";
	}
	
	@RequestMapping("/selectByType")
	@ResponseBody
	public Map<String,Object> selectByType(HttpServletRequest request){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		Integer tpye = Integer.valueOf(request.getParameter("physicalExamType"));
		List<PhysicalExam> list = new ArrayList<PhysicalExam>();
		Map<String,Object> map = new HashMap<String,Object>();
		list = physicalExamService.selectByType(tpye);
		System.out.println(caseQuery.getPhysicalExams());
		if(caseQuery.getPhysicalExams().isEmpty()){
			map.put("list", list);
		}else{
			List<PhysicalExam> exams = caseQuery.getPhysicalExams();
			for(int i = 0; i < list.size(); i++){
				for(PhysicalExam i1:exams){
					if(list.get(i).getPhysicalExamOrder().equals(i1.getPhysicalExamOrder()))
						list.set(i, i1);
				}
			}
			map.put("list", list);
		}
		
		
		map.put("status", true);
		map.put("msg", list.size());
		return map;
	}
	
	@RequestMapping(value="/next")
	@ResponseBody
	public CaseQuery insertInquiry(HttpServletRequest request,@RequestBody List<PhysicalExam> physicalExams){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		caseQuery.setPhysicalExams(physicalExams);
		System.out.println(physicalExams);
		request.getSession().setAttribute("CaseQuery",caseQuery);
		return caseQuery;
	}
}
