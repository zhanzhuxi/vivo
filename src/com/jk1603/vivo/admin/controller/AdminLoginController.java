package com.jk1603.vivo.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jk1603.vivo.admin.pojo.Admin;
import com.jk1603.vivo.admin.service.AdminLoginService;

@Controller
@RequestMapping("/vivoadminlogin")
public class AdminLoginController {
	
	@Autowired
	AdminLoginService adminLoginService;
	
	@RequestMapping(value="/adminlogin" ,method=RequestMethod.GET)
	public String getLogin() {
		return "admin/adminlogin";
	}
	
	@ResponseBody
	@RequestMapping(value="/adminlogin" ,method=RequestMethod.POST)
	public Boolean adminLogin(String adname,String password,HttpSession session) {
		Admin admin = new Admin();
		admin.setAdname(adname);
		admin.setPassword(password);
		Boolean result = adminLoginService.adminLogin(admin);
		if(result == true) {
			session.setAttribute("adname", adname);
			session.setAttribute("password", password);
		}
		return result;
	}
	
}
