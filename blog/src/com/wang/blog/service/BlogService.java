package com.wang.blog.service;

import java.util.List;
import java.util.Map;

import com.wang.blog.domain.Blog;
import com.wang.blog.domain.Comment;
import com.wang.blog.domain.EveryDay;
import com.wang.blog.domain.PageBean;

public interface BlogService {

	List<Blog> findHots()throws Exception;

	List<Blog> findNews()throws Exception;

	Blog blogInfo(String id)throws Exception;
	
	PageBean findProductsByCidWithPage(String cid, int curNum)throws Exception;

	PageBean findAllProductsWithPage(int curNum)throws Exception;

	List<Comment> getComment(String blog_id)throws Exception;

	void writeComment(Comment comment)throws Exception;

	void increaseNum(String id)throws Exception;

	void increaseComment(String blog_id)throws Exception;

	EveryDay findEveryDay()throws Exception;

	PageBean findProductsByCidWithPage(int curNum)throws Exception;

	void saveProduct(Blog blog)throws Exception;

	List<Comment> getComment()throws Exception;

	void deleteComment(int id)throws Exception;

	void deleteBlog(String id)throws Exception;

	List<Blog> findProductLike(Map<String, String[]> condition)throws Exception;

	PageBean findBlogWithPage(Map<String, String[]> condition, int curNum)throws Exception;

	PageBean pingLunWithPage(int curNum)throws Exception;

	void getRcomment(String rcomment, int id)throws Exception;

	List<Blog> findPaiHang()throws Exception;

	List<Blog> findTuiJian()throws Exception;

}
