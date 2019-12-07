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
<title>管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/login.css">
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/admin/images/icon/icon.png">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/icon/icon.png">
<script src="${pageContext.request.contextPath}/admin/js/jquery-2.1.4.min.js"></script>
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
<div class="container">
  <div class="siteIcon"><img src="${pageContext.request.contextPath}/images/icon/icon.png" alt="" data-toggle="tooltip" data-placement="top" title="我若盛开，清风爱来不来！" draggable="false" /></div>
 
  <form action="${pageContext.request.contextPath}/adminUserServlet?method=login" method="post" autocomplete="off" class="form-signin">
    <h2 class="form-signin-heading">管理员登录</h2>
    <p style="color:red">${msg}</p>
    <label for="userName" class="sr-only">账户</label>
    <input type="text" id="userName" name="username" class="form-control" placeholder="输入账号" required autofocus autocomplete="off" maxlength="10">
    <label for="userPwd" class="sr-only">密码</label>
    <input type="password" id="userPwd" name="password" class="form-control" placeholder="输入密码 " required autocomplete="off" maxlength="15">
     <input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="请输入验证码" style="width: 300px;"/> 
          <a href="javascript:refreshCode();">
	<img src="${pageContext.request.contextPath}/checkCodeServlet" title="看不清点击刷新" id="vcode"/>
		 </a>
   
   <button class="btn btn-lg btn-primary btn-block" type="submit" id="signinSubmit">登录</button>
  </form>
  <div class="footer">
    <p><a href="${pageContext.request.contextPath}/indexServlet" data-toggle="tooltip" data-placement="left" title="美女帅哥，没事别来这，去首页。">你不会走丢了吧？</a></p>
  </div>
</div>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script> 
<script>
$('[data-toggle="tooltip"]').tooltip();
window.oncontextmenu = function(){
	//return false;
};
$('.siteIcon img').click(function(){
	window.location.reload();
});
$('#signinSubmit').click(function(){
	if($('#userName').val() === ''){
		$(this).text('ç¨æ·åä¸è½ä¸ºç©º');
	}else if($('#userPwd').val() === ''){
		$(this).text('å¯ç ä¸è½ä¸ºç©º');
	}else{
		$(this).text('登录中...');
	}
});
</script>
</body>
</html>
