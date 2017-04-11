package lcsw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/exam")
public class ExamController {
	
	@RequestMapping("/main")
	public String mainpage(){
		
		return "/exampage";
	}
	
	@RequestMapping("/caseInfo")
	public String caseInfo(){
		return "/exam/caseInfo";
	}
	
	@RequestMapping("/patientInfo")
	public String patientInfo(){
		return "/exam/patientInfo";
	}
	
	@RequestMapping("/inquiryInfo")
	public String inquiryInfo(){
		return "/exam/inquiryInfo";
	}
	
	@RequestMapping("/physicalExamInfo")
	public String physicalExamInfo(){
		return "/exam/physicalExamInfo";
	}
	
	@RequestMapping("/firstvisitInfo")
	public String firstvisitInfo(){
		return "/exam/firstvisitInfo";
	}
	
	@RequestMapping("/accessoryExamInfo")
	public String accessoryExamInfo(){
		return "/exam/accessoryExamInfo";
	}
	
	@RequestMapping("/diagnoseInfo")
	public String diagnoseInfo(){
		return "/exam/diagnoseInfo";
	}
	
	@RequestMapping("/treatmentInfo")
	public String treatmentInfo(){
		return "/exam/treatmentInfo";
	}
	
	@RequestMapping("/patientMgmtInfo")
	public String patientMgmtInfo(){
		return "/exam/patientMgmtInfo";
	}
	
	@RequestMapping("/historyInfo")
	public String historyInfo(){
		return "/exam/historyInfo";
	}
}
