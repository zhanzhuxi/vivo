package com.jk1603.vivo.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jk1603.vivo.user.pojo.User;
import com.jk1603.vivo.user.service.LoginService;


@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	HttpSession session;

	@Autowired
	LoginService loginService;

	@RequestMapping(value="/get",method=RequestMethod.GET)
	public String login() {
//		user = service.getUser("","");
//		session.setAttribute("user", user);
		return "user/login";
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public Boolean checkUser(@RequestBody User user) {
		//session.getAttribute("user");
		if(loginService.selectUser(user).isEmpty()){
			return false;
		}else {
			// 
			session.setAttribute("userid", loginService.selectUser(user).get(0).getId());
			session.setAttribute("username", loginService.selectUser(user).get(0).getUsername());
			return true;
		}
	}
	
//	@RequestMapping("/login1")
//	@ResponseBody
//	public Integer addUser(@RequestBody User user) {
//		Integer result=loginService.selectUserId(user);
//		System.out.println(result);
//		return result;
//	}
}
