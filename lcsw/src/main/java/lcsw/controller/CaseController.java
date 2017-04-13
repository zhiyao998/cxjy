package lcsw.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lcsw.domain.Case;
import lcsw.domain.CaseQuery;
import lcsw.service.CaseQueryService;
import lcsw.service.CaseService;

@Controller
@RequestMapping("/case")
public class CaseController {
	
	@Autowired
	private CaseService caseService;
	@Resource
	private CaseQueryService caseQueryService;
	
	@RequestMapping("/list")
	@ResponseBody
	public List<Case> listCase(HttpServletRequest request,HttpServletResponse response){
		List<Case> cases = caseService.selectAll();
		return cases;
	}
	
	@RequestMapping("/clear")
	@ResponseBody
	public HashMap clear(HttpServletRequest request){
		request.getSession().removeAttribute("CaseQuery");
		HashMap<String,Object> map = new HashMap<String,Object>();
		System.out.println("-------------------clear  session-----------------------");
		map.put("status", true);
		return map;
	}
	
	@RequestMapping("/management")
	public String caseManagement(){
		return "/case/management";
	}
	
	@RequestMapping("/checkCase")
	public String checkCase(HttpServletRequest request){
		Integer id = Integer.valueOf(request.getParameter("id"));
		CaseQuery caseQuery = caseQueryService.selectByPrimaryKey(id);
		request.setAttribute("caseQuery", caseQuery);
		return "/case/checkCase";
	}
	
	@RequestMapping(value="/toAdd")
	public String toAdd(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/case/toAddCase";
	}
	
	@RequestMapping("/toEdit")
	public String toEdit(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		Integer id = Integer.valueOf(request.getParameter("id"));
		CaseQuery caseQuery = caseQueryService.selectByPrimaryKey(id);
		request.setAttribute("caseQuery", caseQuery);
		return "/case/toEditCase";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String,Object> deleteCase(HttpServletRequest request,HttpServletResponse response){
		String str = request.getParameter("ids");
		str = str.substring(1, str.length()-1);
		String ids[] = str.split(",");
		List<Integer> istr = new ArrayList<Integer>();
		for(int i = 0; i < ids.length; i++){
			istr.add(Integer.valueOf(ids[i]));
		}
		int flag = caseQueryService.deleteByPrimaryKey(istr);
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("status", flag);
		map.put("msg", "success");
		return map;
	}
	
	@RequestMapping("/queryOne")
	@ResponseBody
	public Case queryOne(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("caseid");
		Case c = caseService.selectByPrimaryKey(Integer.parseInt(id));
		return c;
	}
	
	@RequestMapping("/getlastCase")
	@ResponseBody
	public Map<String,Object> getlastCase(HttpServletRequest request,HttpServletResponse response){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		System.out.println(request.getSession().getAttribute("CaseQuery"));
		System.out.println("getlastCase" + caseQuery);
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(caseQuery != null){
			if(caseQuery.getNewCase() == null){
				map.put("status", false);
			}else{
				map.put("status", true);
				map.put("Newcase", caseQuery.getNewCase());
			}
		}else{
			map.put("status", false);
		}
		return map;
	}
	
	
	@RequestMapping("/next")
	@ResponseBody
	public CaseQuery insertCase(HttpServletRequest request,Case newCase){
		Date d =new Date();
		newCase.setCreateTime(new java.sql.Date(d.getTime()));
		String caseStep[] = newCase.getCaseStep().split(",");
		System.out.println(newCase);
		CaseQuery caseQuery = new CaseQuery();
		caseQuery.setNewCase(newCase);
		caseQuery.setStatus(true);
		caseQuery.setLastStep("");
		caseQuery.setNextStep(caseStep[1]);
		request.getSession().setAttribute("CaseQuery", caseQuery);
		return caseQuery;	
	}
	
	@RequestMapping("/last")
	@ResponseBody
	public Map last(HttpServletRequest request){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		String caseStep[] = caseQuery.getNewCase().getCaseStep().split(",");
		Map m = new HashMap<String,Object>();
		String step = request.getParameter("step");
		for(int i =0 ; i<caseStep.length;i++){
			if(caseStep[i].equals(step)&& !step.equals("0")){
				m.put("status", true);
				m.put("lastStep", caseStep[i-1]);
				break;
			}
		}
		return m;	
	}
}
