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
import lcsw.service.FirstVisitService;

@Controller
@RequestMapping(value="/firstVisit")
public class FirstVisitController {
	
	@Resource
	public FirstVisitService firstVisitService;
	
	@RequestMapping("/toAddFirstVisit")
	public String toAddFirstVisit(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/firstvisit/toAddFirstVisit";
	}
	
	@RequestMapping("/next")
	@ResponseBody
	public CaseQuery insertCase(HttpServletRequest request,FirstVisit firstVisit){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		System.out.println(firstVisit);
//		int flag = caseService.insert(c);
		caseQuery.setStatus(true);
		caseQuery.setFirstVisit(firstVisit);
		request.getSession().setAttribute("CaseQuery", caseQuery);
		return caseQuery;	
	}
	
	@RequestMapping("/getlastFirstVisit")
	@ResponseBody
	public Map<String,Object> getlastFirstVisit(HttpServletRequest request,HttpServletResponse response){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
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
