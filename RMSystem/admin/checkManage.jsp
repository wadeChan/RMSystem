<%@page import="entity.Book"%>
<%@page import="DAO.IBookDAO"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
var msg = "${message}"
	if(msg!="")
	alert(msg);
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>审核管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet"  type="text/css" href="css/table.css"/>
<link rel="stylesheet" type="text/css" href="css/button.css"/>
</head>
<body>
<h2>Check Manage</h2>  
<table class="zebra">  
<thead>  
<tr>  
<th>序号</th>  
<th>书本ID</th>
<th>书名</th>
<th>出版社</th>
<th>类型</th>
<th>ISBN</th>  
<th>书描述</th>
<th>书链接</th>
<th>操作</th>
</tr>  
</thead>  
 <%
ApplicationContext context = new ClassPathXmlApplicationContext("bean-config.xml");
IBookDAO bookDAO = (IBookDAO)context.getBean("bookDAOProxy");
Book book = null;
int i = 1;
List list = bookDAO.adminFindAllChecking();
if(list!=null && !list.isEmpty()){
Iterator iterator = list.iterator();
while(iterator.hasNext()){
book = (Book)iterator.next();
 %>
<tr>  
<td><%out.print(i); %></td>  
<td><%out.print(book.getBookID()); %></td>  
<td><%out.print(book.getBookName()); %></td>
<td><%out.print(book.getBookPub().getPublisherName()); %></td>
<td><%out.print(book.getBookType().getTypeName()); %></td>
<td><%out.print(book.getBookISBN()); %></td>  
<td><%out.print(book.getBookDesc()); %></td>
<td><%out.print(book.getBookUrl()); %></td>
<td>
<a href="adminCheckSuccess?bookID=<%=book.getBookID() %>" class="button button-primary button-rounded button-small">通过</a>
<a href="adminCheckError?bookID=<%=book.getBookID() %>" class="button button-primary button-rounded button-small">不通过</a>
</td>
</tr>  
<%i++;
	}
 }else{%>
 <tr><td>一个人都没有</td></tr>
 <%
 }
 %>
</table>  
	
</body>
</html>
