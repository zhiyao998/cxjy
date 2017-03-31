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
import lcsw.service.CaseQueryService;
import lcsw.service.PatientManagementService;

@Controller
@RequestMapping(value="/patientMgmt")
public class PatientMgmtController {
	
	@Resource
	private PatientManagementService patientMgmtService;
	@Resource
	private CaseQueryService caseQueryService;
	
	@RequestMapping(value="/toAddPatientMgmt")
	public String toAddTreatment(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/patientmgmt/toAddPatientMgmt";
	}
	
	@RequestMapping(value="/next")
	@ResponseBody
	public Map next(HttpServletRequest request,@RequestBody List<PatientManagement> managements){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		caseQuery.setPatientManagements(managements);
		System.out.println(managements);
		request.getSession().setAttribute("CaseQuery",caseQuery);
		System.out.println(caseQuery);
		int flag = caseQueryService.insert(caseQuery);
		Map map = new HashMap<String,Object>();
		map.put("status", flag);
		request.getSession().setAttribute("CaseQuery",null);
		return map;
	}
	
	@RequestMapping("/getlastPatientMgmt")
	@ResponseBody
	public Map<String,Object> getlastTreatment(HttpServletRequest request,HttpServletResponse response){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		HashMap<String,Object> map = new HashMap<String,Object>();
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
