package lcsw.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lcsw.domain.Case;
import lcsw.service.CaseService;

@Controller
@RequestMapping("/case")
public class CaseController {
	
	@Autowired
	private CaseService caseService;
	
	@RequestMapping("/list")
	@ResponseBody
	public List<Case> listCase(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("caseid");
		List<Case> cases = caseService.selectAll();
		return cases;
	}
	
	@RequestMapping("/management")
	public String caseManagement(){
		return "/case/management";
	}
	
	@RequestMapping(value="/toAdd")
	public String toAdd(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/case/toAddCase";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public HashMap deleteCase(HttpServletRequest request,HttpServletResponse response){
		String str = request.getParameter("ids");
		str = str.substring(1, str.length()-1);
		String ids[] = str.split(",");
		List<Integer> istr = new ArrayList<Integer>();
		for(int i = 0; i < ids.length; i++){
			istr.add(Integer.valueOf(ids[i]));
		}
		int flag = caseService.deleteByPrimaryKey(istr);
		HashMap map = new HashMap<String,Object>();
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
	
	@RequestMapping("/updateCase")
	@ResponseBody
	public HashMap updateCase(HttpServletRequest request,HttpServletResponse response){
		Case c = new Case();
		Date d =new Date();

		c.setCaseId(Integer.valueOf(request.getParameter("caseId")));
		c.setCaseTitle(request.getParameter("caseTitle"));
		c.setCaseType(request.getParameter("caseType"));
		c.setChiefComplain(request.getParameter("chiefComplain"));
		c.setCreater(request.getParameter("creater"));
		c.setCreateTime(new java.sql.Date(d.getTime()));
		c.setPatientInfo(request.getParameter("patientInfo"));
		int status = caseService.updateByPrimaryKey(c);
		String message = null;
		if(status > 0){
			message = new String("成功");
		}else{
			message = new String("失败");
		}
		HashMap map = new HashMap<String,Object>();
		map.put("status", message);
		return map;
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public HashMap insertCase(HttpServletRequest request,HttpServletResponse response){
		Case c = new Case();
		Date d =new Date();

		c.setCaseTitle(request.getParameter("caseTitle"));
		c.setCaseType(request.getParameter("caseType"));
		c.setChiefComplain(request.getParameter("chiefComplain"));
		c.setCreater(request.getParameter("creater"));
		c.setCreateTime(new java.sql.Date(d.getTime()));
		c.setPatientInfo(request.getParameter("patientInfo"));
		System.out.println(c);
		int flag = caseService.insert(c);
		HashMap map = new HashMap<String,Object>();
		map.put("msg", c.getCaseId());
		map.put("status", flag);
		return map;	
	}
}
