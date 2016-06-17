<%@page import="entity.Type"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="DAO.ITypeDAO"%>
<%@page import="DAO.TypeDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>所有书籍</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet"  type="text/css" href="css/table.css"/>
<link rel="stylesheet" type="text/css" href="css/button.css"/>
</head>
<body>
<h2>All Type</h2>  
<table class="zebra">  
<thead>  
<tr>  
<th>序号</th>  
<th>类型ID</th>
<th>类型名称</th>  
<th>类型描述</th>
<th>类型封面</th>
<th>操作</th> 
</tr>  
</thead>  
<%
		ApplicationContext context = new ClassPathXmlApplicationContext("bean-config.xml");
			ITypeDAO typeDAO = (ITypeDAO)context.getBean("typeDAOProxy");
			String IMGROOT = "http://localhost/RMSystem/images/";
			String imgLocation;
			List typeList = typeDAO.findAll();
			Iterator iterator = typeList.iterator();
			int i=1;
			while(iterator.hasNext())
			{
			Type type = (Type)iterator.next();
			imgLocation = IMGROOT+type.getImgUrl();
		 %>
<tr>  
<td><% out.print(i); %></td>  
<td><%out.print(type.getTypeID()); %></td>  
<td><%out.print(type.getTypeName()); %></td>  
<td><%out.print(type.getTypeDesc()); %></td>
<td><%out.print(type.getImgUrl()); %></td>
<td>
 <form action="delType" method="POST" style="display:inline;">
 <input type="hidden" name="typeID" value="<%=type.getTypeID()%>"/>
 <input type="submit"  value ="删除" class="button button-primary button-rounded button-small" />
 </form>
 <form action="beforeUpd" method="POST" style="display:inline;">
 <input type="hidden" name="typeID" value="<%=type.getTypeID()%>"/>
 <input type="submit"  value ="编辑" class="button button-primary button-rounded button-small" />
 </form>
</td>
</tr>  
<%
	i++;} 
	%>
</table>  
</body>
</html>