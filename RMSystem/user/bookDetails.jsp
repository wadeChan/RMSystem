<%@page import="entity.Comment"%>
<%@page import="DAO.ICommentDAO"%>
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
<%
	String bookID = request.getParameter("bookID");
ApplicationContext context = new ClassPathXmlApplicationContext("bean-config.xml");
IBookDAO bookDAO = (IBookDAO)context.getBean("bookDAOProxy");
ICommentDAO commentDAO = (ICommentDAO)context.getBean("commentDAOProxy");
Book book = bookDAO.getById(bookID);
String IMGROOT = "http://localhost/RMSystem/images/";
String URLROOT = "http://localhost/RMSystem/library/";
String imgLocation = IMGROOT+book.getBookImgUrl();
String readonline = URLROOT+book.getBookUrl();
%>
<base href="<%=basePath%>">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript">
var msg = "${message}"
	if(msg!="")
	alert(msg);
</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>书本详情</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/blog-post.css" rel="stylesheet">
<link href="../css/button.css" rel="stylesheet">
<script type="text/javascript">
	function showMenu() {
		document.getElementById("menu").style.display = "block";
	}
	function hiddenMenu() {
		document.getElementById("menu").style.display = "none";
	}
</script>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="../index.jsp">Home</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="userRegister.jsp">register</a></li>
				<li>
					<%
						Cookie[] cookies = request.getCookies();
						String userID = null;
						boolean flag = false;
						if (cookies != null) {
							for (Cookie cookie : cookies) {
								if ("userID".equals(cookie.getName())) {
									userID = cookie.getValue();
									out.print("<a href='javascript:void(0)' onmouseover='showMenu()' onmouseout='hiddenMenu()'>"
											+ cookie.getValue() + "</a>");
									flag = true;
								}
							}
						}
						if (flag == false) {
							out.print("<a href='userLogin.jsp' >log on</a>");
						}
					%>
				</li>
			</ul>
		</div>
	</div>
	<!-- /.container --> </nav>
	<div id="menu" style="display:none;" onmouseover="showMenu()"
		onmouseout="hiddenMenu()">
		<a href="javascript:void(0)">userInfo</a> 
		<a href="showFavorite.jsp">favorite</a>
		 <a href="deleteUserCookie">exit</a>
	</div>
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<!-- Blog Post Content Column -->
			<div class="col-lg-8">
				<h1><%=book.getBookName()%></h1>
				<p class="lead">
					from
					<%=book.getBookPub().getPublisherName()%></a>
				</p>
				<hr>
				<!-- Preview Image -->
				<img class="img-responsive" src="<%=imgLocation %>">
				<hr>
				<!-- Post Content -->
				<p class="lead">本书介绍</p>
				<p><%=book.getBookDesc()%></p>
				<hr>
				<!-- Blog Comments -->
				<!-- Comments Form -->
				<div class="well">
					<h4>Leave a Comment:</h4>
					<form method="POST" action="addComment">
						<div class="form-group">
							<input type="hidden" name="bookID" value="<%=bookID%>" /> <input
								type="hidden" name="userID" value="<%=userID%>" />
							<textarea class="form-control" rows="3" name="comm"></textarea>
						</div>
						<button type="submit" class="btn btn-primary">评论</button>
					</form>
				</div>
				<hr>
				<!-- Posted Comments -->
				<!-- Comment -->
				<%
					List commentList = commentDAO.findAllCommentOfBook(bookID);
					if (commentList != null && !commentList.isEmpty()) {
						Iterator iterator = commentList.iterator();
						while (iterator.hasNext()) {
							Comment comment = (Comment) iterator.next();
				%>
				<div class="media">
					<a class="pull-left" href="#"> <img class="media-object"
						src="../images/user2.png" alt="">
					</a>
					<div class="media-body">
						<h4 class="media-heading">
							&nbsp;&nbsp;&nbsp;<%=comment.getContent()%>
						</h4>
					</div>
				</div>
				用户:<%=comment.getcUser().getUserID()%>
				<%
					}
					}
				%>
				<!-- End Nested Comment -->

			</div>
			<!-- Blog Sidebar Widgets Column -->
			<div class="col-md-4">
				<!-- Blog Search Well -->
				<div class="well">
					<div class="input-group">
						<a href="intoFavorite?bookID=<%=bookID%>&userID=<%=userID%>"
							class="button button-highlight button-rounded button-large">添加到收藏夹</a>
					</div>
					<!-- /.input-group -->
				</div>
				<div class="well">
					<div class="input-group">
						<a href="<%=readonline%>"
							class="button button-highlight button-rounded button-large">免费在线阅读</a>
					</div>
					<!-- /.input-group -->
				</div>
			</div>
		</div>
		<!-- /.row -->
		<hr>
	</div>
	<!-- /.container -->
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
