<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	alert(msg);
</script>
    <title>Mobile Reading System</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="../css/style.css" rel='stylesheet' type='text/css' />
	<meta content="width==device-width" name="viewport" initial-scale="1">
	<style type="text/css">
	.footer {
	position: relative;
	bottom:2%;
	left: 46%;
}
.footer p {
	color: #fff;
	font-size: 1em;
	font-family: 'Open Sans', sans-serif;	
	font-weight: 600;
}
.footer p a {
	font-family: 'Open Sans', sans-serif;	
	font-size: 1em;
	color:#4293A1;
	-webkit-transition: all 0.3s ease-out;
	-moz-transition: all 0.3s ease-out;
	-ms-transition: all 0.3s ease-out;
	-o-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
}
.footer p a:hover{
	color:#fff;
}
input[type="submit"]{
background:#4293A1;
}
input[type="submit"]:hover{
background:#4291bb;
}
	</style>
  </head>
  <body>
    <div class="main">
		<div class="login-form">
			<h1>Mobile Reading System</h1>
					<div class="head">
						<a href="../user/userLogin.jsp"><img src="../images/user-blue.png" alt="点击转到用户登录界面"/></a>
					</div>
				<form action="publisherLogin" method="post" >
						<input type="text" class="text" name="publisherID" value="用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '用户名';}" >
						<input type="password" name="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
						<div class="submit">
							<input type="submit" value="Log on" >
						</div>	
				</form>
			</div>
			<!--//End-login-form-->
		</div>
			 <!-----//end-main---->
			 <div class="footer">
			 <p><a href="publisherRegister.jsp">Register in here</a></p>
			 </div>
  </body>
</html>
