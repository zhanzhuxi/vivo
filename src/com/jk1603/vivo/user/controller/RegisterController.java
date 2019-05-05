package com.jk1603.vivo.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jk1603.vivo.user.pojo.User;
import com.jk1603.vivo.user.service.RegisterService;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	RegisterService registerService;
	
	@RequestMapping(value="/get",method=RequestMethod.GET)
	public String register() {
		return "user/register";
	}
	@ResponseBody
	@RequestMapping("/register")
	public String addUser(String username,String password) {
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);
		String result=registerService.addUser(user);
		return result;
	}
}
