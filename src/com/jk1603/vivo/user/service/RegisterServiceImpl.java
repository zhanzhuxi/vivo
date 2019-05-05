package com.jk1603.vivo.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk1603.vivo.user.dao.RegisterDao;
import com.jk1603.vivo.user.pojo.User;

@Service
public class RegisterServiceImpl implements RegisterService{

	@Autowired
	RegisterDao registerDao;

	@Override
	public String addUser(User user) {
		User u=registerDao.isExist(user.getUsername());
		if(u != null) {
			return "用户已存在";
		}
		registerDao.addUser(user);
		return "注册成功";
	}

}
