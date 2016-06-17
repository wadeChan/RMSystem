<%@page import="entity.Comment"%>
<%@page import="DAO.ICommentDAO"%>
<%@page import="entity.Comment"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="DAO.ICommentDAO"%>
<%@page import="DAO.CommentDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
var msg = "${message}"
	if(msg!="")
	alert(msg);
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>书评管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet"  comment="text/css" href="css/table.css"/>
<link rel="stylesheet" comment="text/css" href="css/button.css"/>
</head>
<body>
<h2>All Comment</h2>  
<table class="zebra">  
<thead>  
<tr>  
<th>序号</th>  
<th>书评ID</th>
<th>审核状态</th>  
<th>内容</th>
<th>用户ID</th>
<th>书本ID</th>
<th>书本名</th>
<th>操作</th> 
</tr>  
</thead>  
<%
		ApplicationContext context = new ClassPathXmlApplicationContext("bean-config.xml");
		ICommentDAO commentDAO = (ICommentDAO)context.getBean("commentDAOProxy"); 
			List commentList = commentDAO.findAllUncheck(); 
			Iterator iterator = commentList.iterator();
			int i=1;
			while(iterator.hasNext())
			{
			Comment comment = (Comment)iterator.next();
		 %>
<tr>  
<td><% out.print(i); %></td>  
<td><%out.print(comment.getCommentID()); %></td>  
<td>未审核</td>  
<td><%out.print(comment.getContent()); %></td>
<td><%out.print(comment.getcUser().getUserID()); %></td>
<td><%out.print(comment.getcBook().getBookID()); %></td>
<td><%out.print(comment.getcBook().getBookName()); %></td>
<td>
<a href="passComment?commentID=<%=comment.getCommentID()%>"  class="button button-primary button-rounded button-small">通过</a>
<a href="deleteComment?commentID=<%=comment.getCommentID()%>"  class="button button-primary button-rounded button-small">删除</a>
</td>
</tr>  
<%
	i++;} 
	%>
</table>  
</body>
</html>