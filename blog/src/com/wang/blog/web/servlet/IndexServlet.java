package com.wang.blog.web.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wang.blog.domain.Blog;
import com.wang.blog.domain.Category;
import com.wang.blog.domain.Comment;
import com.wang.blog.domain.EveryDay;
import com.wang.blog.domain.GongGao;
import com.wang.blog.service.BlogService;
import com.wang.blog.service.CategoryService;
import com.wang.blog.service.GongGaoService;
import com.wang.blog.service.impl.BlogServiceImpl;
import com.wang.blog.service.impl.CategoryServiceImpl;
import com.wang.blog.service.impl.GongGaoServiceImpl;
import com.wang.blog.web.base.BaseServlet;


/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/indexServlet")
public class IndexServlet extends BaseServlet {
	
	
	//查询最新最热的博客
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//查询最新商品 调用业务层的功能 查询最新最热
		BlogService blogService =  new BlogServiceImpl();
		List<Blog> list01 = blogService.findHots();
		List<Blog> list02 = blogService.findNews();
		List<Blog> list07 = blogService.findPaiHang();
		List<Blog> list08 = blogService.findTuiJian();
		
		//获取全部分类信息
		CategoryService categoryService = new CategoryServiceImpl();
		List<Category> list = categoryService.getAllCats();
		
		GongGaoService gongGaoService = new GongGaoServiceImpl();
		List<GongGao> list04 = gongGaoService.findGongGao();

		//获取今日推荐和每日一句
		EveryDay  everyDay = blogService.findEveryDay();
		
		//查看回复评论
		//List<Comment> rcomment = blogService.findRcomment();
		
		//放入request
		request.setAttribute("allCats", list);
		request.setAttribute("hots", list01);
		request.setAttribute("news", list02);
		request.setAttribute("gonggao", list04);
		request.setAttribute("everyday", everyDay);
		request.setAttribute("paihang", list07);
		request.setAttribute("tuijian", list08);
		//request.setAttribute("rcomment", rcomment);
		//咋混发到首页
		return "/jsp/index.jsp";
	}
}
