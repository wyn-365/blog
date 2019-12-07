<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>博客读者墙排行</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nprogress.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/images/icon/icon.png">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/icon/icon.png">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/nprogress.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.lazyload.min.js"></script>
<!--[if gte IE 9]>
  <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
  <script src="js/html5shiv.min.js" type="text/javascript"></script>
  <script src="js/respond.min.js" type="text/javascript"></script>
  <script src="js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->
<!--[if lt IE 9]>
  <script>window.location.href='upgrade-browser.html';</script>
<![endif]-->
</head>

<body class="user-select">
<header class="header">
  <nav class="navbar navbar-default" id="navbar">
    <div class="container">
      <div class="header-topbar hidden-xs link-border">
        <ul class="site-nav topmenu">
          <li><a href="" rel="nofollow">友情链接</a></li>
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" rel="nofollow">关注本站 <span class="caret"></span></a>
            <ul class="dropdown-menu header-topbar-dropdown-menu">
            <li><a data-toggle="modal" data-target="#HuiFu" rel="nofollow"><i class="fa fa-weixin"></i>评论回复</a></li>
              <li><a data-toggle="modal" data-target="#WeChat" rel="nofollow"><i class="fa fa-weixin"></i> 微信</a></li>
              <li><a href="#" rel="nofollow"><i class="fa fa-weibo"></i> 微博</a></li>
              <li><a data-toggle="modal" data-target="#areDeveloping" rel="nofollow"><i class="fa fa-rss"></i> RSS</a></li>
            </ul>
          </li>
        </ul>
        <c:if test="${empty loginUser}">
        <a data-toggle="modal" data-target="#loginModal" class="login" rel="nofollow">Hi,请登录</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/userServlet?method=registerUI" class="register" rel="nofollow">我要注册</a>&nbsp;&nbsp;<a href="" rel="nofollow">找回密码</a> 
        </c:if>
        <c:if test="${not empty loginUser}">
         <a href="" style="color:red">欢迎您回来,[ ${loginUser.username} ]</a>&nbsp;&nbsp;<a href="javascript:;" style="color:red">个人中心</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/userServlet?method=logOut">退出</a>
        </c:if>
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar" aria-expanded="false"> <span class="sr-only"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <h1 class="logo hvr-bounce-in"><a href="" title=""><img src="${pageContext.request.contextPath}/images/logo2.png" alt=""></a></h1>
      </div>
      <div class="collapse navbar-collapse" id="header-navbar">
        <ul class="nav navbar-nav navbar-right">
          <li class="hidden-index active"><a data-cont="王一宁博客首页" href="${pageContext.request.contextPath}/indexServlet">博客首页</a></li>

        </ul>
        <form class="navbar-form visible-xs" action="/Search" method="post">
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
<section class="container container-page">
  <div class="pageside">
    <div class="pagemenus">
      <ul class="pagemenu">
 
        <li><a href="">读者墙</a></li>

      </ul>
    </div>
  </div>
  <div class="content">
    <header class="article-header">
      <h1 class="article-title">读者墙</h1>
    </header>
    <div class="readers"> <a class="item-readers item-readers-1" target="_blank" href="" rel="nofollow">
      <h4>【金牌读者】<small>评论：123</small></h4>
      <img class="avatar" height="36" width="36" src="${pageContext.request.contextPath}/images/icon/icon.png" alt=""><strong>王菲</strong>http://www.wyn-365.com/</a> <a class="item-readers item-readers-2" target="_blank" href="" rel="nofollow">
      <h4>【银牌读者】<small>评论：12</small></h4>
      <img class="avatar" height="36" width="36" src="${pageContext.request.contextPath}/images/icon/icon.png" alt=""><strong>张强</strong>http://www.wyn-365.com/</a> <a class="item-readers item-readers-3" target="_blank" href="" rel="nofollow">
      <h4>【铜牌读者】<small>评论：8</small></h4>
      <img class="avatar" height="36" width="36" src="${pageContext.request.contextPath}/images/icon/icon.png" alt=""><strong>王一喜</strong>http://www.wyn-365.com/</a> <a class="item-readers item-readers-4" target="_blank" href="" rel="nofollow">
      <h4>【普通读者】<small>评论：1</small></h4>
      <img class="avatar" height="36" width="36" src="${pageContext.request.contextPath}/images/icon/icon.png" alt=""><strong>黄晓小</strong>http://www.wyn-365.com/</a> </div>
  </div>
</section>
<footer class="footer">
  <div class="container">
    <p>&copy; 2019 <a href="">wyn-365@163.com</a> &nbsp; <a href="#" target="_blank" rel="nofollow"></a> &nbsp; &nbsp; <a href="http://www.wyn-365.com/" target="_blank">个人博客</a></p>
  </div>
  <div id="gotop"><a class="gotop"></a></div>
</footer>
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
  <div class="modal-dialog" role="document" style="margin-top:120px;width:280px;">
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
        <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问王一宁博客</li>
    <li class="list-group-item"><span>地址：</span>河南省郑州市</li>
    <li class="list-group-item"><span>系统：</span>Windows10 </li>
    <li class="list-group-item"><span>浏览器：</span>Chrome47</li>
  </ul>
</div>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.ias.js"></script> 
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>