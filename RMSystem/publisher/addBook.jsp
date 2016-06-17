<%@page import="entity.Type"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="DAO.ITypeDAO"%>
<%@page import="org.springframework.context.ApplicationContext"%>
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
	if(msg!="")
	alert(msg);
</script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>添加书籍</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/2-col-portfolio.css" rel="stylesheet">
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
        		out.print("<a href='javascript:void(0)' onmouseover='showMenu()' onmouseout='hiddenMenu()'>"+cookie.getValue()+"</a>");
        		flag = true;
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
                <h1 class="page-header">新 增 图 书
                </h1>
            </div>
        </div>
        <!-- /.row -->
		
  <form action="addBook" method="POST">
    <fieldset>
    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="bookID">BookID</label>
          <div class="controls">
            <input type="text" id="bookID" name="bookID" placeholder="4-8 number"size="35">
            <p class="help-block">The bookID</p>
          </div>
        </div>

    

    <div class="control-group">

          <!-- Text input-->
          <label for="bookName">BookName</label>
          <div class="controls">
            <input type="text" id="bookName" name="bookName" placeholder="please input the book's Name" size="35">
            <p class="help-block">The bookName</p>
          </div>
        </div>

    <div>

          <!-- Text input-->
          <label for="bookISBN">bookISBN</label>
          <div class="controls">
            <input type="text" id="bookISBN" name="bookISBN" placeholder="10 number" size="35">
            <p class="help-block">The bookISBN</p>
          </div>
        </div>

    <div>
          <label class="control-label">bookCovers</label>

          <!-- File Upload -->
          <div>
            <input name="bookImgUrl" id="bookImgUrl" type="file">
          </div>
        </div>

    <div >

          <!-- Textarea -->
          <label class="control-label">bookDesc</label>
          <div>
            <div>
                  <textarea rows="5" cols="36"> </textarea>
            </div>
          </div>
        </div>
    <div>
          <!-- Text input-->
          <label class="control-label" for="bookUrl">bookUrl</label>
          <div >
            <input name = "bookUrl" id="bookUrl" type="file">
            <p class="help-block">reading online</p>
          </div>
        </div>
    <div >
          <!-- Select Basic -->
          <label class="control-label">类型</label>
          <div>
            <select name="bookType">
      <%
      		ApplicationContext context = new ClassPathXmlApplicationContext("bean-config.xml");
			ITypeDAO typeDAO = (ITypeDAO)context.getBean("typeDAOProxy");
			String imgLocation;
			List typeList = typeDAO.findAll();
			Iterator iterator = typeList.iterator();
			while(iterator.hasNext())
			{
			Type type = (Type)iterator.next();
       %>
       <option value="<%=type.getTypeID()%>"><%=type.getTypeName() %></option>
       <%} %>
      </select>
          </div>
        </div>
     	<hr>
       <input type="submit"  class="button button-primary button-rounded button-small" value="新增"/>
       
    </fieldset>
  </form>
    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>
