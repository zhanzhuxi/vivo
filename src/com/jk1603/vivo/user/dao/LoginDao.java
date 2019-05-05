package com.jk1603.vivo.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.jk1603.vivo.user.pojo.User;

public interface LoginDao {
	// 1.�û���¼
	// (ͨ���˺ź������ѯ�û�)
	@Select("select * from user where username=#{u.username} and password=#{u.password}")
	public List<User> selectUser(@Param("u")User user);
	
//	@Select("select id from user where username=#{username}")
//	public Integer selectUserId(@Param("u")User user);
}
