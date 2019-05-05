package com.jk1603.vivo.user.dao;

import org.apache.ibatis.annotations.Insert;

public interface MyselfDao {
	@Insert("insert into user (username,call,address) values (#{username}, #{call},#{address});")
	void addMyself(String username,String call,String address);
}
