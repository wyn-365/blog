<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>博客列表</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nprogress.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/images/icon/icon.png">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/icon/icon.png">
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/nprogress.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.lazyload.min.js"></script>

		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
				width: 100%;
			}
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			}
		</style>
	</head>

	<body>
	<header class="header">
  <nav class="navbar navbar-default" id="navbar">
    <div class="container">
      <div class="header-topbar hidden-xs link-border">
        <ul class="site-nav topmenu">
         <li><a href="${pageContext.request.contextPath}/userServlet?method=paihang" rel="nofollow">读者墙</a></li>
          
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" rel="nofollow">关注本站 <span class="caret"></span></a>
            <ul class="dropdown-menu header-topbar-dropdown-menu">
            <li><a data-toggle="modal" data-target="#HuiFu" rel="nofollow"><i class="fa fa-weixin"></i>评论回复</a></li>
              <li><a data-toggle="modal" data-target="#WeChat" rel="nofollow"><i class="fa fa-weixin"></i> 微信</a></li>
              <li><a href="#" rel="nofollow"><i class="fa fa-weibo"></i> 微博</a></li>
              <li><a data-toggle="modal" data-target="#areDeveloping" rel="nofollow"><i class="fa fa-rss"></i> QQ</a></li>
            </ul>
          </li>
        </ul>
        <c:if test="${empty loginUser}">
        <a data-toggle="modal" data-target="#loginModal" class="login" rel="nofollow">Hi,请登录</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/userServlet?method=registerUI" class="register" rel="nofollow">我要注册</a>&nbsp;&nbsp;
        </c:if>
        <c:if test="${not empty loginUser}">
         <a href="" style="color:red">欢迎您回来,[ ${loginUser.username} ]</a>&nbsp;&nbsp;<a href="javascript:;" style="color:red">个人中心</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/userServlet?method=logOut">退出</a>
        </c:if>
        </div>
     	
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar" aria-expanded="false"> <span class="sr-only"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <h1 class="logo hvr-bounce-in"><a href="" title=""><img src="${pageContext.request.contextPath}/images/logo2.png" alt=""></a></h1>
      </div>
      <div class="collapse navbar-collapse" id="header-navbar">
        <ul class="nav navbar-nav navbar-right">
          <li class="hidden-index active"><a data-cont="王一宁首页" href="${pageContext.request.contextPath}/indexServlet">博客首页</a></li>
         <c:forEach items="${allCats}" var="a">
          <li><a href="${pageContext.request.contextPath}/blogInfoServlet?method=findAllBlog&num=1&cid=${a.cid}">${a.cname}</a></li>
        </c:forEach>
        </ul>
        <form class="navbar-form visible-xs" action="" method="post">
          <div class="input-group">
            <input type="text" name="keyword" class="form-control" placeholder="请输入关键字" maxlength="20" autocomplete="off">
            <span class="input-group-btn">
            <button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
            </span> </div>
        </form>
      </div>
    </div>
  </nav>
</header>
	
		<!-- 没哟UI商品信息时 -->
	<c:if test="${empty productlike}">
		<div class="row" style="width:1210px;margin:0 auto;">
				<div class="col-md-12">
					<h1>对不起，您查询的关键字没有相关博客信息！</h1>
				</div>
		</div>
	</c:if>
	<!-- 有商品信息 -->
	<c:if test="${not empty productlike}">
		<div class="row" style="width:1210px;margin:0 auto;">


	
 		<c:forEach items="${productlike}" var="p">
	      <article class="excerpt excerpt-1" style="height:200px"><a class="focus" href="${pageContext.request.contextPath}/blogInfoServlet?method=blogInfo&id=${p.id}" title=""><img class="thumb" data-original="${pageContext.request.contextPath}/${p.bimage}" src="images/excerpt.jpg" alt=""></a>
	        <header><a class="cat" href="program">后端程序<i></i></a>
	          <h2><a href="article.html" title="">${p.title}</a></h2>
	        </header>
	        <p class="meta">
	          <time class="time" style="color:red"><i class="glyphicon glyphicon-time" style="color:red"></i> ${p.bdate}</time>
	          <span class="views" style="color:blue"><i class="glyphicon glyphicon-eye-open" style="color:blue"></i> 共${p.browse}人围观</span> <a class="comment" href="article.html#comment"  style="color:green"><i class="glyphicon glyphicon-comment" style="color:green"></i> ${p.bcomment}条评论</a></p>
	        <p class="note" style="color:black">${p.content}</p>
	      </article>
      </c:forEach>



		</div>
 

		    
	</c:if>
		
	
<!-- 回复的模态窗 -->
<div class="modal fade user-select" id="HuiFu" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
  <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">您评论的回复：</h4>
      </div>
        <c:if test="${not empty loginUser}">
     	<table border="0">
			<tr>
			<td>row 1, cell 1</td>
			<td>row 1, cell 2</td>
			<td>row 1, cell 2</td>
			</tr>
		</table>
     </c:if>
     <c:if test="${ empty loginUser}">
     	<h4>对不起，请您登陆后查看评论回复吧！！</h4>
     </c:if>
    </div>
  </div>
</div>

<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
  <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
      </div>
      <div class="modal-body" style="text-align:center"> <img src="${pageContext.request.contextPath}/images/weixin3.png" alt="" style="cursor:pointer"/> </div>
    </div>
  </div>
</div>
<!--该功能正在日以继夜的开发中-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
      </div>
      <div class="modal-body"> <img src="${pageContext.request.contextPath}/images/baoman/baoman_01.gif" alt="深思熟虑" />
          <div class="modal-body" style="text-align:center"> <img src="${pageContext.request.contextPath}/images/weixin3.png" alt="" style="cursor:pointer"/> </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--登录模态框-->
<div class="modal fade user-select" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form action="${pageContext.request.contextPath}/userServlet?method=userLogin" method="post">
      <div>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="loginModalLabel">登录</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="loginModalUserNmae">用户名</label>
            <input type="text" class="form-control" name="username" id="loginModalUserNmae" placeholder="请输入用户名" autofocus maxlength="15" autocomplete="off" required>
          </div>
          <div class="form-group">
            <label for="loginModalUserPwd">密码</label>
            <input type="password" class="form-control" name="password" id="loginModalUserPwd" placeholder="请输入密码" maxlength="18" autocomplete="off" required>
          </div>
            <div class="form-group">
            <label for="loginModalUserPwd">验证码</label>
             <input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="请输入验证码" style="width: 100px;"/> 
             <a href="javascript:refreshCode();">
		        <img src="${pageContext.request.contextPath}/checkCodeServlet" title="看不清点击刷新" id="vcode"/>
		     </a>
              </div>			
          </div>
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary">登录</button>
        </div>
        
      </form>
      </div>
    </div>
  </div>	
	
	
	
	
	
	
	
	
	
	<!--右键菜单列表-->
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问王一宁个人博客</li>
   
    <li class="list-group-item"><span>地址：</span>河北省廊坊市固安县温泉休闲产务园区0002号</li>
    <li class="list-group-item"><span>系统：</span>Windows10 </li>
    <li class="list-group-item"><span>浏览器：</span>Chrome</li>
  </ul>
</div>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.ias.js"></script> 
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
		
	</body>

</html>