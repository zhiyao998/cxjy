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
import lcsw.domain.PatientManagement;
import lcsw.service.PatientManagementService;

@Controller
@RequestMapping(value="/patientMgmt")
public class PatientMgmtController {
	
	@Resource
	private PatientManagementService patientMgmtService;
	
	@RequestMapping(value="/toAddPatientMgmt")
	public String toAddTreatment(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/patientmgmt/toAddPatientMgmt";
	}
	
	@RequestMapping(value="/next")
	@ResponseBody
	public CaseQuery next(HttpServletRequest request,@RequestBody List<PatientManagement> managements){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		caseQuery.setPatientManagements(managements);
		System.out.println(managements);
		request.getSession().setAttribute("CaseQuery",caseQuery);
		return caseQuery;
	}
	
	@RequestMapping("/getlastPatientMgmt")
	@ResponseBody
	public Map getlastTreatment(HttpServletRequest request,HttpServletResponse response){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		HashMap map = new HashMap<String,Object>();
		if(caseQuery != null){
			if(caseQuery.getPatientManagements() == null){
				map.put("status", false);
			}else{
				map.put("status", true);
				map.put("patientMgmt", caseQuery.getPatientManagements());
			}
		}else{
			map.put("status", false);
		}
		return map;
	}
}
