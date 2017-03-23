package lcsw.controller;

import java.util.ArrayList;
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
import lcsw.domain.Inquiry;
import lcsw.service.InquiryService;

@Controller()
@RequestMapping("/inquiry")
public class InquiryController {
	
	@Resource
	private InquiryService inquiryService;
	
	@RequestMapping(value="/toAdd")
	public String toAddInquiry(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/inquiry/toAddInquiry";
	}
	
	@RequestMapping(value="/selectByType")
	@ResponseBody
	public Map selectByType(HttpServletRequest request){
		Integer tpye = Integer.valueOf(request.getParameter("inquiryType"));
		List<Inquiry> list = new ArrayList<Inquiry>();
		Map map = new HashMap<String,Object>();
		list = inquiryService.selectByType(tpye);
		map.put("list", list);
		map.put("status", true);
		map.put("msg", list.size());
		return map;
	}
	
	@RequestMapping(value="/insert")
	@ResponseBody
	public CaseQuery insertInquiry(HttpServletRequest request,@RequestBody List<Inquiry> inquirys){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		caseQuery.setInquirys(inquirys);
		request.getSession().setAttribute("CaseQuery",caseQuery);
		return caseQuery;
	}
	
}
