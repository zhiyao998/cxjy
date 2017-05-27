 package lcsw.controller;

import java.util.ArrayList;
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

import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Case;
import lcsw.service.CaseService;
import lcsw.service.QuestionService;
import lcsw.service.SessionProvider;

@Controller
@RequestMapping("/case")
public class CaseController {
	
	@Autowired
	private CaseService caseService;
	@Resource
	private SessionProvider sessionProvider;
	@Resource
	private QuestionService questionService;
	
	@RequestMapping("/list")
	@ResponseBody
	public Map listCase(HttpServletRequest request,HttpServletResponse response){
		String rows = request.getParameter("rows");
		String page = request.getParameter("page");
		String colnum = request.getParameter("sort");
		String order = request.getParameter("order");
		Map<String, Object> map = new HashMap<String, Object>();
		Integer i = 1;
		Page<Case> cases = new Page<Case>(Integer.valueOf(page), Integer.valueOf(rows));
		if(colnum != null){
			switch (colnum) {
			case "createTime":
				cases.setOrderByField("create_time");
				break;
			default:
				cases.setOrderByField("case_type");
				break;
			}
			if(order.equals("desc")){
				cases.setAsc(false);
			}
		}
		cases = caseService.selectCaseList(cases, i);
		map.put("total", cases.getTotal());
		map.put("rows", cases.getRecords());
		return map;
	}
	
	@RequestMapping("/management")
	public String caseManagement(){
		return "/case/management";
	}
	
	@RequestMapping(value="/addCase")
	public String addCase(HttpServletRequest request){
		return "/case/addCase";
	}
	
	@RequestMapping(value="/editCase")
	public String editCase(HttpServletRequest request){
		Integer id = Integer.valueOf(request.getParameter("id"));
		request.setAttribute("caseId", id);
		return "/case/addCase";
	}
	
	@RequestMapping(value="/getCase")
	@ResponseBody
	public Map getCase(HttpServletRequest request){
		Map map = new HashMap<String,Object>();
		String caseId = request.getParameter("caseId");
		Case newCase = caseService.selectByPrimaryKey(Integer.parseInt(caseId));
		map.put("newCase", newCase);
		map.put("status", true);
		return map;
	}
	
	@RequestMapping(value="/deleteCase")
	@ResponseBody
	public Map<String,Object> deleteCase(HttpServletRequest request,HttpServletResponse response){
		String str = request.getParameter("ids");
		str = str.substring(1, str.length()-1);
		String ids[] = str.split(",");
		List<Integer> istr = new ArrayList<Integer>();
		for(int i = 0; i < ids.length; i++){
			istr.add(Integer.valueOf(ids[i]));
		}
		questionService.deleteByCaseId(istr);
		caseService.deleteByPrimaryKey(istr);
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		map.put("msg", "success");
		return map;
	}
}
