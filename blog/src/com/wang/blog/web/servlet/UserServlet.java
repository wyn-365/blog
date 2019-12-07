package com.wang.blog.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.wang.blog.domain.User;
import com.wang.blog.service.UserService;
import com.wang.blog.service.impl.UserServiceImpl;
import com.wang.blog.utils.MailUtils;
import com.wang.blog.utils.MyBeanUtils;
import com.wang.blog.utils.UUIDUtils;
import com.wang.blog.web.base.BaseServlet;

@WebServlet("/userServlet")
public class UserServlet extends BaseServlet {
	
	//读者墙的排行榜
	public String paihang(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/jsp/readers.jsp";
	}
	// userRegist用户的注册
	public String userRegist(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 1.首先获取提交来的验证码 根据name属性
		String verifycode = request.getParameter("verifycode");

		// 2.首先验证码校验
		HttpSession session = request.getSession();
		String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
		// 确保验证码一次性
		session.removeAttribute("CHECKCODE_SERVER");
		if (!checkcode_server.equalsIgnoreCase(verifycode)) {
			// 2.1验证码不正确
			// 提示信息
			request.setAttribute("msg", "验证码错误！");
			// 2.2跳转登录页面
			return "/jsp/register.jsp";

		}

		// 接收表单参数
		Map<String, String[]> map = request.getParameterMap();
		User user = new User();// 实用BeanUtils工具类封装数据
		MyBeanUtils.populate(user, map);// 首先转换日期格式 反射
		// 为用户的uid属性赋值
		user.setUid(UUIDUtils.getId());
		// 默认为未激活
		user.setState(1);
		user.setCode(UUIDUtils.getCode());
		// 设置生成激活码
		user.setCode(UUIDUtils.getCode());
		System.out.println(user);

		// 调用业务层
		UserService UserService = new UserServiceImpl();
		UserService.userRegist(user);
		request.setAttribute("msg", "用户注册成功，请登陆！");
		return "/jsp/index.jsp";
	}

	
	//跳转注册页面
	public String registerUI(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		return "/jsp/register.jsp";
	}
	/*
	 * 激活用户
	 * 
	 * @throws SQLException
	 * 
	 * public String active(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException, SQLException { // 获取激活码
	 * String code = request.getParameter("code"); //调用业务层的激活功能 UserService
	 * UserService = new UserServiceImpl(); //激活的信息提示 boolean flag =
	 * UserService.userActive(code); if(flag==true) { //激活成功
	 * 向request域中存放提示信息，转发发到登录页面 request.setAttribute("msg", "您已经激活成功，请登录账号！！！");
	 * return "/jsp/login.jsp"; }else { //激活失败 request.setAttribute("msg",
	 * "您激活失败，请重新激活账号！！！"); return ".jsp/info.jsp"; }
	 * 
	 * 
	 * }
	 */
	/*
	 * 用户登录的方法
	 */

	// index的登录
	public String userLogin(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		// 1.首先获取提交来的验证码 根据name属性
		String verifycode = request.getParameter("verifycode");

		// 2.首先验证码校验
		HttpSession session = request.getSession();
		String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
		// 确保验证码一次性
		session.removeAttribute("CHECKCODE_SERVER");
		if (!checkcode_server.equalsIgnoreCase(verifycode)) {
			// 2.1验证码不正确
			// 提示信息
			request.setAttribute("msg", "验证码错误！");
			// 2.2跳转登录页面
			return "/jsp/404.jsp";

		}
			// 获取用户数据 用户名和密码
			User user = new User();
			MyBeanUtils.populate(user, request.getParameterMap());
			// 调用业务层的登陆功能
			UserService UserService = new UserServiceImpl();
			
			
			User user02 = null;
			try {
				user02 = UserService.userLogin(user);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(user02 != null){
				// 登录成功 将用户信息放入session中
			request.getSession().setAttribute("loginUser", user02);
				// 重定向到首页
				// response.sendRedirect("/store/index.jsp");
				// return null;
			response.sendRedirect(request.getContextPath() + "/indexServlet");
			return null;
			}else {
			// 登陆失败
			// 向request域中放入失败信息
			request.setAttribute("msg", "用户名或者密码不正确！");

			return "/jsp/404.jsp";
		     }
			
			
			}
			
		


	/*
	 * 用户退出功能
	 */
	public String logOut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 清除session
		request.getSession().invalidate();
		// 重定向到首页
		// response.sendRedirect("/store/index.jsp");
		response.sendRedirect(request.getContextPath() + "/indexServlet");
		return null;
	}

}
