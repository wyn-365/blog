<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nprogress.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/images/icon/icon.png">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/icon/icon.png">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/nprogress.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.lazyload.min.js"></script>

</head>

	<%--分页显示的开始 --%>
	<br>
    	<div class="quotes">
    		<p style="color: blue;font-size: 15px">一共有${page.totalPageNum}页/第${page.currentPageNum}页</p>
    		<br>
    		<a href="${pageContext.request.contextPath}/${page.url}&num=1" class="disabled" style="font-size: 18px">首页</a>
    		
    		<a href="${pageContext.request.contextPath}/${page.url}&num=${page.prePageNum}" style="color: green;font-size: 18px">上一页</a>
    		<%--显示的页码，使用forEach遍历显示的页面 --%>
    		<c:forEach begin="${page.startPage}" end="${page.endPage}" var="pagenum">
    			<a href="${pageContext.request.contextPath}/${page.url}&num=${pagenum}" style="color: green;font-size: 18px">${pagenum}</a>
    		</c:forEach>
    		
    		<a href="${pageContext.request.contextPath}/${page.url}&num=${page.nextPageNum}" style="color: green;font-size: 18px">下一页</a>
    		<a href="${pageContext.request.contextPath}/${page.url}&num=${page.totalPageNum}" style="color: green;font-size: 18px">末页</a>
    		<input type="text" id="pagenum" name="pagenum" size="3"/><input type="button" value="前往" onclick="jump()" />
    		<script type="text/javascript">
    			function jump(){
    				var totalpage = ${page.totalPageNum};
    				var pagenum = document.getElementById("pagenum").value;
    				//判断输入的是一个数字
    				var reg =/^[1-9][0-9]{0,1}$/;
    				if(!reg.test(pagenum)){
    					//不是一个有效数字
    					alert("请输入符合规定的数字");
    					return ;
    				}
    				//判断输入的数字不能大于总页数
    				if(parseInt(pagenum)>parseInt(totalpage)){
    					//超过了总页数
    					alert("不能大于总页数");
    					return;
    				}
    				//转向分页显示的Servlet
    				window.location.href="${pageContext.request.contextPath}/${page.url}&num="+pagenum;
    			}
    		</script>
    	</div>
    	<%--分页显示的结束--%>
