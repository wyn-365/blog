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
<title>王一宁博客</title>

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

     <script type="text/javascript">
        //点击切换验证码
        function refreshCode() {
            //获取
            var vcode = document.getElementById("vcode");

            //设置时间捉 和图片路径
            vcode.src="${pageContext.request.contextPath}/checkCodeServlet?time="+new Date().getTime();

        }
    </script>

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
          
             <li><a data-toggle="modal" data-target="#HuiFu" rel="nofollow"><i class="fa fa-weixin"></i>评论回复</a></li>
           
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
     	
     
      <div class="collapse navbar-collapse" id="header-navbar">
        <ul class="nav navbar-nav navbar-right">
        
        <li class="hidden-index active"><h1 class="logo hvr-bounce-in"><a href="" title=""><img src="${pageContext.request.contextPath}/images/logo2.png" ></a></h1></li>
          <li class="hidden-index active"><a data-cont="首页" href="${pageContext.request.contextPath}/indexServlet">博客首页</a></li>
        
         <c:forEach items="${allCats}" end="8" var="a">
          <li><a href="${pageContext.request.contextPath}/blogInfoServlet?method=findAllBlog&num=1&cid=${a.cid}">${a.cname}</a></li>
        </c:forEach>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:red">
                                      查看更多 
               <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
        	      <c:forEach items="${allCats}" begin="9" var="a">
        			  <li><a href="${pageContext.request.contextPath}/blogInfoServlet?method=findAllBlog&num=1&cid=${a.cid}">${a.cname}</a></li>
       			 </c:forEach>
            </ul>
         </li>
      
        </ul>
        <!-- 模糊查询 -->
        <form class="navbar-form visible-xs" action="${pageContext.request.contextPath}/findProductServlet" method="post">
          <div class="input-group">
            <input type="text" name="title" value="${condition.title[0]}"  class="form-control" placeholder="请输入关键字" maxlength="20" autocomplete="off">
            <span class="input-group-btn">
            <button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
            </span> </div>
        </form>
        
      </div>
    </div>
  </nav>
