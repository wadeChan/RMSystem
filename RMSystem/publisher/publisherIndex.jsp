<%@page import="com.opensymphony.xwork2.ActionContext"%>
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
	if(msg!=""){
	alert(msg);
	location.replace("publisherIndex.jsp");
	}
</script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>2 Col Portfolio - Start Bootstrap Template</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/2-col-portfolio.css" rel="stylesheet">
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
    	if(cookies!=null){
    	for(Cookie cookie : cookies)
        {
        	if("publisherID".equals(cookie.getName()))
        	{
        		out.print("<a href='javascript:void(0)'  onmouseover='showMenu()' onmouseout='hiddenMenu()'>"+cookie.getValue()+"</a>");
        		flag = true;
        	}			
        }
        }
        if(flag==false)
        {
        out.print("<a href='publisherLogin.jsp'>log on</a>");
        ActionContext ac = ActionContext.getContext();
        ac.put("message","请先登录或注册");
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
                <h1 class="page-header">出 版 社
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-6 portfolio-item">
                <a href="pBookManage.jsp">
                    <img class="img-responsive" src="../images/bookManage.png" alt="">
                </a>
                <h3>
                    <a href="pBookManage.jsp">图书管理</a>
                </h3>
                <p>点击此模块,将进入图书管理界面.</p>
            </div>
            <div class="col-md-6 portfolio-item">
                <a href="checkBookState.jsp">
                    <img class="img-responsive" src="../images/checkManage.png" alt="">
                </a>
                <h3>
                    <a href="checkBookState.jsp">审核管理</a>
                </h3>
                <p>点击此模块,将进入审核管理界面.</p>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-6 portfolio-item">
                <a href="commentManage.jsp">
                    <img class="img-responsive" src="../images/commentManage.png" alt="">
                </a>
                <h3>
                    <a href="commentManage.jsp">书评管理</a>
                </h3>
                <p>点击此模块,将进入书评管理界面</p>
            </div>
            <div class="col-md-6 portfolio-item">
                <a href="javascript:void(0)">
                    <img class="img-responsive" src="../images/out.png" alt="">
                </a>
                <h3>
                    <a href="javascript:void(0)">账号管理</a>
                </h3>
                <p>点击此模块,将进入账号管理界面</p>
            </div>
        </div>
        <!-- /.row -->


    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>




</body>
</html>
