package com.wang.blog.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.wang.blog.dao.UserDao;
import com.wang.blog.domain.User;
import com.wang.blog.utils.JDBCUtils;


public class UserDaoImpl implements UserDao {
	//登录
	@Override
	public User userLogin(User user) throws Exception {
		// 用户登录
		String sql = "select * from user where username = ? and password = ?";
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		return qr.query(sql, new BeanHandler<User>(User.class),user.getUsername(),user.getPassword());
		
	}
	
	//注册
	@Override
	public void userRegist(User user) throws Exception {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "insert into user values (?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {user.getUid(),user.getUsername(),user.getPassword(),user.getName(),user.getEmail(),user.getTelephone(),user.getBirthday(),user.getSex(),user.getState(),user.getCode()};
		
		qr.update(sql,params);
		
	}
	
	//添加用户 后台
	@Override
	public void addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "insert into user values (?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {user.getUid(),user.getUsername(),user.getPassword(),user.getName(),user.getEmail(),user.getTelephone(),user.getBirthday(),user.getSex(),user.getState(),user.getCode()};
		
		qr.update(sql,params);
	}
	
	//删除用户
	@Override
	public void deleteUser(String uid) throws Exception {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "delete from user where uid =?";
		qr.update(sql,uid);
	}

	@Override
	public void jinUser(String uid) throws Exception {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "update user set state = 0 where uid =?";
		qr.update(sql,uid);
	}
	
	//启用用户
	@Override
	public void updateUser(String uid) throws Exception {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "update user set state = 1 where uid =?";
		qr.update(sql,uid);
	}

}
