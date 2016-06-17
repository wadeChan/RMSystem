<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="entity.Comment"%>
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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>书评</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
   <link href="../css/2-col-portfolio.css" rel="stylesheet">
     <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery-1.8.3.min.js"></script>
    <script src="../js/jquery.mobile-1.2.1.min.js"></script>
    <script type="text/javascript">
    	function showMenu(){
    	document.getElementById("menu").style.display="block";
    	}
    	function hiddenMenu(){
    	document.getElementById("menu").style.display="none";
    	}
    	function check(){
    	}
    </script>
</head>
  <body>
   <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="publisherIndex.jsp">Home</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="publisherRegister.jsp">register</a>
                    </li>
                   <li>
                    <% 
    	Cookie[] cookies = request.getCookies();
    	boolean flag = false;
    	String cookieValue=null;
    	if(cookies!=null){
    	for(Cookie cookie : cookies)
        {
        	if("publisherID".equals(cookie.getName()))
        	{
        		out.print("<a href='javascript:void(0)' onmouseover='showMenu()' onmouseout='hiddenMenu()'>"+cookie.getValue()+"</a>");
        		flag = true;
        		cookieValue=cookie.getValue();
        	}			
        }
        }
        if(flag==false)
        {
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
        </div>
        <!-- /.container -->
    </nav>
     <div id="menu" style="display:none;" onmouseover="showMenu()" onmouseout="hiddenMenu()">
                   <a href="javascript:void(0)" >userInfo</a>
                   <a href="deletePubCookie" >exit</a>
      </div>
    <!-- Page Content -->
    <div class="container">
        <!-- Page Header -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">查 看 书 评 
                </h1>
            </div>
        </div>
        <!-- /.row --> 
<%
if(cookieValue!=null){
ApplicationContext context = new ClassPathXmlApplicationContext("bean-config.xml");
IBookDAO bookDAO = (IBookDAO)context.getBean("bookDAOProxy");
Book book = null;
Comment comment = null;
int i = 1;
List list = bookDAO.findAll(cookieValue);
if(list!=null && !list.isEmpty()){
Iterator iterator = list.iterator();
while(iterator.hasNext()){
book = (Book)iterator.next();
 %>
 <div class="panel-group" id="accordion">
    <div class="panel panel-info">
       <div class="panel-heading" id="title">
            <h4 class="panel-title" >
                <a data-toggle="collapse" data-parent="#accordion" href="#<%=book.getBookID() %>"><%=book.getBookID()%>
</a></h4></div>
<div id="<%=book.getBookID() %>" class="panel-collapse collapse">
            <div class="panel-body">
            <%List list2 = bookDAO.findAllComment(book.getBookID());
            if(list2!=null && !list2.isEmpty()){
            		Iterator iterator2 = list2.iterator();
            		while(iterator2.hasNext()){
            		comment = (Comment)iterator2.next();
             %>
                	<h7><%=comment.getcUser().getUserID()%>:</h7></br>
                	<h4><%=comment.getContent()%></h4></br>
                	<hr>
                	<%}}else{
                		out.print("<h2>没有书评</h2>");
                	} %>
            </div>
        </div>
    </div>
    </div>
<%
	}
 }else{%>
 <h2>您暂时没有新增过书</h2>
 <%
 }
 %>
 <%
 }else{ %>
 <h2>请先登录</h2>
 <%} %>
</body>
</html>
