package com.jk1603.vivo.user.service;

import java.util.List;

import com.jk1603.vivo.user.pojo.User;

public interface LoginService {
	
	//1.�û���¼
	//(ͨ���˺ź������ѯ�û�)
	public List<User> selectUser(User user);

//	public Integer selectUserId(User user);

}
