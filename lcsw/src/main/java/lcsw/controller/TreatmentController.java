package lcsw.controller;

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

import lcsw.domain.CaseQuery;
import lcsw.domain.Treatment;
import lcsw.service.TreatmentService;

@Controller
@RequestMapping(value="treatment")
public class TreatmentController {
	
	@Resource
	private TreatmentService treatmentService;
	
	@RequestMapping(value="/toAddTreatment")
	public String toAddTreatment(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/treatment/toAddTreatment";
	}
	
	@RequestMapping(value="/next")
	@ResponseBody
	public CaseQuery next(HttpServletRequest request,@RequestBody List<Treatment> treatments){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		caseQuery.setTreatments(treatments);
		System.out.println(treatments);
		String caseStep[] = caseQuery.getNewCase().getCaseStep().split(",");
		for(int i =0 ; i<caseStep.length;i++){
			if(caseStep[i].equals("6")&& i+1 < caseStep.length){
				caseQuery.setNextStep(caseStep[i+1]);
			}
		}
		request.getSession().setAttribute("CaseQuery",caseQuery);
		return caseQuery;
	}
	
	@RequestMapping("/getlastTreatment")
	@ResponseBody
	public Map<String,Object> getlastTreatment(HttpServletRequest request,HttpServletResponse response){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		Integer caseId = null;
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(caseQuery != null){
			if(caseQuery.getTreatments().isEmpty() && caseQuery.getNewCase().getCaseId() != null){
				caseId = Integer.valueOf(caseQuery.getNewCase().getCaseId());
				map.put("status", true);
				List<Treatment> t = treatmentService.selectByCaseId(caseId);
				caseQuery.setTreatments(t);
				map.put("treatment", caseQuery.getTreatments());
			}else{
				map.put("status", true);
				map.put("treatment", caseQuery.getTreatments());
			}
		}else{
			map.put("status", false);
		}
		return map;
	}
}
