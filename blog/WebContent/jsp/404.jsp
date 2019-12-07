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
<title>${msg}</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nprogress.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/icon/icon.png">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/icon/favicon.ico">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/nprogress.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.lazyload.min.js"></script>

<style type="text/css">
.panel{
	padding:80px 20px 0px;
	min-height:500px;
	cursor:default;
}
.text-center {
	margin:0 auto;
    text-align: center;
	border-radius:10px;
	max-width:900px;
	-moz-box-shadow: 0px 0px 5px rgba(0,0,0,.3);
	-webkit-box-shadow: 0px 0px 5px rgba(0,0,0,.3);
	box-shadow: 0px 0px 5px rgba(0,0,0,.1);
	
}
.float-left {
    float: left !important;
}
.float-right {
    float: right !important;
}
img {
    border: 0;
    vertical-align: bottom;
}
h2 {
    padding-top: 20px;
	font-size: 20px;
}
.padding-big {
    padding: 20px;
}
.alert {
    border-radius: 5px;
    padding: 15px;
    border: solid 1px #ddd;
    background-color: #f5f5f5;
}
</style>
</head>

<body class="user-select">
<header class="header">
  <nav class="navbar navbar-default" id="navbar">
    <div class="container">
      <div class="header-topbar hidden-xs link-border">
        <ul class="site-nav topmenu">
          <li><a href="${pageContext.request.contextPath}/userServlet?method=paihang" rel="nofollow">读者墙</a></li>
          <li><a href="" rel="nofollow">友情链接</a></li>
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" rel="nofollow">关注本站 <span class="caret"></span></a>
            <ul class="dropdown-menu header-topbar-dropdown-menu">
              <li><a data-toggle="modal" data-target="#WeChat" rel="nofollow"><i class="fa fa-weixin"></i> 微信</a></li>
              <li><a href="#" rel="nofollow"><i class="fa fa-weibo"></i> 微博</a></li>
              <li><a data-toggle="modal" data-target="#areDeveloping" rel="nofollow"><i class="fa fa-rss"></i> QQ</a></li>
            </ul>
          </li>
        </ul>
        <c:if test="${empty loginUser}">
        <a data-toggle="modal" data-target="#loginModal" class="login" rel="nofollow">Hi,请登录</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/userServlet?method=registerUI" class="register" rel="nofollow">我要注册</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/adminUserServlet?method=loginUI" rel="nofollow">管理员</a> 
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
    
      </div>
    </div>
  </nav>
</header>
<section class="container">
  <div class="panel">
    <div class="text-center">
      <h2><stong>很抱歉，${msg}</stong></h2>
      <div>
        <div class="float-left"> <img src="images/404/left.gif" alt="" />
          <div class="alert"> 卧槽！页面不见了！ </div>
        </div>
        <div class="float-right"> <img src="images/404/right.png" width="260" class="hidden-xs" alt="" /> </div>
      </div>
      <div class="padding-big"> <a href="${pageContext.request.contextPath}/indexServlet" class="btn btn-primary">返回首页</a> <a href="${pageContext.request.contextPath}/indexServlet" class="btn btn-default">保证不打死管理员</a> </div>
    </div>
  </div>
</section>
<footer class="footer">
  <div class="container">
    <p>&copy; 2019 <a href="">wyn-365.com</a> &nbsp; <a href="#" target="_blank" rel="nofollow"></a> &nbsp; &nbsp; <a href="http://www.wyn-365.com/" target="_blank">博客</a></p>
  </div>
  <div id="gotop"><a class="gotop"></a></div>
</footer>
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
      <div class="modal-body">
        <img src="images/baoman/baoman_01.gif" alt="深思熟虑" /><p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问王一宁个人博客</li>
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