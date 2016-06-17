<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="entity.Type"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="DAO.ITypeDAO"%>
<%@page import="DAO.TypeDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<base href="<%=basePath%>">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript">
var msg = "${message}"
	if(msg!="")
	{
	alert(msg);
	location.replace("index.jsp");
	}
	
</script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>SISE MOBILE READING SYSTEM</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/1-col-portfolio.css" rel="stylesheet">
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
                <a class="navbar-brand" href="javascript:void(0)">Home</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="user/userRegister.jsp">register</a>
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
        out.print("<a href='user/userLogin.jsp' >log on</a>");       
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
                   <a href="user/showFavorite.jsp" >favorite</a>
                   <a href="deleteUserCookie" >exit</a>
      </div>
    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">MR System
                    <small style="font-family:幼圆;font-weight:bold"> &nbsp;&nbsp;&nbsp;分 类</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
		<%
		ApplicationContext context = new ClassPathXmlApplicationContext("bean-config.xml");
			ITypeDAO typeDAO = (ITypeDAO)context.getBean("typeDAOProxy");
			String IMGROOT = "http://localhost/RMSystem/images/";
			String imgLocation;
			List typeList = typeDAO.findAll();
			Iterator iterator = typeList.iterator();
			while(iterator.hasNext())
			{
			Type type = (Type)iterator.next();
			imgLocation = IMGROOT+type.getImgUrl();
		 %>
        <!-- Project One -->
        <div class="row">
            <div class="col-md-7">
                <a href="user/showBook.jsp?typeID=<%=type.getTypeID()%>">
                    <img class="img-responsive" src="<%out.print(imgLocation);%>" alt="">
                </a>
            </div>
            
            <div class="col-md-5">
                <h3><%out.print(type.getTypeName()); %></h3>
                <h4>&nbsp;</h4>
                <div style="height:17%;"><p><%out.print(type.getTypeDesc()); %></p></div>
                <a class="btn btn-primary" href="user/showBook.jsp?typeID=<%=type.getTypeID()%>">Look More&nbsp;<span style="font-weight:bold">></span></a>
            </div>
        </div>
         <hr>
        <%} %>
        <hr>
    </div>
    <!-- /.container -->
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
