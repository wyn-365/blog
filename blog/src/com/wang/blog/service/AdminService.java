package com.wang.blog.service;

import java.util.List;

import com.wang.blog.domain.Admin;
import com.wang.blog.domain.User;

public interface AdminService {

	Admin login(Admin admin)throws Exception;

	List<User> finAllUsers()throws Exception;
}
