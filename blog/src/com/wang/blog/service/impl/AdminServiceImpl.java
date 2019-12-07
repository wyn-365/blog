package com.wang.blog.service.impl;

import java.util.List;

import com.wang.blog.dao.AdminDao;
import com.wang.blog.dao.impl.AdminDaoImpl;
import com.wang.blog.domain.Admin;
import com.wang.blog.domain.User;
import com.wang.blog.service.AdminService;


public class AdminServiceImpl implements AdminService {
	//管理员登录
	@Override
	public Admin login(Admin admin) throws Exception {
		AdminDao adminDao = new AdminDaoImpl();
		Admin uu = adminDao.login(admin);
		if(null == uu) {
			//密码不正确
			throw new RuntimeException("用户名或者密码不正确！");
		}else {
			return uu;
		}
	}
	
	//查询所有的用户
	@Override
	public List<User> finAllUsers() throws Exception {
		// TODO Auto-generated method stub
		AdminDao adminDao = new AdminDaoImpl();
		return adminDao.finAllUsers();
	}

}
