package lcsw.controller;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lcsw.domain.AccessoryExam;
import lcsw.domain.CaseQuery;
import lcsw.service.AccessoryExamService;
import lcsw.service.CaseQueryService;
import lcsw.service.SessionProvider;
import lcsw.util.random.IDUtils;
import lcsw.util.upload.FileUpload;

@Controller
@RequestMapping(value="/AccessoryExam")
public class AccessoryExamController {
	
	@Resource
	private AccessoryExamService accessoryExamService;
	@Resource
	private CaseQueryService caseQueryService;
	@Resource
	private SessionProvider sessionProvider;
	
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
	public List<AccessoryExam> selectByAccessoryExamType(HttpServletRequest request,HttpServletResponse response){
		String accessoryExamType = request.getParameter("accessoryExamType") ;
		Integer caseId = null;
		CaseQuery caseQuery = sessionProvider.getCaseQuery(request, response);
		List<AccessoryExam> list = accessoryExamService.selectByAccessoryExamType(accessoryExamType);
		if(caseQuery.getAccessoryExams().isEmpty() && caseQuery.getNewCase().getCaseId() == null){
			return list;
		}else{
			if(caseQuery.getAccessoryExams().isEmpty() && caseQuery.getNewCase().getCaseId() != null){
				caseId = Integer.valueOf(caseQuery.getNewCase().getCaseId());
				caseQuery.setAccessoryExams(accessoryExamService.selectByCaseId(caseId));
			}
			List<AccessoryExam> newList = new ArrayList<AccessoryExam>();
			for(AccessoryExam a:caseQuery.getAccessoryExams()){
				if(a.getAccessoryExamType().equals(accessoryExamType))
					newList.add(a);
			}
			for(AccessoryExam a:list){
				boolean flag = true;
				for(AccessoryExam i:caseQuery.getAccessoryExams()){
					if(a.getAccessoryExamType().equals(i.getAccessoryExamType()) && a.getAccessoryExamOrder().equals(i.getAccessoryExamOrder())){
						flag = false;
						break;
					}
				}
				if(flag)
					newList.add(a);
			}
			return newList;
		}
	}
	
	@RequestMapping(value="/submitData")
	@ResponseBody
	public CaseQuery submitData(HttpServletRequest request,HttpServletResponse response,@RequestBody List<AccessoryExam> accessoryExams){
		CaseQuery caseQuery = sessionProvider.getCaseQuery(request, response);
		List<AccessoryExam> list = caseQuery.getAccessoryExams();
		List<AccessoryExam> newList = new ArrayList<AccessoryExam>();
		if(list.isEmpty()){
			newList.addAll(accessoryExams);
		}else{
			newList.addAll(accessoryExams);
			for(AccessoryExam a:list){
				boolean flag = true;
				for(AccessoryExam i:accessoryExams){
					if(a.getAccessoryExamType().equals(i.getAccessoryExamType()) && a.getAccessoryExamOrder().equals(i.getAccessoryExamOrder())){
						flag = false;
						break;
					}
				}
				if(flag)
					newList.add(a);
			}
		}
		caseQuery.setAccessoryExams(newList);
		System.out.println(newList.size());
		String caseStep[] = caseQuery.getNewCase().getCaseStep().split(",");
		for(int i =0 ; i<caseStep.length;i++){
			if(caseStep[i].equals("4")&& i+1 < caseStep.length){
				caseQuery.setNextStep(caseStep[i+1]);
			}
		}
		request.getSession().setAttribute("CaseQuery",caseQuery);
		return caseQuery;
	}
	
	@RequestMapping(value="/next")
	@ResponseBody
	public Map next(HttpServletRequest request,HttpServletResponse response){
		CaseQuery caseQuery = sessionProvider.getCaseQuery(request, response);
		String caseStep[] = caseQuery.getNewCase().getCaseStep().split(",");
		int flag = 0;
		Map map = new HashMap<String,Object>();
		for(int i =0 ; i<caseStep.length;i++){
			if(caseStep[i].equals("4")){
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
	
	@RequestMapping(value="filesUpload")
	@ResponseBody
	public CaseQuery filesUpload(@RequestParam("file") MultipartFile file,HttpServletRequest request){
		AccessoryExam a =new AccessoryExam(); 
		String filePath = FileUpload.uploadFile(file, request);
		a.setAccessoryExamResult(filePath);
		if(request.getParameter("accessoryExamId") != null){
			a.setAccessoryExamId(Integer.valueOf(request.getParameter("accessoryExamId")));
		}
		a.setAccessoryExamName(request.getParameter("accessoryExamName"));
		a.setAccessoryExamOrder(Integer.valueOf(request.getParameter("accessoryExamOrder")));
		a.setAccessoryExamType(request.getParameter("accessoryExamType"));
		a.setResultType(Integer.valueOf(request.getParameter("resultType")));
		a.setScore(Double.valueOf(request.getParameter("score")));
		CaseQuery caseQuery = (CaseQuery) request.getSession().getAttribute("CaseQuery");
		List<AccessoryExam> list = caseQuery.getAccessoryExams();
		if(!list.isEmpty()){
			int index = list.size();
			for(int i = 0;i < list.size();i++){
				if(list.get(i).getAccessoryExamType().equals(a.getAccessoryExamType()) && list.get(i).getAccessoryExamOrder().equals(a.getAccessoryExamOrder())){
					index = i;
				}
			}
			list.remove(index);
		}
		list.add(a);
		
		
		caseQuery.setAccessoryExams(list);
		return caseQuery;
	}
}
