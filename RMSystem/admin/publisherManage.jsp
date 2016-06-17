<%@page import="entity.Publisher"%>
<%@page import="DAO.IPublisherDAO"%>
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
<title>出版社管理</title>
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
<h2>Publisher Manage</h2>  
<table class="zebra">  
<thead>  
<tr>  
<th>序号</th>  
<th>出版社ID</th>
<th>出版社名</th>
<th>密码</th>  
<th>邮箱</th>
<th>操作</th>  
</tr>  
</thead>  
 <%
ApplicationContext context = new ClassPathXmlApplicationContext("bean-config.xml");
IPublisherDAO publisherDAO = (IPublisherDAO)context.getBean("publisherDAOProxy");
Publisher publisher = null;
int i = 1;
List list = publisherDAO.findAll();
if(list!=null && !list.isEmpty()){
Iterator iterator = list.iterator();
while(iterator.hasNext()){
publisher = (Publisher)iterator.next();
 %>
<tr>  
<td><%out.print(i); %></td>  
<td><%out.print(publisher.getPublisherID()); %></td>  
<td><%out.print(publisher.getPublisherName()); %></td>
<td><%out.print(publisher.getPassword()); %></td>  
<td><%out.print(publisher.getEmail()); %></td>
<td>
<a href="deletePublisher?publisherID=<%=publisher.getPublisherID() %>" class="button button-primary button-rounded button-small">删除</a>
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
