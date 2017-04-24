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
	
	@Transactional
	@RequestMapping(value="/addQuestion")
	@ResponseBody
	public Map addQuestion(HttpServletRequest request,HttpServletResponse response,@RequestBody QuestionItem questionItem){
		Map map = new HashMap<String,Object>();
		Question question = questionItem.getQuestion();
		String a = question.getAnswers();
		List<Answer> answers = questionItem.getAnswers();
		if(question.getQuestionId() == null || question.getQuestionId().equals("")){
			questionService.insert(question);
		}else{
			questionService.updateByPrimaryKey(question);
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
	public List<Question> listQuestion(HttpServletRequest request,HttpServletResponse response){
		List<Question> questions = questionService.selectByCaseId(Integer.valueOf(request.getParameter("caseId")));
		return questions;
	}
	
}
