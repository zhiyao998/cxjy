package lcsw.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping(value="/toEdit")
	public String toEditInquiry(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		
		return "/inquiry/toAddInquiry";
	}
	
	@RequestMapping(value="/selectByType")
	@ResponseBody
	public Map<String,Object> selectByType(HttpServletRequest request){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		Integer caseId = null;
		Integer tpye = Integer.valueOf(request.getParameter("inquiryType"));
		List<Inquiry> newList = new ArrayList<Inquiry>();
		Map<String,Object> map = new HashMap<String,Object>();
		List<Inquiry> list = inquiryService.selectByType(tpye);
		if(caseQuery.getInquirys().isEmpty() && caseQuery.getNewCase().getCaseId() == null){
			map.put("list", list);
			map.put("msg", list.size());
		}else{
			if(caseQuery.getInquirys().isEmpty() && caseQuery.getNewCase().getCaseId() != null){
				caseId = Integer.valueOf(caseQuery.getNewCase().getCaseId());
				caseQuery.setInquirys(inquiryService.selectByCaseId(caseId));
			}
			List<Inquiry> inquiries = caseQuery.getInquirys();
			for(Inquiry i:inquiries){
				if(i.getInquiryType().equals(tpye))
					newList.add(i);
			}
			for(int i = 0; i < list.size(); i++){
				boolean flag = true;
				for(Inquiry i1:inquiries){
					if(list.get(i).getInquiryOrder().equals(i1.getInquiryOrder()) && list.get(i).getInquiryType().equals(i1.getInquiryType()))
						flag = false;
				}
				if(flag){
					newList.add(list.get(i));
				}
			}
			map.put("list", newList);
			map.put("msg", newList.size());
		}
		
		map.put("status", true);
		return map;
	}
	
	@RequestMapping(value="/next")
	@ResponseBody
	public CaseQuery insertInquiry(HttpServletRequest request,@RequestBody List<Inquiry> inquirys){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		caseQuery.setInquirys(inquirys);
		request.getSession().setAttribute("CaseQuery",caseQuery);
		return caseQuery;
	}
	
}
