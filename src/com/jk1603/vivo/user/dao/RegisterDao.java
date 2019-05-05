package com.jk1603.vivo.user.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.jk1603.vivo.user.pojo.User;

public interface RegisterDao {
	// 2.用户注册
	// (验证用户是否存在)
	@Select("select * from user where username=#{username};")
	User isExist(String username);

	// (添加用户)
	@Insert("insert into user (username,password) values (#{username}, #{password});")
	void addUser(User user);

}
