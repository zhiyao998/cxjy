package lcsw.controller;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lcsw.domain.AccessoryExam;
import lcsw.domain.CaseQuery;
import lcsw.service.AccessoryExamService;
import lcsw.util.random.IDUtils;
import lcsw.util.upload.FileUpload;

@Controller
@RequestMapping(value="/AccessoryExam")
public class AccessoryExamController {
	
	@Resource
	private AccessoryExamService accessoryExamService;
	
	@RequestMapping(value="/toAddAccessoryExam")
	public String toAddAccessoryExam(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		return "/accessoryexam/toAddAccessoryExam";
	}
	
	@RequestMapping(value="/selectByResultType")
	@ResponseBody
	public List<Integer> selectAccessoryExamTypeByResultType(HttpServletRequest request){
		Integer resultType = Integer.valueOf(request.getParameter("resultType")) ;
		List<Integer> list = accessoryExamService.selectAccessoryExamTypeByResultType(resultType);
		return list;
	}
	
	@RequestMapping(value="/selectByAccessoryExamType")
	@ResponseBody
	public List<AccessoryExam> selectByAccessoryExamType(HttpServletRequest request){
		Integer accessoryExamType = Integer.valueOf(request.getParameter("accessoryExamType")) ;
		List<AccessoryExam> list = accessoryExamService.selectByAccessoryExamType(accessoryExamType);
		return list;
	}
	
	@RequestMapping(value="/next")
	@ResponseBody
	public CaseQuery next(HttpServletRequest request,@RequestBody List<AccessoryExam> accessoryExams){
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		List<AccessoryExam> list = caseQuery.getAccessoryExams();
		List<AccessoryExam> newList = new ArrayList<AccessoryExam>();
		if(list.isEmpty()){
			newList.addAll(accessoryExams);
		}else{
			for(AccessoryExam a:list){
				boolean flag = true;
				for(AccessoryExam i:accessoryExams){
					newList.add(i);
					if(a.getAccessoryExamType().equals(i.getAccessoryExamType()) && a.getAccessoryExamOrder().equals(i.getAccessoryExamOrder())){
						flag = false;
					}
				}
				if(flag)
					newList.add(a);
			}
		}
		caseQuery.setAccessoryExams(newList);
		request.getSession().setAttribute("CaseQuery",caseQuery);
		return caseQuery;
	}
	
	@RequestMapping(value="filesUpload")
	@ResponseBody
	public CaseQuery filesUpload(@RequestParam("file") MultipartFile file,HttpServletRequest request){
		AccessoryExam a =new AccessoryExam(); 
		String filePath = FileUpload.uploadFile(file, request);
		a.setAccessoryExamResult(filePath);
		a.setAccessoryExamName(request.getParameter("accessoryExamName"));
		a.setAccessoryExamOrder(Integer.valueOf(request.getParameter("accessoryExamOrder")));
		a.setAccessoryExamType(request.getParameter("accessoryExamType"));
		a.setResultType(Integer.valueOf(request.getParameter("resultType")));
		a.setScore(Double.valueOf(request.getParameter("score")));
		System.out.println(a);
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		List<AccessoryExam> list = caseQuery.getAccessoryExams();
		int index = list.size();
		for(AccessoryExam i:list){
			if(i.getAccessoryExamType().equals(a.getAccessoryExamType()) && i.getAccessoryExamOrder().equals(a.getAccessoryExamOrder())){
				index = list.indexOf(i);
			}
		}
		list.add(index, a);

		
		caseQuery.setAccessoryExams(list);
		return caseQuery;
	}
}
