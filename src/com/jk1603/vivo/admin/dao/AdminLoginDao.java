package com.jk1603.vivo.admin.dao;

import org.apache.ibatis.annotations.Select;

import com.jk1603.vivo.admin.pojo.Admin;

public interface AdminLoginDao {
	//����Ա��¼
	@Select("select id from admin where adname=#{adname} and `password`=#{password}")
	Integer adminLogin(Admin admin);
}
