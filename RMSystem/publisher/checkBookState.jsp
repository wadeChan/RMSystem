<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="entity.Book"%>
<%@page import="DAO.IBookDAO"%>
<%@page
	import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<base href="<%=basePath%>">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>审核</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/2-col-portfolio.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/table.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script type="text/javascript">
	function showMenu() {
		document.getElementById("menu").style.display = "block";
	}
	function hiddenMenu() {
		document.getElementById("menu").style.display = "none";
	}
	function check() {
	}
</script>
</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="publisherIndex.jsp">Home</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="publisherRegister.jsp">register</a></li>
				<li>
					<%
						Cookie[] cookies = request.getCookies();
						boolean flag = false;
						String cookieValue = null;
						if (cookies != null) {
							for (Cookie cookie : cookies) {
								if ("publisherID".equals(cookie.getName())) {
									out.print("<a href='javascript:void(0)' onmouseover='showMenu()' onmouseout='hiddenMenu()'>"
											+ cookie.getValue() + "</a>");
									flag = true;
									cookieValue = cookie.getValue();
								}
							}
						}
						if (flag == false) {
							out.print("<a href='publisherLogin.jsp' >log on</a>");
							ActionContext ac = ActionContext.getContext();
        					ac.put("message","请先登录或注册");
        					request.getRequestDispatcher("publisherLogin.jsp").forward(request, response);
						}
					%>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div></nav>
	 <div id="menu" style="display:none;" onmouseover="showMenu()" onmouseout="hiddenMenu()">
                   <a href="javascript:void(0)" >userInfo</a>
                   <a href="deletePubCookie" >exit</a>
      </div>
	<!-- /.container -->
	<ul style="list-style:none;">
	<li><a href="willCheckBook.jsp" target="showFrame" class="button button-highlight button-rounded button-large">未审核</a></li>
	<li><a href="checkingBook.jsp" target="showFrame" class="button button-highlight button-rounded button-large">审核中</a></li>
	<li><a href="checkedBook.jsp" target="showFrame" class="button button-highlight button-rounded button-large">已审核</a></li>
	</ul>
<div class="container">
 <iframe name="showFrame" frameborder="0" width=100% height=100%></iframe>
</div>
	<!-- /.container -->
	<!-- jQuery -->
	<script src="../js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
