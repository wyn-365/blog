package com.wang.blog.dao;

import java.util.List;

import com.wang.blog.domain.Admin;
import com.wang.blog.domain.User;

public interface AdminDao {

	Admin login(Admin admin)throws Exception;

	List<User> finAllUsers()throws Exception;

}
