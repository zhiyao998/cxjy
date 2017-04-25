package lcsw.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface SessionProvider {
	public void clearCaseQuery(HttpServletRequest request,HttpServletResponse response);

}
