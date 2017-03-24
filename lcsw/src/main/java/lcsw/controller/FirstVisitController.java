package lcsw.controller;


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
	public CaseQuery insertCase(HttpServletRequest request,HttpServletResponse response){
		FirstVisit f = new FirstVisit();
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		f.setScore(Double.valueOf(request.getParameter("score")));
		f.setFvResultA(request.getParameter("fvResultA"));
		f.setFvResultB(request.getParameter("fvResultB"));
		f.setFvResultC(request.getParameter("fvResultC"));
		f.setFvResultD(request.getParameter("fvResultD"));
		f.setFvResultE(request.getParameter("fvResultE"));
		f.setAnalysis(request.getParameter("analysis"));
		System.out.println(f);
//		int flag = caseService.insert(c);
		caseQuery.setStatus(true);
		caseQuery.setFirstVisit(f);
		request.getSession().setAttribute("CaseQuery", caseQuery);
		return caseQuery;	
	}
	
	
}
