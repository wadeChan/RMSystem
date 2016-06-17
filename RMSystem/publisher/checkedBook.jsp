<%@page import="entity.Book"%>
<%@page import="DAO.IBookDAO"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
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
    <title>已审核</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/2-col-portfolio.css" rel="stylesheet">
    <link rel="stylesheet"  type="text/css" href="../css/table.css"/>
<link rel="stylesheet" type="text/css" href="../css/button.css"/>
</head>
  <body>
<!-- Page Content -->
<div class="container">
 <table class="zebra">  
<thead>  
<tr>  
<th>序号</th>  
<th>书本ID</th>
<th>书名</th>  
<th>ISBN</th>
<th>链接</th>
<th>审核状态</th>
<th>操作</th> 
</tr>  
</thead>  
<%
Cookie[] cookies = request.getCookies();
    	boolean flag = false;
    	String cookieValue=null;
    	if(cookies!=null){
    	for(Cookie cookie : cookies)
        {
        	if("publisherID".equals(cookie.getName()))
        	{
        		flag = true;
        		cookieValue=cookie.getValue();
        	}			
        }
       }
if(cookieValue!=null){
ApplicationContext context = new ClassPathXmlApplicationContext("bean-config.xml");
IBookDAO bookDAO = (IBookDAO)context.getBean("bookDAOProxy");
Book book = null;
int i = 1;
List list = bookDAO.findAllChecked(cookieValue); 
if(list!=null && !list.isEmpty()){
Iterator iterator = list.iterator();
while(iterator.hasNext()){
book = (Book)iterator.next();
 %>
<tr>  
<td><%out.print(i); %></td>  
<td><%out.print(book.getBookID()); %></td>  
<td><%out.print(book.getBookName()); %></td>  
<td><%out.print(book.getBookISBN()); %></td>
<td><%out.print(book.getBookUrl()); %></td>
<%if(book.getBookState()==2){ %>
<td style="color:#ee0000;">审核完成</td>
<td>
<a href="downCheckBook?bookID=<%=book.getBookID() %>" class="button button-primary button-rounded button-small">下架</a>
</td><%}else{ %>
	<td style="color:#eeaa00;">审核失败</td>
	<td>
	<a href="reCheckBook?bookID=<%=book.getBookID() %>"  class="button button-primary button-rounded button-small">重新审核</a>
	</td>
<%} %>
</tr>  
<%
	}
 }else{%>
 <tr><td>没有已审核完成的书本</td></tr>
 <%
 }
 %>
 <%
 }else{ %>
 <tr><td>Cookie已失效请先登录</td></tr>
 <%} %>
</table>  
	
    <!-- /.container -->

    <!-- jQuery -->
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>
