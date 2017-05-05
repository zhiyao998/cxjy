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
		Integer pscoreCount = 0;
		Integer pscoreTotal = 0;
		Integer nscoreCount = 0;
		Integer nscoreTotal = 0;
		Integer zscoreCount = 0;
		boolean newQuestion = true;
		List<Answer> answers = questionItem.getAnswers();
		if(question.getQuestionId() == null || question.getQuestionId().equals("")){
			questionService.insert(question);
			c = updateCaseCount(question,null);
			
		}else{
			String oldFtheme = questionService.selectFtheme(question.getQuestionId());
			questionService.updateByPrimaryKey(question);
			c = updateCaseCount(question,oldFtheme);
			newQuestion = false;
		}
		question = questionService.selectByPrimaryKey(question.getQuestionId());
		Integer pscoreCountSum = c.getPanswerTotal();
		Integer nscoreCountSum = c.getNanswerTotal();
		Integer zscoreCountSum = c.getZanswerTotal();
		Integer answerTotal = c.getAnswerTotal();
		for(int i = 0; i < answers.size(); i++){
			Answer answer = answers.get(i);
			if(i == 0){
				if(answer.getAnswerId() == null || answer.getAnswerId().equals("")){
					answerService.insert(answer);
				}else{
					answerService.updateByPrimaryKey(answer);
				}
				a = "" + answer.getAnswerId();
			}else{
				if(answer.getAnswerId() == null || answer.getAnswerId().equals("")){
					answerService.insert(answer);
				}else{
					answerService.updateByPrimaryKey(answer);
				}
				a += "," + answer.getAnswerId();
			}
			if(answer.getScore() > 0){
				pscoreCount++;
				pscoreTotal += answer.getScore();
			}else if(answer.getScore() == 0){
				zscoreCount++;
			}else{
				nscoreCount++;
				nscoreTotal += answer.getScore();
			}
		}
		if(newQuestion){
			c.setAnswerTotal(answerTotal + answers.size());
			c.setPanswerTotal(pscoreCountSum + pscoreCount);
			c.setNanswerTotal(nscoreCountSum + nscoreCount);
			c.setZanswerTotal(zscoreCountSum + zscoreCount); 
		}else{
			answerTotal = answerTotal + answers.size() - question.getAnswersTotal();
			c.setAnswerTotal(answerTotal);
			pscoreCountSum = pscoreCountSum + pscoreCount - question.getPscoreCount();
			c.setPanswerTotal(pscoreCountSum);
			nscoreCountSum = nscoreCountSum + nscoreCount - question.getNscoreCount();
			c.setNanswerTotal(nscoreCountSum);
			zscoreCountSum = zscoreCountSum + zscoreCount - question.getZscoreCount();
			c.setZanswerTotal(zscoreCountSum);
		}
		if(a != null){
			question.setAnswers(a);
			question.setNscoreCount(nscoreCount);
			question.setNscoreTotal(nscoreTotal);
			question.setPscoreCount(pscoreCount);
			question.setPscoreTotal(pscoreTotal);
			question.setZscoreCount(zscoreCount);
			question.setAnswersTotal(answers.size());
			questionService.updateByPrimaryKey(question);
		}
		caseService.updateByPrimaryKey(c);
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
			newCase = caseService.selectByPrimaryKey(caseId);
		}else{
			caseService.updateByPrimaryKey(newCase);
			Integer caseId = newCase.getCaseId();
			newCase = caseService.selectByPrimaryKey(caseId);
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
		Integer count = 0;
		Integer id = Integer.parseInt(questionId);
		list.add(id);
		Question question = questionService.selectByPrimaryKey(id);
		Case case1 = caseService.selectByPrimaryKey(question.getCaseId());
		questionService.deleteByPrimaryKey(list);
		switch (question.getFtheme()) {
		case "问诊":
			count = case1.getInquiryCount();
		    case1.setInquiryCount(count-1);
			break;
		case "体格检查":
			count = case1.getPhyEaxmCount();
			case1.setPhyEaxmCount(count-1);
			break;
		case "初步诊断":
			count = case1.getFstVisitCount();
			case1.setFstVisitCount(count-1);
			break;
		case "辅助检查":
			count = case1.getAryEaxmCount();
			case1.setAryEaxmCount(count-1);
			break;
		case "确诊":
			count = case1.getDiagnoseCount();
			case1.setDiagnoseCount(count-1);
			break;
		case "治疗方案":
			count = case1.getTreatmentCount();
			case1.setTreatmentCount(count-1);   
			break;
		default:
			count = case1.getPatManCount();
			case1.setPatManCount(count-1);
			break;
		}
		case1.setPanswerTotal(case1.getPanswerTotal() - question.getPscoreCount());
		case1.setNanswerTotal(case1.getNanswerTotal() - question.getNscoreCount());
		case1.setZanswerTotal(case1.getZanswerTotal() - question.getZscoreCount());
		case1.setAnswerTotal(case1.getAnswerTotal() - question.getAnswersTotal());
		caseService.updateByPrimaryKey(case1);
		map.put("newCase", case1);
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
		map.put("初步诊断", c.getFstVisitCount());
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
		c.setFstVisitCount(map.get("初步诊断"));
		c.setTreatmentCount(map.get("治疗方案"));
		c.setDiagnoseCount(map.get("确诊"));
		c.setPatManCount(map.get("病人管理"));
		c.setPhyEaxmCount(map.get("体格检查"));
		return c;
	}
	
}
