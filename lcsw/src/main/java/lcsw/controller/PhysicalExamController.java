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
import lcsw.domain.Inquiry;
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
		Integer caseId = null;
		String tpye = request.getParameter("physicalExamType");
		List<PhysicalExam> newList = new ArrayList<PhysicalExam>();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PhysicalExam> list = physicalExamService.selectByType(tpye);
		System.out.println(caseQuery.getPhysicalExams());
		if(caseQuery.getPhysicalExams().isEmpty() && caseQuery.getNewCase().getCaseId() == null){
			map.put("list", list);
		}else{
			if(caseQuery.getPhysicalExams().isEmpty() && caseQuery.getNewCase().getCaseId() != null){
				caseId = Integer.valueOf(caseQuery.getNewCase().getCaseId());
				caseQuery.setPhysicalExams(physicalExamService.selectByCaseId(caseId));
			}
			List<PhysicalExam> physicalExams = caseQuery.getPhysicalExams();
			for(PhysicalExam p:physicalExams){
				if(p.getPhysicalExamType().equals(tpye))
					newList.add(p);
			}
			for(int i = 0; i < list.size(); i++){
				boolean flag = true;
				for(PhysicalExam p1:physicalExams){
					if(list.get(i).getPhysicalExamType().equals(p1.getPhysicalExamType()) && list.get(i).getPhysicalExamOrder().equals(p1.getPhysicalExamOrder())){
						flag = false;
						break;
					}
				}
				if(flag){
					newList.add(list.get(i));
				}
			}
			map.put("list", newList);
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
		String caseStep[] = caseQuery.getNewCase().getCaseStep().split(",");
		for(int i =0 ; i<caseStep.length;i++){
			if(caseStep[i].equals("2")&& i+1 < caseStep.length){
				caseQuery.setNextStep(caseStep[i+1]);
			}
		}
		request.getSession().setAttribute("CaseQuery",caseQuery);
		return caseQuery;
	}
}
