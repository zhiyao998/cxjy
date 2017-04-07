package lcsw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/standard")
public class StandardController {

	
	@RequestMapping(value="/mgmt")
	public String mgmt(){
		return null;
	}
}
