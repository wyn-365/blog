package com.wang.blog.web.servlet;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.wang.blog.domain.Admin;
import com.wang.blog.domain.User;
import com.wang.blog.service.AdminService;
import com.wang.blog.service.UserService;
import com.wang.blog.service.impl.AdminServiceImpl;
import com.wang.blog.service.impl.UserServiceImpl;
import com.wang.blog.utils.MyBeanUtils;
import com.wang.blog.utils.UUIDUtils;
import com.wang.blog.web.base.BaseServlet;
/**
 * Servlet implementation class AdminUserServlet
 */
@WebServlet("/adminUserServlet")
public class AdminUserServlet extends BaseServlet {
	
	//启用用户
	public String updateUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uid = request.getParameter("uid");
		UserService userService = new UserServiceImpl();
		userService.updateUser(uid);
		response.sendRedirect(request.getContextPath()+"/adminBlogServlet?method=userUI");
		return null;
	}
	//删除用户
	public String deleteUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uid = request.getParameter("uid");
		UserService userService = new UserServiceImpl();
		userService.deleteUser(uid);
		response.sendRedirect(request.getContextPath()+"/adminBlogServlet?method=userUI");
		return null;
	}
	
	//禁用用户
	public String jinUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uid = request.getParameter("uid");
		UserService userService = new UserServiceImpl();
		userService.jinUser(uid);
		response.sendRedirect(request.getContextPath()+"/adminBlogServlet?method=userUI");
		return null;
	}
	
	//增加用户
	public String addUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String telephone = request.getParameter("telephone");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		User user = new User();
		user.setBirthday(new Date());
		user.setName(name);
		user.setUsername(username);
		user.setPassword(password);
		user.setTelephone(telephone);
		user.setEmail(email);
		user.setSex(sex);
		user.setState(1);
		user.setCode(UUIDUtils.getCode());
		user.setUid(UUIDUtils.getId());
		// 设置生成激活码
		UserService UserService = new UserServiceImpl();
		UserService.addUser(user);
		
		response.sendRedirect(request.getContextPath()+"/adminBlogServlet?method=userUI");
		return null;
	}
	
	
	
	//跳转管理员登录页面
	public String loginUI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/admin/login.jsp";
	}
	//管理员退出登录
	public String loginOut(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//清除session
		req.getSession().invalidate();
		//重定向到首页
		//response.sendRedirect("/store/index.jsp");
		resp.sendRedirect(req.getContextPath()+"/admin/login.jsp");
		return null;
	
	}
	//管理员登录
	public String login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		   
		// 1.首先获取提交来的验证码 根据name属性
				String verifycode = req.getParameter("verifycode");

				// 2.首先验证码校验
				HttpSession session = req.getSession();
				String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
				// 确保验证码一次性
				session.removeAttribute("CHECKCODE_SERVER");
				if (!checkcode_server.equalsIgnoreCase(verifycode)) {
					// 2.1验证码不正确
					// 提示信息
					req.setAttribute("msg", "验证码错误！");
					// 2.2跳转登录页面
					return "/admin/login.jsp";

				}

			Admin admin = new Admin();
			MyBeanUtils.populate(admin, req.getParameterMap());
			
			AdminService adminService = new AdminServiceImpl();
			Admin user02 = null; 
			try {
				user02 = adminService.login(admin);
				//登录成功 将用户信息放入session中
				req.getSession().setAttribute("loginUser2", user02);
				//重定向到首页
				//resp.sendRedirect("/store/admin/home.jsp");
				resp.sendRedirect(req.getContextPath()+"/admin/index.jsp");
				return null;
			} catch (Exception e) {
				// 登陆失败
				String msg = e.getMessage();
				//向request域中放入失败信息
				req.setAttribute("msg", msg);
				return "/admin/login.jsp";
			}
		
		
	}
}
