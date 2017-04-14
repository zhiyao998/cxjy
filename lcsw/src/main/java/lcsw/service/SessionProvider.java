package lcsw.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lcsw.domain.CaseQuery;

public interface SessionProvider {
	
	public void setCaseQuery(HttpServletRequest request,HttpServletResponse response, CaseQuery caseQuery);
	
	public CaseQuery getCaseQuery(HttpServletRequest request,HttpServletResponse response);
	
	public void clearCaseQuery(HttpServletRequest request,HttpServletResponse response);

}
