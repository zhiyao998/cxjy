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
import lcsw.service.CaseQueryService;
import lcsw.service.SessionProvider;
import lcsw.service.TreatmentService;

@Controller
@RequestMapping(value="treatment")
public class TreatmentController {
	
	@Resource
	private TreatmentService treatmentService;
	@Resource
	private CaseQueryService caseQueryService;
	@Resource
	private SessionProvider sessionProvider;
	
	@RequestMapping(value="/toAddTreatment")
	public String toAddTreatment(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/treatment/toAddTreatment";
	}
	
	@RequestMapping(value="/next")
	@ResponseBody
	public Map next(HttpServletRequest request,HttpServletResponse response,@RequestBody List<Treatment> treatments){
		CaseQuery caseQuery = sessionProvider.getCaseQuery(request, response);
		caseQuery.setTreatments(treatments);
		System.out.println(treatments);
		String caseStep[] = caseQuery.getNewCase().getCaseStep().split(",");
		int flag = 0;
		Map map = new HashMap<String,Object>();
		for(int i =0 ; i<caseStep.length;i++){
			if(caseStep[i].equals("6")){
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
	
	@RequestMapping("/getlastTreatment")
	@ResponseBody
	public Map<String,Object> getlastTreatment(HttpServletRequest request,HttpServletResponse response){
		CaseQuery caseQuery = sessionProvider.getCaseQuery(request, response);
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
