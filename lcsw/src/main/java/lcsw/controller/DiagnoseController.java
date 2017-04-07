package lcsw.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lcsw.domain.CaseQuery;
import lcsw.domain.Diagnose;
import lcsw.service.DiagnoseService;

@Controller
@RequestMapping(value="diagnose")
public class DiagnoseController {
	
	@Resource
	private DiagnoseService diagnoseService;
	
	@RequestMapping(value="/toAddDiagnose")
	public String toAddDiagnose(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/diagnose/toAddDiagnose";
	}
	
	@RequestMapping("/next")
	@ResponseBody
	public CaseQuery insertCase(HttpServletRequest request,Diagnose diagnose){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		System.out.println(diagnose);
//		int flag = caseService.insert(c);
		caseQuery.setStatus(true);
		caseQuery.setDiagnose(diagnose);
		request.getSession().setAttribute("CaseQuery", caseQuery);
		return caseQuery;	
	}
	
	@RequestMapping("/getlastDiagnose")
	@ResponseBody
	public Map<String,Object> getlastDiagnose(HttpServletRequest request){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		Integer caseId = null;
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(caseQuery != null){
			if(caseQuery.getDiagnose() == null && caseQuery.getNewCase().getCaseId() != null){
				caseId = Integer.valueOf(caseQuery.getNewCase().getCaseId());
				map.put("status", true);
				Diagnose d = diagnoseService.selectByCaseId(caseId);
				caseQuery.setDiagnose(d);
				map.put("diagnose", caseQuery.getDiagnose());
			}else{
				map.put("status", true);
				map.put("diagnose", caseQuery.getDiagnose());
			}
		}else{
			map.put("status", false);
		}
		return map;
	}
}
