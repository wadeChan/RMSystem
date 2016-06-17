<%@page import="entity.User"%>
<%@page import="DAO.IUserDAO"%>
<%@page import="entity.Book"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<% 
	ApplicationContext context = new ClassPathXmlApplicationContext("bean-config.xml");
	IUserDAO userDAO = (IUserDAO)context.getBean("userDAOProxy");
	String URLROOT = "http://localhost/RMSystem/library/";
%>
<base href="<%=basePath%>">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>我的收藏夹</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/4-col-portfolio.css" rel="stylesheet">
    <link href="../css/table.css" rel="stylesheet">
    <link href="../css/button.css" rel="stylesheet">
   <script type="text/javascript">
    	function showMenu(){
    	document.getElementById("menu").style.display="block";
    	}
    	function hiddenMenu(){
    	document.getElementById("menu").style.display="none";
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
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="userRegister.jsp">register</a>
                    </li>
                    <li>
                    <%
    	Cookie[] cookies = request.getCookies();
    	String userID=null;
    	boolean flag = false;
    	if(cookies!=null){
    	for(Cookie cookie : cookies)
        {
        	if("userID".equals(cookie.getName()))
        	{
        		userID = cookie.getValue();
        		out.print("<a href='javascript:void(0)' onmouseover='showMenu()' onmouseout='hiddenMenu()'>"+cookie.getValue()+"</a>");
        		flag = true;
        	}			
        }
        }
        if(flag==false)
        {
        out.print("<a href='userLogin.jsp' >log on</a>");       
        }    
    	 %>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.container -->
    </nav>
     <div id="menu" style="display:none;" onmouseover="showMenu()" onmouseout="hiddenMenu()">
                   <a href="javascript:void(0)" >userInfo</a>
                   <a href="showFavorite.jsp">favorite</a>
                   <a href="deleteCookie" >exit</a>
      </div>
        <hr>
    <!-- /.container -->
	<div class="container">
<table class="zebra">  
<thead>  
<tr>  
<th>序号</th>  
<th>书名</th>  
<th>操作</th> 
</tr>  
</thead>  

<%
User user = userDAO.getById(userID);
Set books = user.getBooks();
int i = 1;
if(books!=null && !books.isEmpty())
{
	Iterator iterator = books.iterator();
	while(iterator.hasNext())
	{
		Book book = (Book)iterator.next();
		%>
		<tr>
		<td><%=i %></td>
		<td><%=book.getBookName() %></td>
		<td>
		<a href="<%=URLROOT+book.getBookUrl() %>" class="button button-primary button-rounded button-small">在线阅读</a>
		</td>
		</tr>
	<% 
	}
}

 %>
	
	</div>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>




</body>
</html>
