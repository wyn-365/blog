package com.wang.blog.dao;

import com.wang.blog.domain.User;

public interface UserDao {

	User userLogin(User user)throws Exception;

	void userRegist(User user)throws Exception;

	void addUser(User user)throws Exception;

	void deleteUser(String uid)throws Exception;

	void jinUser(String uid)throws Exception;

	void updateUser(String uid)throws Exception;

}
