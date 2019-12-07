package com.wang.blog.service.impl;

import java.util.List;

import com.wang.blog.dao.CategoryDao;
import com.wang.blog.dao.impl.CategoryDaoImpl;
import com.wang.blog.domain.Category;
import com.wang.blog.service.CategoryService;


public class CategoryServiceImpl implements CategoryService {
	
	CategoryDao categoryDao = new CategoryDaoImpl();
	
	//查询所有的博客分类信息
	@Override
	public List<Category> getAllCats() throws Exception {
		return  categoryDao.getAllCats();
	}
	
	//删除某个分类
	@Override
	public void deleteCategory(String cid) throws Exception {
		// TODO Auto-generated method stub
		categoryDao.deleteCategory(cid);
	}
	
	//添加分类
	@Override
	public void addCategory(Category c) throws Exception {
		// TODO Auto-generated method stub
		categoryDao.addCategory(c);
	}

}
