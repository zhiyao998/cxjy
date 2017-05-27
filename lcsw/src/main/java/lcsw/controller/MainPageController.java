package lcsw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lcsw.util.base.R;

@Controller
public class MainPageController {
		
	@RequestMapping("/main")
	public String mainPage(HttpServletRequest request,HttpServletResponse response){
		return "/mainpage";
	}
	
	@RequestMapping("/exit")
	@ResponseBody
	public R exit(){
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return R.ok();
	}
}
