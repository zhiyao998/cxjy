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
	public CaseQuery insertCase(HttpServletRequest request,HttpServletResponse response){
		Diagnose d = new Diagnose();
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		d.setScore(Double.valueOf(request.getParameter("score")));
		d.setDiagnoseResultA(request.getParameter("diagnoseResultA"));
		d.setDiagnoseResultB(request.getParameter("diagnoseResultB"));
		d.setDiagnoseResultC(request.getParameter("diagnoseResultC"));
		d.setDiagnoseResultD(request.getParameter("diagnoseResultD"));
		d.setDiagnoseResultE(request.getParameter("diagnoseResultE"));
		d.setDiagnoseAnswer(request.getParameter("diagnoseAnswer"));
		System.out.println(d);
//		int flag = caseService.insert(c);
		caseQuery.setStatus(true);
		caseQuery.setDiagnose(d);
		request.getSession().setAttribute("CaseQuery", caseQuery);
		return caseQuery;	
	}
	
	@RequestMapping("/getlastDiagnose")
	@ResponseBody
	public Map<String,Object> getlastDiagnose(HttpServletRequest request,HttpServletResponse response){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(caseQuery != null){
			if(caseQuery.getDiagnose() == null){
				map.put("status", false);
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
