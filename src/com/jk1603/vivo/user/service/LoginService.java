package com.jk1603.vivo.user.service;

import java.util.List;

import com.jk1603.vivo.user.pojo.User;

public interface LoginService {
	
	//1.用户登录
	//(通过账号和密码查询用户)
	public List<User> selectUser(User user);

//	public Integer selectUserId(User user);

}
