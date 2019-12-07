package com.wang.blog.dao;

import java.util.List;

import com.wang.blog.domain.Category;

public interface CategoryDao {

	List<Category> getAllCats()throws Exception;

	void deleteCategory(String cid)throws Exception;

	void addCategory(Category c)throws Exception;

}
