package com.wang.blog.service.impl;

import java.util.List;
import java.util.Map;

import com.wang.blog.dao.BlogDao;
import com.wang.blog.dao.impl.BlogDaoImpl;
import com.wang.blog.domain.Blog;
import com.wang.blog.domain.Comment;
import com.wang.blog.domain.EveryDay;
import com.wang.blog.domain.PageBean;

import com.wang.blog.service.BlogService;


public class BlogServiceImpl implements BlogService {
	
	BlogDao blogDao = new BlogDaoImpl();
	
	//查询最热博客
	@Override
	public List<Blog> findHots() throws Exception {
		
		return blogDao.findHots();
	}
	
	//查询最新博客
	@Override
	public List<Blog> findNews() throws Exception {
		// TODO Auto-generated method stub
		return blogDao.findNews();
	}
	
	//查询博客信息
	@Override
	public Blog blogInfo(String id) throws Exception {
		// TODO Auto-generated method stub
		return blogDao.blogInfo(id);
	}
	
	//查询分类下的博客带有分页

	@Override
	public PageBean findProductsByCidWithPage(String cid, int curNum) throws Exception {
		int totalRecords = blogDao.findTotalRecords(cid);
		PageBean pm = new PageBean(curNum,totalRecords,3);
		//关联集合 分页语句
		List list = blogDao.findProductsByCidWithPage(cid,pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		//关联 url
		pm.setUrl("blogInfoServlet?method=findAllBlog&cid="+cid);
		
		return pm;
	}
	
	//后台查询所有博客
	//后台查询所有的博客带有分页
	@Override
	public PageBean findAllProductsWithPage(int curNum) throws Exception {
		
		int totalRecords =blogDao.findTotalRecords();
		PageBean pm = new PageBean(curNum,totalRecords,5);
		//管连集合
		List<Blog> list = blogDao.findAllProductsWithPage(pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		//关联url
		pm.setUrl("adminBlogServlet?method=blogUI");
		return pm;
	}
	
	//获取对应微博下的评论
	@Override
	public List<Comment> getComment(String blog_id) throws Exception {
		// TODO Auto-generated method stub
		return blogDao.getComment(blog_id);
	}
	
	//插入评论数据
	@Override
	public void writeComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		blogDao.writeComment(comment);
	}
	
	//增加点击量
	@Override
	public void increaseNum(String id) throws Exception {
		// TODO Auto-generated method stub
		blogDao.increaseNum(id);
	}
	
	//增加评论数量
	@Override
	public void increaseComment(String blog_id) throws Exception {
		// TODO Auto-generated method stub
		blogDao.increaseComment(blog_id);
	}
	
	//查询每日推荐和每日一句
	@Override
	public EveryDay findEveryDay() throws Exception {
		// TODO Auto-generated method stub
		return blogDao.findEveryDay();
	}
	
	
	@Override
	public PageBean findProductsByCidWithPage(int curNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	//上传博客
	@Override
	public void saveProduct(Blog blog) throws Exception {
		// TODO Auto-generated method stub
		blogDao.saveProduct(blog);
	}
	
	//后台获取所有的评论信息
	@Override
	public List<Comment> getComment() throws Exception {
		// TODO Auto-generated method stub
		return blogDao.getComment();
	}
	
	//删除评论信息
	@Override
	public void deleteComment(int id) throws Exception {
		// TODO Auto-generated method stub
		blogDao.deleteComment(id);
	}
	
	//删除某个博客
	@Override
	public void deleteBlog(String id) throws Exception {
		// TODO Auto-generated method stub
		blogDao.deleteBlog(id);
	}
	
	@Override
	public List<Blog> findProductLike(Map<String, String[]> condition) throws Exception {
		// TODO Auto-generated method stub
		return blogDao.findProductLike(condition);
	}
	//模糊查询博客导游分页
	@Override
	public PageBean findBlogWithPage(Map<String, String[]> condition, int curNum) throws Exception {
		int totalRecords =blogDao.findTotalRecords();
		PageBean pm = new PageBean(curNum,totalRecords,5);
		//关联集合 分页语句
		List<Blog> list = blogDao.findBlogWithPage(pm.getStartIndex(),pm.getPageSize(),condition);
		pm.setList(list);
		//关联url
		pm.setUrl("adminBlogServlet");
		return pm;
	}
	
	//查询所有评论带有分页
	@Override
	public PageBean pingLunWithPage(int curNum) throws Exception {
		int totalRecords =blogDao.findTotalRecord();
		PageBean pm = new PageBean(curNum,totalRecords,5);
		//管连集合
		List<Comment> list = blogDao.pingLunWithPage(pm.getStartIndex(),pm.getPageSize());
		pm.setList(list);
		//关联url
		pm.setUrl("adminBlogServlet?method=pingLunWithPage");
		return pm;
	}
	
	//回复评论
	@Override
	public void getRcomment(String rcomment, int id) throws Exception {
		blogDao.getRcomment(rcomment,id);
		
	}
	
	//查询排行
	@Override
	public List<Blog> findPaiHang() throws Exception {
		// TODO Auto-generated method stub
		return blogDao.findPaiHang();
	}
	
	//评论排行--站长推荐
	@Override
	public List<Blog> findTuiJian() throws Exception {
		// TODO Auto-generated method stub
		return blogDao.findTuiJian();
	}
	

	



}