</header>
<section class="container">
  <div class="content-wrap">
    <div class="content">
      <div class="jumbotron">
        <h1>欢迎访问王一宁博客</h1>
        <p>在这里可以看到前端技术，后端程序，网站内容管理系统等文章，还有我的程序人生！</p>
      </div>
      <div id="focusslide" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#focusslide" data-slide-to="0" class="active"></li>
          <li data-target="#focusslide" data-slide-to="1"></li>
          <li data-target="#focusslide" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="item active"> <a href="" target="_blank"><img src="${pageContext.request.contextPath}/images/banner/banner4.png" alt="" class="img-responsive"></a> 
            <!--<div class="carousel-caption"> </div>--> 
          </div>
          <div class="item"> <a href="" target="_blank"><img src="${pageContext.request.contextPath}/images/banner/banner2.png" alt="" class="img-responsive"></a> 
            <!--<div class="carousel-caption"> </div>--> 
          </div>
          <div class="item"> <a href="" target="_blank"><img src="${pageContext.request.contextPath}/images/banner/banner7.png" alt="" class="img-responsive"></a> 
            <!--<div class="carousel-caption"> </div>--> 
          </div>
        </div>
        <a class="left carousel-control" href="#focusslide" role="button" data-slide="prev" rel="nofollow"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">上一个</span> </a> <a class="right carousel-control" href="#focusslide" role="button" data-slide="next" rel="nofollow"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">下一个</span> </a> </div>
      
      <article class="excerpt-minic excerpt-minic-index">
        <h2><span class="red">【今日推荐】</span><a href="" title="">${everyday.title}</a></h2>
        <p class="note" style="color:green">${everyday.content}</p>
      </article>
      
      
      <div class="title">
        <h3 style="color:lime;">【最新发布】</h3>
        <div class="more"><a href="">PHP</a><a href="">JavaScript</a><a href="">EmpireCMS</a><a href="">Apache</a><a href="">MySQL</a></div>
      </div>
     
      <c:forEach items="${news}" var="n">
      
	      <article  class="excerpt excerpt-1" style="height:200px">
	      
	      <a class="focus" href="${pageContext.request.contextPath}/blogInfoServlet?method=blogInfo&id=${n.id}" title=""><img class="thumb" data-original="${pageContext.request.contextPath}/${n.bimage}" src="${pageContext.request.contextPath}/${n.bimage}" alt=""></a>
	        <header><a class="cat" href="${pageContext.request.contextPath}/blogInfoServlet?method=blogInfo&id=${n.id}">学习讨论<i></i></a>
	          <h2><a href="${pageContext.request.contextPath}/blogInfoServlet?method=blogInfo&id=${n.id}" title="">${n.title}</a></h2>
	        </header>
	        <p class="meta">
	          <time class="time" style="color:red"><i class="glyphicon glyphicon-time" style="color:red"></i> ${n.bdate}</time>
	          <span class="views" style="color:blue"><i class="glyphicon glyphicon-eye-open" style="color:blue"></i> 共${n.browse}人围观</span> <a class="comment" href="${pageContext.request.contextPath}/blogInfoServlet?method=blogInfo&id=${n.id}" style="color:green"><i class="glyphicon glyphicon-comment" style="color:green"></i> ${n.bcomment}条评论</a></p>
	        <p class="note" style="color:black;">${n.content}</p>
	      </article>
	 
      </c:forEach>
      
      <nav class="pagination" style="display: none;">
        <ul>
          <li class="prev-page"></li>
          <li class="active"><span>1</span></li>
          <li><a href="?page=2">2</a></li>
          <li class="next-page"><a href="?page=2">下一页</a></li>
          <li><span>共 2 页</span></li>
        </ul>
      </nav>
    </div>
  </div>
  <aside class="sidebar">
    <div class="fixed">
      <div class="widget widget-tabs">
        <ul class="nav nav-tabs" role="tablist">
          <li role="presentation" class="active"><a href="#notice" aria-controls="notice" role="tab" data-toggle="tab">网站公告</a></li>
          <c:if test="${empty loginUser}">
          <li role="presentation"><a href="#centre" aria-controls="centre" role="tab" data-toggle="tab">会员中心</a></li>
          </c:if>
          <li role="presentation"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab">联系站长</a></li>
        <li role="presentation"><a href="#contact2" aria-controls="contact2" role="tab" data-toggle="tab">联系QQ</a></li>
        </ul>
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane notice active" id="notice">
            <ul>
            <c:forEach items="${gonggao}" var="g" varStatus="v">
              <li>
                <time datetime="">${g.title}</time>
                <a href="" target="_blank" title="${g.title}" style="color:blue">${v.count}->${g.content}</a>
              </li>
            </c:forEach>  
            </ul>
          </div>
          <div role="tabpanel" class="tab-pane centre" id="centre">
            <h4>需要登录才能进入会员中心</h4>
            <p> <a data-toggle="modal" data-target="#loginModal" class="btn btn-primary">立即登录</a> <a href="${pageContext.request.contextPath}/userServlet?method=registerUI" class="btn btn-default">现在注册</a> </p>
          </div>
          <div role="tabpanel" class="tab-pane contact" id="contact">
            <h2>Email:<br />
              <a href="mailto:wyn-365@163.com" data-toggle="tooltip" data-placement="bottom" title="wyn-365@163.com">wyn-365@163.com</a></h2>
          </div>
          
          <div role="tabpanel" class="tab-pane contact" id="contact2">	
             <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1506773471&site=qq&menu=yes"><img alt="" src="${pageContext.request.contextPath}/images/qq.jpg" width="60px" height="60px"> QQ	</a>
         	 <a data-toggle="modal" data-target="#WeChat" rel="nofollow"> <img alt="" src="${pageContext.request.contextPath}/images/wei.jpg" width="50px" height="50px">微信</a>
          
          </div>
         
          
          
        </div>
      </div>
      <div class="widget widget_search">
        <form class="navbar-form" action="${pageContext.request.contextPath}/findProductServlet" method="post">
          <div class="input-group">
            <input type="text" name="title" value="${condition.title[0]}" class="form-control" size="35" placeholder="请输入关键字" maxlength="15" autocomplete="off">
            <span class="input-group-btn">
            <button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
            </span> </div>
        </form>
      </div>
    </div>
    <div class="widget widget_sentence">
      <h3 style="color:blue;">【每日一句】</h3>
      <div class="widget-sentence-content">
        <h4>${everyday.etitle}</h4>
        <p style="color:green">${everyday.econtent}</p>
      </div>
    </div>
    
    <div class="widget widget_hot">
      <h3 style="color:red">【1-热门文章】</h3>
      <ul>
      <c:forEach items="${hots}" var="h">
        <li><a href="${pageContext.request.contextPath}/blogInfoServlet?method=blogInfo&id=${h.id}"><span class="thumbnail"><img class="thumb" data-original="${pageContext.request.contextPath}/${h.bimage}" src="${pageContext.request.contextPath}/${h.bimage}" alt=""></span><span class="text">${h.title}</span><span class="muted" style="color:red"><i class="glyphicon glyphicon-time" style="color:red"></i> ${h.bdate} </span><span class="muted" style="color:blue"><i class="glyphicon glyphicon-eye-open" style="color:blue"></i> ${h.browse}</span></a></li>
      </c:forEach> 
      </ul>
    </div>
    
     <div class="widget widget_hot">
      <h3 style="color:red">【2-点击排行】</h3>
      <ul>
      <c:forEach items="${paihang}" var="p">
        <li><a href="${pageContext.request.contextPath}/blogInfoServlet?method=blogInfo&id=${p.id}"><span class="thumbnail"><img class="thumb" data-original="${pageContext.request.contextPath}/${p.bimage}" src="${pageContext.request.contextPath}/${p.bimage}" alt=""></span><span class="text">${p.title}</span><span class="muted" style="color:red"><i class="glyphicon glyphicon-time" style="color:red"></i> ${p.bdate} </span><span class="muted" style="color:blue"><i class="glyphicon glyphicon-eye-open" style="color:blue"></i> ${p.browse}</span></a></li>
      </c:forEach> 
      </ul>
    </div>
    
    <div class="widget widget_hot">
      <h3 style="color:red">【3-站长推荐】</h3>
      <ul>
      <c:forEach items="${tuijian}" var="t">
        <li><a href="${pageContext.request.contextPath}/blogInfoServlet?method=blogInfo&id=${t.id}"><span class="thumbnail"><img class="thumb" data-original="${pageContext.request.contextPath}/${t.bimage}" src="${pageContext.request.contextPath}/${t.bimage}" alt=""></span><span class="text">${t.title}</span><span class="muted" style="color:red"><i class="glyphicon glyphicon-time" style="color:red"></i> ${t.bdate} </span><span class="muted" style="color:blue"><i class="glyphicon glyphicon-comment" style="color:green"></i> ${t.bcomment}</span></a></li>
      </c:forEach> 
      </ul>
    </div>

  </aside>
 
</section>
<footer class="footer">
  <div class="container">
    <p>&copy; 2019 <a href="">www.wyn-365.com</a> &nbsp; <a href="#" target="_blank" rel="nofollow">联系电话：18333603843</a> &nbsp; &nbsp; <a href="http://www.wyn-365.com/" target="_blank">个人博客</a></p>
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
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">点击QQ图像联系我…</h4>
      </div>
      <div class="modal-body">
          <div class="modal-body" style="text-align:center">  <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1506773471&site=qq&menu=yes"><img alt="" src="${pageContext.request.contextPath}/images/qq.jpg" width="100px" height="100px"></a> </div>
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