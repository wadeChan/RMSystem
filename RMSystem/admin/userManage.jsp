<%@page import="entity.User"%>
<%@page import="DAO.IUserDAO"%>
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
<title>用户管理</title>
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
<h2>User Manage</h2>  
<table class="zebra">  
<thead>  
<tr>  
<th>序号</th>  
<th>用户名</th>
<th>密码</th>  
<th>联系QQ</th>
<th>邮箱</th>
<th>操作</th>  
</tr>  
</thead>  
 <%
ApplicationContext context = new ClassPathXmlApplicationContext("bean-config.xml");
IUserDAO userDAO = (IUserDAO)context.getBean("userDAOProxy");
User user = null;
int i = 1;
List list = userDAO.findAll();
if(list!=null && !list.isEmpty()){
Iterator iterator = list.iterator();
while(iterator.hasNext()){
user = (User)iterator.next();
 %>
<tr>  
<td><%out.print(i); %></td>  
<td><%out.print(user.getUserID()); %></td>  
<td><%out.print(user.getPassword()); %></td>  
<td><%out.print(user.getQq()); %></td>
<td><%out.print(user.getEmail()); %></td>
<td>
<a href="deleteUser?userID=<%=user.getUserID() %>" class="button button-primary button-rounded button-small">删除</a>
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
