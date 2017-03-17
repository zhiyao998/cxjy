package lcsw.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

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
	public ModelAndView listCase(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("caseid");
		
		Case c = caseService.selectByPrimaryKey(Integer.parseInt(id));
		System.out.println(c.toString());
		return new ModelAndView("casetest", "cases", c);
	}
	
	@RequestMapping("/queryOne")
	@ResponseBody
	public Case queryOne(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("caseid");
		Case c = caseService.selectByPrimaryKey(Integer.parseInt(id));
		return c;
	}
	
	@RequestMapping("/test")
	public String testCase(){
		return "/inputTest";
	}
	
	@RequestMapping("/update")
	public String update(){
		return "/update";
	}
	
	@RequestMapping("/updateCase")
	@ResponseBody
	public HashMap updateCase(HttpServletRequest request,HttpServletResponse response){
		Case c = new Case();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		Date d =null;
		try {
			 d = format.parse(request.getParameter("createTime"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
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
	public String insertCase(HttpServletRequest request,HttpServletResponse response){
		Case c = new Case();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		Date d =null;
		try {
			 d = format.parse(request.getParameter("createTime"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setCaseTitle(request.getParameter("caseTitle"));
		c.setCaseType(request.getParameter("caseType"));
		c.setChiefComplain(request.getParameter("chiefComplain"));
		c.setCreater(request.getParameter("creater"));
		c.setCreateTime(new java.sql.Date(d.getTime()));
		c.setPatientInfo(request.getParameter("patientInfo"));
		System.out.println(c);
		caseService.insert(c);
		
		return "/inputTest";	
	}
}
