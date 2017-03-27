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
		request.getSession().setAttribute("CaseQuery",caseQuery);
		return caseQuery;
	}
	
	@RequestMapping("/getlastTreatment")
	@ResponseBody
	public Map getlastTreatment(HttpServletRequest request,HttpServletResponse response){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		HashMap map = new HashMap<String,Object>();
		if(caseQuery != null){
			if(caseQuery.getDiagnose() == null){
				map.put("status", false);
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
