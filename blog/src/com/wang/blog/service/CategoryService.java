package com.wang.blog.service;

import java.util.List;

import com.wang.blog.domain.Category;

public interface CategoryService {

	List<Category> getAllCats()throws Exception;

	void deleteCategory(String cid)throws Exception;

	void addCategory(Category c)throws Exception;

}
