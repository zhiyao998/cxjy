package lcsw.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lcsw.domain.QuestionType;
import lcsw.service.QuestionService;


@Controller
@RequestMapping(value="/TestPaperGen")
public class TestPaperGenController {
	
	@Resource
	private QuestionService qService;
	
	@RequestMapping(value="/findAllCase")
	public String findAllCase(HttpServletRequest request,HttpServletResponse response){
		List<QuestionType> list = qService.selectCountByThemeAndType();	
		request.setAttribute("list", list);
		return "/TestPaperGen/countList";
	}
	
	@RequestMapping(value="/getCount")
	@ResponseBody
	public Map getCount(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> map = new HashMap<String,Object>();
		List<QuestionType> list = qService.selectCountByThemeAndType();	
		map.put("rows", list);
		return map;
	}
	
	@RequestMapping(value="/genTestPaer")
	@ResponseBody
	public Map genTestPaer(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> map = new HashMap<String,Object>();
		String total = request.getParameter("total");
		System.out.println(total);
		return map;
	}
	
}
