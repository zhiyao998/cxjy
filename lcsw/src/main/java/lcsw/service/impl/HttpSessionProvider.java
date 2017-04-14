package lcsw.service.impl;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lcsw.domain.CaseQuery;
import lcsw.service.SessionProvider;

@Service
public class HttpSessionProvider implements SessionProvider{

	@Override
	public void setCaseQuery(HttpServletRequest request,HttpServletResponse response, CaseQuery caseQuery) {
		HttpSession session = request.getSession();//true    Cookie JSESSIONID
		session.setAttribute("CaseQuery",caseQuery);
	}
	
	@Override
	public CaseQuery getCaseQuery(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if(session != null){
			return (CaseQuery) session.getAttribute("CaseQuery");
		}
		return null;
	}

	@Override
	public void clearCaseQuery(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("CaseQuery");
	}
	
}
