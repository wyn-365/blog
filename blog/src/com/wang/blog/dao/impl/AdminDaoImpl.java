package com.wang.blog.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.wang.blog.dao.AdminDao;
import com.wang.blog.domain.Admin;
import com.wang.blog.domain.User;
import com.wang.blog.utils.JDBCUtils;


public class AdminDaoImpl implements AdminDao {
	
	//后台登录
	@Override
	public Admin login(Admin admin) throws Exception {
		String sql = "select * from admin where username = ? and password = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<Admin>(Admin.class),admin.getUsername(),admin.getPassword());
		
	}
	
	//查询所有的用户
	@Override
	public List<User> finAllUsers() throws Exception {
		String sql = "select * from user";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanListHandler<User>(User.class));
	}

}
