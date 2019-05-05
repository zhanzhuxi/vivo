package com.jk1603.vivo.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk1603.vivo.user.dao.LoginDao;
import com.jk1603.vivo.user.pojo.User;
import com.jk1603.vivo.user.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	LoginDao loginDao;

	@Override
	public List<User> selectUser(User user) {
		return loginDao.selectUser(user);
	}

//	@Override
//	public Integer selectUserId(User user) {
//		return loginDao.selectUserId(user);
//	}
}
