package com.jk1603.vivo.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk1603.vivo.admin.dao.AdminLoginDao;
import com.jk1603.vivo.admin.pojo.Admin;

@Service
public class AdminLoginServiceImpl implements AdminLoginService{

	@Autowired
	AdminLoginDao adminLoginDao;
	
	@Override
	public Boolean adminLogin(Admin admin) {
		Integer adminid = adminLoginDao.adminLogin(admin);
		if(adminid == null) {
			return false;
		}else {
			return true;
		}
	}

}
