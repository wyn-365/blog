package com.wang.blog.dao;

import java.util.List;
import java.util.Map;

import com.wang.blog.domain.Blog;
import com.wang.blog.domain.Comment;
import com.wang.blog.domain.EveryDay;
import com.wang.blog.domain.PageBean;


public interface BlogDao {

	List<Blog> findHots()throws Exception;

	List<Blog> findNews()throws Exception;

	Blog blogInfo(String id)throws Exception;
	
	List findProductsByCidWithPage(String cid, int startIndex, int pageSize) throws Exception;

	int findTotalRecords()throws Exception;

	List<Blog> findAllProductsWithPage(int startIndex, int pageSize)throws Exception;

	int findTotalRecords(String cid)throws Exception;

	List<Comment> getComment(String blog_id)throws Exception;

	void writeComment(Comment comment)throws Exception;

	void increaseNum(String id)throws Exception;

	void increaseComment(String blog_id)throws Exception;

	EveryDay findEveryDay()throws Exception;

	void saveProduct(Blog blog)throws Exception;

	List<Comment> getComment()throws Exception;

	void deleteComment(int id)throws Exception;

	void deleteBlog(String id)throws Exception;

	List<Blog> findProductLike(Map<String, String[]> condition)throws Exception;

	List<Blog> findBlogWithPage(int startIndex, int pageSize, Map<String, String[]> condition)throws Exception;

	List<Comment> pingLunWithPage(int startIndex, int pageSize)throws Exception;

	int findTotalRecord()throws Exception;

	void getRcomment(String rcomment, int id)throws Exception;

	List<Blog> findPaiHang()throws Exception;

	List<Blog> findTuiJian()throws Exception;



}
