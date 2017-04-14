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
import lcsw.domain.FirstVisit;
import lcsw.service.CaseQueryService;
import lcsw.service.FirstVisitService;
import lcsw.service.SessionProvider;

@Controller
@RequestMapping(value="/firstVisit")
public class FirstVisitController {
	
	@Resource
	public FirstVisitService firstVisitService;
	@Resource
	private CaseQueryService caseQueryService;
	@Resource
	private SessionProvider sessionProvider;
	
	@RequestMapping("/toAddFirstVisit")
	public String toAddFirstVisit(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/firstvisit/toAddFirstVisit";
	}
	
	@RequestMapping("/next")
	@ResponseBody
	public Map insertCase(HttpServletRequest request,HttpServletResponse response,FirstVisit firstVisit){
		CaseQuery caseQuery = sessionProvider.getCaseQuery(request, response);
		System.out.println(firstVisit);
		int flag = 0;
		Map map = new HashMap<String,Object>();
		caseQuery.setStatus(true);
		caseQuery.setFirstVisit(firstVisit);
		String caseStep[] = caseQuery.getNewCase().getCaseStep().split(",");
		for(int i =0 ; i<caseStep.length;i++){
			if(caseStep[i].equals("3")){
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
		map.put("status", true);
		return map;	
	}
	
	@RequestMapping("/getlastFirstVisit")
	@ResponseBody
	public Map<String,Object> getlastFirstVisit(HttpServletRequest request,HttpServletResponse response){
		CaseQuery caseQuery = sessionProvider.getCaseQuery(request, response);
		HashMap<String,Object> map = new HashMap<String,Object>();
		Integer caseId = null;
		if(caseQuery != null){
			if(caseQuery.getFirstVisit() == null && caseQuery.getNewCase().getCaseId() != null){
				caseId = Integer.valueOf(caseQuery.getNewCase().getCaseId());
				caseQuery.setFirstVisit(firstVisitService.selectByCaseId(caseId));
				map.put("status", true);
				map.put("firstVisit", caseQuery.getFirstVisit());
			}else{
				map.put("status", true);
				map.put("firstVisit", caseQuery.getFirstVisit());
			}
		}else{
			map.put("status", false);
		}
		return map;
	}
	
}
