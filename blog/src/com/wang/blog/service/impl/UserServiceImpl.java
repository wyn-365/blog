	package com.wang.blog.service.impl;
	
	import com.wang.blog.dao.UserDao;
	import com.wang.blog.dao.impl.UserDaoImpl;
	import com.wang.blog.domain.User;
	import com.wang.blog.service.UserService;
	
	
	public class UserServiceImpl implements UserService {
		//用户登录
		@Override
		public User userLogin(User user) throws Exception {
			// 利用异常在模块之间传递数据
					UserDao UserDao = new UserDaoImpl();
					User uu = UserDao.userLogin(user);
					if(null == uu) {
						//密码不正确
						throw new RuntimeException("密码不正确！");
					}else if(uu.getState()==0) {
						//用户没有激活
						throw new RuntimeException("用户未激活！");
					}else {
						return uu;
					}
		}
		
		//用户注册
		@Override
		public void userRegist(User user) throws Exception {
			UserDao UserDao = new UserDaoImpl();
			UserDao.userRegist(user);
			
		}
		
		//后台添加用户
		@Override
		public void addUser(User user) throws Exception {
			// TODO Auto-generated method stub
			UserDao UserDao = new UserDaoImpl();
			UserDao.addUser(user);
		}
		
		//删除用户
		@Override
		public void deleteUser(String uid) throws Exception {
			// TODO Auto-generated method stub
			UserDao UserDao = new UserDaoImpl();
			UserDao.deleteUser(uid);
		}
		
		//禁用用户
		@Override
		public void jinUser(String uid) throws Exception {
			// TODO Auto-generated method stub
			UserDao UserDao = new UserDaoImpl();
			UserDao.jinUser(uid);
		}
		
		//启用用户
		@Override
		public void updateUser(String uid) throws Exception {
			// TODO Auto-generated method stub
			UserDao UserDao = new UserDaoImpl();
			UserDao.updateUser(uid);
		}
	
	}
