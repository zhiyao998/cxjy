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
import lcsw.service.CaseQueryService;
import lcsw.service.InquiryService;
import lcsw.service.SessionProvider;

@Controller()
@RequestMapping("/inquiry")
public class InquiryController {
	
	@Resource
	private InquiryService inquiryService;
	@Resource
	private CaseQueryService caseQueryService;
	@Resource
	private SessionProvider sessionProvider;
	
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
	public Map<String,Object> selectByType(HttpServletRequest request,HttpServletResponse response){
		CaseQuery caseQuery = sessionProvider.getCaseQuery(request, response);
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
				for(Inquiry i1:newList){
					if(list.get(i).getInquiryOrder().equals(i1.getInquiryOrder()) && list.get(i).getInquiryType().equals(i1.getInquiryType())){
						flag = false;
						break;
					}
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
	
	@RequestMapping(value="submitInquery")
	@ResponseBody
	public Map submitInquery(HttpServletRequest request,HttpServletResponse response,@RequestBody List<Inquiry> inquirys){
		CaseQuery caseQuery = sessionProvider.getCaseQuery(request, response);	
		Map<String,Object> map = new HashMap<String,Object>();
		List<Inquiry> list = caseQuery.getInquirys();
		List<Inquiry> newList = new ArrayList<Inquiry>();
		if(list.isEmpty()){
			caseQuery.setInquirys(inquirys);
		}else{
			for(Inquiry i:inquirys){
				newList.add(i);
			}
			for(int i = 0; i < list.size(); i++){
				boolean flag = true;
				for(Inquiry i1:inquirys){
					if(list.get(i).getInquiryOrder().equals(i1.getInquiryOrder()) && list.get(i).getInquiryType().equals(i1.getInquiryType()))
						flag = false;
				}
				if(flag){
					newList.add(list.get(i));
				}
			}
			caseQuery.setInquirys(newList);
		}	
		map.put("status", true);
		return map;
	}
	
	@RequestMapping(value="/next")
	@ResponseBody
	public Map insertInquiry(HttpServletRequest request,HttpServletResponse response){
		CaseQuery caseQuery = sessionProvider.getCaseQuery(request, response);		
		String caseStep[] = caseQuery.getNewCase().getCaseStep().split(",");
		int flag = 0;
		Map map = new HashMap<String,Object>();
		for(int i =0 ; i<caseStep.length;i++){
			if(caseStep[i].equals("1")){
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
	
}
