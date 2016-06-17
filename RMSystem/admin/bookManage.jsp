<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet"  type="text/css" href="css/table.css"/>
<link rel="stylesheet" type="text/css" href="css/button.css"/>
</head>
<body>
<h2>Book Manage</h2>  
<table class="zebra">  
<thead>  
<tr>  
<th>序号</th>  
<th>书名</th>
<th>出版社</th>  
<th>分类</th>
<th>审核状态</th>
<th>操作</th> 
</tr>  
</thead>  

<tfoot>  
<tr>  
<td> </td>  
<td></td>  
<td></td>
<td></td>
<td></td>
<td></td>
</tr>  
</tfoot>  
<tr>  
<td>1</td>  
<td>User Manage</td>  
<td>1994</td>  
<td>#</td>
<td>#</td>
<td>
 <a href="#" class="button button-primary button-rounded button-small">查看</a>
 <a href="#" class="button button-primary button-rounded button-small">删除</a>
 <a href="#" class="button button-primary button-rounded button-small">编辑</a>
</td>
</tr>  
<tr>  
<td>2</td>  
<td>The Godfather</td>  
<td>1972</td>  
<td>#</td>
<td>#</td>
<td>
 <a href="#" class="button button-primary button-rounded button-small">查看</a>
 <a href="#" class="button button-primary button-rounded button-small">删除</a>
 <a href="#" class="button button-primary button-rounded button-small">编辑</a>
</td>
</tr>
</table>  
</body>
</html>
