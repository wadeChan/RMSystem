<%@page import="com.opensymphony.xwork2.ActionContext"%>
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
    <title>删除书籍</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/2-col-portfolio.css" rel="stylesheet">
    <link rel="stylesheet"  type="text/css" href="../css/table.css"/>
	<link rel="stylesheet" type="text/css" href="../css/button.css"/>
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

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
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
                <h1 class="page-header">删 除 图 书
                </h1>
            </div>
        </div>
        <!-- /.row -->
	
	 <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="bookID">BookID</label>
          <div class="controls">
          <form action="deleteBook.jsp" method="POST">
            <input type="text" id="bookID" name="bookID" placeholder="4-8 number"size="35">
             <input type="submit" class="button button-primary button-rounded button-small" onsubmit="check()"/>
             </form>
            </p>
          </div>
        </div>
 <table class="zebra">  
<thead>  
<tr>  
<th>序号</th>  
<th>书本ID</th>
<th>书名</th>  
<th>ISBN</th>
<th>链接</th>
<th>操作</th> 
</tr>  
</thead>  
<%
String bookID = request.getParameter("bookID");
if(bookID!=null&&cookieValue!=null){
ApplicationContext context = new ClassPathXmlApplicationContext("bean-config.xml");
IBookDAO bookDAO = (IBookDAO)context.getBean("bookDAOProxy");
Book book = bookDAO.getById(bookID, cookieValue);
if(book!=null){
 %>
<tr>  
<td>1</td>  
<td><%out.print(book.getBookID()); %></td>  
<td><%out.print(book.getBookName()); %></td>  
<td><%out.print(book.getBookISBN()); %></td>
<td><%out.print(book.getBookUrl()); %></td>
<td>
<a href="deleteBook?bookID=<%=bookID %>" class="button button-primary button-rounded button-small">删除</a>
</td>
</tr>  
<%
}else{%>
<tr><td style="color:#ff0000;">找不到你要的图书,请重新输入</td></tr>
<% }
 }else{%>
 <tr><td></td></tr>
 <%} %>
</table>  
	
    <!-- /.container -->

    <!-- jQuery -->
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>
