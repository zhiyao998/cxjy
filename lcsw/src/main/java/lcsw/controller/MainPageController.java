package lcsw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageController {
		
	@RequestMapping("/main")
	public String mainPage(HttpServletRequest request,HttpServletResponse response){
		return "/mainpage";
	}
	
	
}
