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
import lcsw.service.CaseQueryService;
import lcsw.service.DiagnoseService;
import lcsw.service.SessionProvider;

@Controller
@RequestMapping(value="diagnose")
public class DiagnoseController {
	
	@Resource
	private DiagnoseService diagnoseService;
	@Resource
	private CaseQueryService caseQueryService;
	@Resource
	private SessionProvider sessionProvider;
	
	@RequestMapping(value="/toAddDiagnose")
	public String toAddDiagnose(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/diagnose/toAddDiagnose";
	}
	
	@RequestMapping("/next")
	@ResponseBody
	public Map insertCase(HttpServletRequest request,HttpServletResponse response,Diagnose diagnose){
		CaseQuery caseQuery = sessionProvider.getCaseQuery(request, response);
		System.out.println(diagnose);
//		int flag = caseService.insert(c);
		caseQuery.setStatus(true);
		caseQuery.setDiagnose(diagnose);
		String caseStep[] = caseQuery.getNewCase().getCaseStep().split(",");
		int flag = 0;
		Map map = new HashMap<String,Object>();
		for(int i =0 ; i<caseStep.length;i++){
			if(caseStep[i].equals("5")){
				if(i+1 < caseStep.length){
					caseQuery.setNextStep(caseStep[i+1]);
					sessionProvider.setCaseQuery(request, response, caseQuery);
					map.put("status",1);
					map.put("CaseQuery",  caseQuery);
					return map;
				}else{
					if(caseQuery.getNewCase().getCaseId() == null)
						flag = caseQueryService.insert(caseQuery);
					else
						flag = caseQueryService.updateByPrimaryKey(caseQuery);
					map.put("status", 2);
					sessionProvider.clearCaseQuery(request, response);
					return map;
				}
			}
		}
		map.put("status", 0);
		return map;
	}
	
	@RequestMapping("/getlastDiagnose")
	@ResponseBody
	public Map<String,Object> getlastDiagnose(HttpServletRequest request,HttpServletResponse response){
		CaseQuery caseQuery = sessionProvider.getCaseQuery(request, response);
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
