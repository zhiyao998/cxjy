package lcsw.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lcsw.domain.User;
import lcsw.service.UserService;
import lcsw.util.base.R;

@Controller
public class LoginController {
	
	@Resource
	private UserService service;
	
	@RequestMapping(value="/toRegister")
	public String toRegister(){
		return "/registerPage";
	}
	
	@RequestMapping(value="/toLogin")
	public String toLogin(){
		return "/loginPage";
	}
	
	@RequestMapping(value="/login")
	@ResponseBody
	public R Login(String name, String password){
		if(StringUtils.isBlank(name) || StringUtils.isBlank(password)){
			return R.error("用户名或密码错误");
		}
		try{
			Subject subject = SecurityUtils.getSubject();
			UsernamePasswordToken token = new UsernamePasswordToken(name, password);
			subject.login(token);
		}catch (UnknownAccountException e) {
			System.out.println(e.getMessage());
			return R.error(e.getMessage());
		}catch (IncorrectCredentialsException e) {
			return R.error(e.getMessage());
		}catch (AuthenticationException e) {
			return R.error("账户验证失败");
		}
		return R.ok();
	}
	
	@RequestMapping(value="/register")
	@ResponseBody
	public R register(String name, String password){
		if(name != null && !StringUtils.isBlank(name)){
			List<User> users = service.findByName(name);
			if(users.size() == 0){
				User user = new User();
				user.setName(name);
				user.setPassword(password);
				user.setStatus(1);
				service.insert(user);
				return R.ok();
			}else{
				return R.error(200,"用户名已存在或错误");
			}
		}
		return R.error(300,"用户名错误");
	}
	
}
