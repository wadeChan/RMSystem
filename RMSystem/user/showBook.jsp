<%@page import="entity.Book"%>
<%@page import="entity.Type"%>
<%@page import="DAO.ITypeDAO"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%
String typeID = request.getParameter("typeID"); 
ApplicationContext context  = new ClassPathXmlApplicationContext("bean-config.xml");
ITypeDAO typeDAO = (ITypeDAO)context.getBean("typeDAOProxy");
Type type = typeDAO.getById(typeID);	
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
    <title><%=type.getTypeName() %></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/4-col-portfolio.css" rel="stylesheet">
    <link href="../css/table.css" rel="stylesheet">
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
                        <a href="#">register</a>
                    </li>
                    <li>
                    <%
    	Cookie[] cookies = request.getCookies();
    	boolean flag = false;
    	if(cookies!=null){
    	for(Cookie cookie : cookies)
        {
        	if("userID".equals(cookie.getName()))
        	{
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
                   <a href="showFavorite.jsp" >favorite</a>
                   <a href="deleteUserCookie" >exit</a>
      </div>
    <!-- Page Content -->
    <div class="container">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><%=type.getTypeName()%>
                    <small><%=type.getTypeDesc()%></small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
		<%
		List list = typeDAO.findAllBook(typeID);
		String IMGROOT = "http://localhost/RMSystem/images/";
		if(list!=null && !list.isEmpty())
		{
		for(int j=0;j<=list.size()/4;j++)
		{%>
		<div class="row">
		<% 
			for(int k=0;k<list.size()%4;k++)
			{
				int num = k+4*j;
				Book book  = (Book)list.get(num);
				String imgLocation = IMGROOT+book.getBookImgUrl();
			%>
			<div class="col-md-3 portfolio-item">
                <a href="bookDetails.jsp?bookID=<%=book.getBookID()%>">
                <%=book.getBookID()%>
                    <img class="img-responsive" src="<%=imgLocation%>">
                </a>
            </div>
            <%
			}
			%>
			</div>
		<%
		}
		}
		 %>
        <!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
            </div>
        </div>
        <!-- /.row -->
        <hr>
    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>




</body>
</html>
