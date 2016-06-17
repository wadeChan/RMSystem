<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <title>后台管理界面</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/adminIndex.css">
	<style type="text/css">
	body{background: #444 url("images/debut_dark.png") repeat;}
	.iF{width:100%;height:100%}
	</style>
  </head>
  <body>
   <div role="navigation" id="foo" class="nav-collapse">
      <ul>
        <li><a href="admin/userManage.jsp" target="showFrame">用户管理</a></li>
        <li><a href="admin/publisherManage.jsp" target="showFrame">运营商/出版社管理</a></li> 
        <li><a href="admin/checkManage.jsp" target="showFrame">审核管理</a></li>
        <li><a href="admin/classifyManage.jsp" target="showFrame">分类管理</a></li>
        <li><a href="admin/commentManage.jsp" target="showFrame">书评管理</a></li>
        <li><a href="admin/rankManage.jsp" target="showFrame">排行榜管理</a></li>
        <li><a href="adminLogin.jsp">登录界面</a>
      </li></ul>
    </div>
    <div role="main" class="main">
      <a href="#nav" class="nav-toggle">Menu</a>
      <iframe class="iF" name="showFrame" frameborder="0"></iframe>
      </div>
<script>
  var navigation = responsiveNav("#nav");
</script>
  

<div id="window-resizer-tooltip"><a href="#" title="Edit settings"></a><span class="tooltipTitle">Window size: </span><span class="tooltipWidth" id="winWidth"></span> x <span class="tooltipHeight" id="winHeight"></span><br><span class="tooltipTitle">Viewport size: </span><span class="tooltipWidth" id="vpWidth"></span> x <span class="tooltipHeight" id="vpHeight"></span></div></body>
</html>
