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
label{
	font-family: 'Open Sans', sans-serif;	
	color:#16A085;
	font-size:18px;
}
label i{
font-family: 'Open Sans', sans-serif;	
font-size:1px;
color:#FF0000;
}
	</style>
<script type="text/javascript">
function checkid()
{
var x=document.getElementById("publisherID").value;
if(x.length<4||x.length>12)
{	
	alert("please input 4-12characters as ID!");
	document.getElementById("publisherID").focus();
	return false;
}
}
function checkname()
{
var x=document.getElementById("publisherName").value;
if(x.length<4||x.length>20)
{	
	alert("please input 4-20characters as publisher name!");
	document.getElementById("publisherName").focus();
	return false;
}
}
function checkpass()
{
var x=document.getElementById("password").value;
if(x.length<4||x.length>20)
{	
	alert("please input 4-20characters as password!");
	document.getElementById("password").focus();
	return false;
}
}
function checkpass2()
{
var x=document.getElementById("password").value;
var x2 = document.getElementById("password2").value;
if(x!=x2)
{	
	alert("retry input password again!");
	return false;
}
}
function checkall(){
if(checkid()==false){return false;};
if(checkname()==false){return false;};
if(checkpass()==false){return false;};
if(checkpass2()==false){return false;};
}
</script>
  </head>
  <body>
    <div id ="main" class="main" style="display:block">
		<div class="login-form">
		<form action="publisherReg"  method="POST" onsubmit="return checkall()">
  		<label><div>publisherID<i>*(4-12 characters)</i></div> <input type="text" name="publisherID" id="publisherID" onblur="checkid()" ></label>
  		<label><div>publisherName*(8-20 characters)</div> <input type="text" name="publisherName" id="publisherName" onblur="checkname()"></label>
  		<label><div>Password<i>*(4-12 characters)</i></div> <input type="password" name="password" id="password" onblur="checkpass()"></label>
  		<label><div>Password again*</div> <input type="password" name="password2" id="password2" onblur="checkpass2()"></label>
  		<label><div>Email</div> <input type="text" name="email" id="email"></label>
  		<div class="submit">
							<input type="submit" value="Register" >
						</div>	
		</form>
		</div>
			<!--//End-login-form-->
		</div>
			 <!-----//end-main---->
			 <div class="footer">
			 <p><a href="publisherLogin.jsp">Log on in here</a></p>
			 </div>
  </body>
</html>
