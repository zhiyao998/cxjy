package lcsw.service.impl;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import lcsw.service.SessionProvider;

@Service
public class HttpSessionProvider implements SessionProvider{


	@Override
	public void clearCaseQuery(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("CaseQuery");
	}
	
}
