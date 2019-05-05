package com.jk1603.vivo.user.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.jk1603.vivo.user.pojo.User;

public interface RegisterDao {
	// 2.�û�ע��
	// (��֤�û��Ƿ����)
	@Select("select * from user where username=#{username};")
	User isExist(String username);

	// (����û�)
	@Insert("insert into user (username,password) values (#{username}, #{password});")
	void addUser(User user);

}
