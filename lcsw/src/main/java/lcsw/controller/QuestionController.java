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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Answer;
import lcsw.domain.Case;
import lcsw.domain.Question;
import lcsw.domain.QuestionItem;
import lcsw.service.AnswerService;
import lcsw.service.CaseService;
import lcsw.service.QuestionService;

@Controller
@RequestMapping(value="/question")
public class QuestionController {
	@Autowired
	private CaseService caseService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private AnswerService answerService;
	
	@RequestMapping(value="/toAddQuestion")
	public String toAddQuestion(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		request.setAttribute("caseId", request.getParameter("caseId"));
		return "/case/addQuestion";
	}
	
	@RequestMapping(value="/toEditQuestion")
	public String toEditQuestion(HttpServletRequest request){
		request.setAttribute("windowid", request.getParameter("windowid"));
		String questionId = request.getParameter("questionId");
		request.setAttribute("questionId", questionId);
		return "/case/addQuestion";
	}
	
	@RequestMapping(value="getQuestion")
	@ResponseBody
	public Map getQuestion(HttpServletRequest request){
		Map map = new HashMap<String,Object>();
		String questionId = request.getParameter("questionId");
		if(questionId != null){
			Question question = (Question) questionService.selectByPrimaryKey(Integer.parseInt(questionId));
			List<Answer> answers = new ArrayList<Answer>();
			String s[] = question.getAnswers().split(",");
			for(int i = 0; i < s.length; i++){
				Answer a = answerService.selectByPrimaryKey(Integer.valueOf(s[i]));
				answers.add(a);
			}
			map.put("question", question);
			map.put("answers", answers);
			map.put("status", true);
		}else{
			map.put("status", false);
		}
		return map;
	}
	
	@RequestMapping(value="/addQuestion")
	@ResponseBody
	public Map addQuestion(HttpServletRequest request,HttpServletResponse response,@RequestBody QuestionItem questionItem){
		Map map = new HashMap<String,Object>();
		Case c = new Case();
		Question question = questionItem.getQuestion();
		String a = question.getAnswers();
		List<Answer> answers = questionItem.getAnswers();
		if(question.getQuestionId() == null || question.getQuestionId().equals("")){
			questionService.insert(question);
			c = updateCaseCount(question,null);
			
		}else{
			String oldFtheme = questionService.selectFtheme(question.getQuestionId());
			questionService.updateByPrimaryKey(question);
			c = updateCaseCount(question,oldFtheme);
		}
		for(int i = 0; i < answers.size(); i++){
			if(i == 0){
				if(answers.get(i).getAnswerId() == null || answers.get(i).getAnswerId().equals("")){
					answerService.insert(answers.get(i));
				}else{
					answerService.updateByPrimaryKey(answers.get(i));
				}
				a = "" + answers.get(i).getAnswerId();
			}else{
				if(answers.get(i).getAnswerId() == null || answers.get(i).getAnswerId().equals("")){
					answerService.insert(answers.get(i));
				}else{
					answerService.updateByPrimaryKey(answers.get(i));
				}
				a += "," + answers.get(i).getAnswerId();
			}
		}
		if(a != null){
			question.setAnswers(a);
			questionService.updateByPrimaryKey(question);
		}
		
		System.out.println(answers);
		System.out.println(question);
		
		map.put("status", true);
		map.put("newCase", c);
		return map;
	}
	
	@RequestMapping(value="/addCaseInfo")
	@ResponseBody
	public Map addCaseInfo(HttpServletRequest request,HttpServletResponse response,Case newCase){
		Date d =new Date();
		newCase.setCreateTime(new java.sql.Date(d.getTime()));
		Map map = new HashMap<String,Object>();
		if(newCase.getCaseId() == null){
			caseService.insert(newCase);
			Integer caseId = newCase.getCaseId();
		}else{
			caseService.updateByPrimaryKey(newCase);
			Integer caseId = newCase.getCaseId();
		}
		map.put("Newcase", newCase);
		map.put("status", true);
		return map;
	}
	
	@RequestMapping(value="/deleteQuestion")
	@ResponseBody
	public Map deleteQuestion(HttpServletRequest request,HttpServletResponse response){
		Map map = new HashMap<String,Object>();
		List<Integer> list = new ArrayList<Integer>();
		String questionId = request.getParameter("id");
		list.add(Integer.parseInt(questionId));
		questionService.deleteByPrimaryKey(list);
		map.put("status", true);
		return map;
	}
	
	@RequestMapping(value="/deleteAnswer")
	@ResponseBody
	public Map deleteAnswer(HttpServletRequest request,HttpServletResponse response){
		Map map = new HashMap<String,Object>();
		List<Integer> list = new ArrayList<Integer>();
		String answerId = request.getParameter("id");
		list.add(Integer.parseInt(answerId));
		answerService.deleteByPrimaryKey(list);
		map.put("status", true);
		return map;
	}
	
	@RequestMapping(value="/list")
	@ResponseBody
	public Map listQuestion(HttpServletRequest request,HttpServletResponse response){
/*		List<Question> questions = questionService.selectByCaseId();*/
		String rows = request.getParameter("rows");
		String page = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Integer i = 1;
		Integer caseId = Integer.valueOf(request.getParameter("caseId"));
		Page<Question> questions = new Page<Question>(Integer.valueOf(page), Integer.valueOf(rows));
		questions = questionService.selectByCaseId(questions, i, caseId);
		map.put("total", questions.getTotal());
		map.put("rows", questions.getRecords());
		return map;
	}
	
	private Case updateCaseCount(Question question,String oldFtheme){
		Case c = caseService.selectByPrimaryKey(question.getCaseId());
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("问诊", c.getInquiryCount());
		map.put("体格检查", c.getPhyEaxmCount());
		map.put("初诊", c.getFstVisitCount());
		map.put("辅助检查", c.getAryEaxmCount());
		map.put("确诊", c.getDiagnoseCount());
		map.put("治疗方案", c.getTreatmentCount());
		map.put("病人管理", c.getPatManCount());
		Integer count = 0;
		if(oldFtheme == null){
			count = map.get(question.getFtheme());
			map.put(question.getFtheme(), count + 1);
		}else{
			if(!question.getFtheme().equals(oldFtheme)){
				count = map.get(oldFtheme);
				map.put(oldFtheme, count - 1);
				count = map.get(question.getFtheme());
				map.put(question.getFtheme(), count + 1);
			}
		}
		c.setInquiryCount(map.get("问诊"));
		c.setAryEaxmCount(map.get("辅助检查"));
		c.setFstVisitCount(map.get("初诊"));
		c.setTreatmentCount(map.get("治疗方案"));
		c.setDiagnoseCount(map.get("确诊"));
		c.setPatManCount(map.get("病人管理"));
		c.setPhyEaxmCount(map.get("体格检查"));
		caseService.updateByPrimaryKey(c);
		return c;
	}
	
}
