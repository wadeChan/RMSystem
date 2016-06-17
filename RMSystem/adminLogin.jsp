<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript">
  	var msg = "${message}"
  	if(msg!="")
  	alert(msg);
  	</script>
<script type="application/x-javascript"> addEventListener("load", function() 
{setTimeout(hideURLbar, 0); }, false);
 function hideURLbar()
{ window.scrollTo(0,1);}
 </script>
    <base href="<%=basePath%>">
    <title>管理员登录界面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/admin.css">
  </head>
  <body>
  
  <div class="header">

        <p style="font-size:34px; text-align:center;font-weight:bold;font-family:幼圆;">后台管理系统</p>

    </div>
  
 	<div id="container">
    	<div id="main" role="main">
 <form method="post" action="AdminLogin">
<fieldset>
<label for="username">Username <span class="ico"><img src="images/user.png" alt="Username Icon" border="0"></span></label>
<input type="text" name="username" id="username" required="" autofocus="">
<label for="password">Password <span class="ico"><img src="images/pass.png" alt="Password Icon" border="0"></span></label>
<input type="password" name="password" id="password" required="">
</fieldset>
<fieldset>
<span class="password"><a href="#">Forgot Password</a></span>
<button type="submit">&gt;&gt;&nbsp;&nbsp;&nbsp;GO</button>
</fieldset>
</form>
</div>
<footer>
</footer>
  </div>
  </body>
</html>
