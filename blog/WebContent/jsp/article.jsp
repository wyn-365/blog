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
<title>博客文章页面</title>
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

<body class="user-select single">
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
        <form class="navbar-form visible-xs" action="${pageContext.request.contextPath}/findProductServlet" method="post">
          <div class="input-group">
            <input type="text" name="title" value="${condition.title[0]}" class="form-control" placeholder="请输入关键字" maxlength="20" autocomplete="off">
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
      <header class="article-header">
        <h1 class="article-title"><a href="article.html">${blog.title}</a></h1>
        <div class="article-meta"> <span class="item article-meta-time">
          <time class="time" data-toggle="tooltip" data-placement="bottom" title="时间：${blog.bdate}" style="color:red"><i class="glyphicon glyphicon-time" style="color:red"></i> ${blog.bdate}</time>
          </span> <span class="item article-meta-source" data-toggle="tooltip" data-placement="bottom" title="来源：${blog.cid}" style="color:red"><i class="glyphicon glyphicon-globe" style="color:red"></i> ${blog.cid}</span> <span class="item article-meta-category" data-toggle="tooltip" data-placement="bottom" title="栏目：后端程序" style="color:blue"><i class="glyphicon glyphicon-list" style="color:blue"></i> <a href="" title="">后端程序</a></span> <span class="item article-meta-views" data-toggle="tooltip" data-placement="bottom" title="查看：${blog.browse}" style="color:blue"><i class="glyphicon glyphicon-eye-open" style="color:blue"></i> 共${blog.browse}人围观</span> <span class="item article-meta-comment" data-toggle="tooltip" data-placement="bottom" title="评论：${blog.bcomment}" style="color:green"><i class="glyphicon glyphicon-comment" style="color:green"></i> ${blog.bcomment}个不明物体</span> </div>
      </header>
      <article class="article-content">
        <p><img data-original="${pageContext.request.contextPath}/${blog.bimage}" src="${pageContext.request.contextPath}/${blog.bimage}" alt="" /></p>
        <p style="color:red"> 详细实现信息或源码如下： </p>
        <pre class="prettyprint lang-php">
 		${blog.content}
 
         </pre>
        <p> ${blog.content} </p>
        
        <p class="article-copyright hidden-xs">未经允许不得转载：<a href="">王一宁个人博客</a> » <a href="">${blog.title}</a></p>
      </article>
      <div class="article-tags">标签：<a href="" rel="tag">PHP</a></div>

      <div class="title" id="comment">
        <h3>评论 <small>抢沙发</small></h3>
      </div>
 
      <div id="respond">
       
          <div class="comment">
            <div class="comment-title"><img class="avatar" src="${pageContext.request.contextPath}/images/icon/icon.png" alt="" /></div>
            
         <form  role="form" action="${pageContext.request.contextPath}/blogInfoServlet?method=writeComment" method="post">
            <div class="form-group" class="comment-box">
              <textarea class="form-control" placeholder="自古人才出评论（可未登录状态评论）" name="content"  cols="100%" rows="3" tabindex="1" style="border-color: green" required></textarea>
               <input class="form-control" type="hidden" name="uname" value="${loginUser.name}"/>
                <input class="form-control" type="hidden" name="uid" value="${loginUser.uid}"/>
                <input class="form-control" type="hidden" name="ccid" value="${blog.id}"/>  
                <button class="form-control btn-success" type="submit" >评论</button>
           </div>
           
        </form>
                
          </div>
          
      
        
      </div>
      
      <div id="postcomments">
      
      
        <ol class="commentlist">
        <c:forEach items="${comment}" var="c" varStatus="v">
          <li class="comment-content">
            <div class="comment-avatar"><img class="avatar" src="${pageContext.request.contextPath}/images/icon/icon.png" alt="" /></div>
            <div class="comment-main">
            <span class="comment-f" style="color:red">#${v.count}楼</span>
            
              <c:if test="${not empty c.name}">
              <p>来自<span class="address">${c.name}</span>的用户
                </c:if>
                
                <c:if test="${empty c.name}">
              <p>来自<span class="address">未登录</span>的用户
                </c:if>
                
              
                
              <span class="time" style="color:red">${c.cdate}</span><br/>
                <h5 style="color:green">${c.content}</h5>
                <!-- 博主回复 -->
             <span class="address" style="color:blue">博主</span>回复：${c.rcomment} 
              
            </div>
          </li>
        </c:forEach>
        </ol>
        
        
        <div class="quotes"><span class="disabled">首页</span><span class="disabled">上一页</span><a class="current">1</a><a href="">2</a><span class="disabled">下一页</span><span class="disabled">尾页</span></div>
      </div>
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
            <p> <a href="javascript:;" class="btn btn-primary">立即登录</a> <a href="${pageContext.request.contextPath}/userServlet?method=registerUI" class="btn btn-default">现在注册</a> </p>
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
      <h3 style="color:blue">【每日一句】</h3>
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
    <p>&copy; 2019 <a href="">wyn-365@163.com</a> &nbsp; <a href="#" target="_blank" rel="nofollow">联系电话：18333603843</a> &nbsp; &nbsp; <a href="http://www.wyn-365.com/" target="_blank">个人博客</a></p>
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
    <li class="list-group-item"><span>系统：</span>Windows10</li>
    <li class="list-group-item"><span>浏览器：</span>Chrome47</li>
  </ul>
</div>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.ias.js"></script> 
<script src="${pageContext.request.contextPath}/js/scripts.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.qqFace.js"></script> 

</body>
</html>