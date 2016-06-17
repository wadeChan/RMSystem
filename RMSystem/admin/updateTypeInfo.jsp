<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新书籍</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet"  type="text/css" href="css/table.css"/>
	<style type="text/css">
	table{
	font-family:Microsoft YaHei,Verdana,Arial,SimSun;
	color:#222222;
	font-size:16px;
	}
	th{
	color:#f5f5f5;
	font-size:24px;
	}
	td{
	text-align:center;
	color:#aa0000;
	}
  </style>
  </head>
  <body>
<form method="post" action="updType">
  <table border="2" width="99%" bordercolor="#32323A">
  <tr style="background:#00A5A5;text-align:center;">
  <th colspan="2" >类型信息</td>
  </tr>
  <tr>
  <td width="33%">类别ID</td>
  <td><input type="text" name="typeID" value="<%=request.getAttribute("typeID")%>"/></td>
  </tr>
  <tr>
  <td>类别名称</td>
  <td><input type="text" name="typeName" value="<%=request.getAttribute("typeName") %>"/></td>
  </tr>
  <tr>
  <td>类别描述</td>
  <td><input type="text" name="typeDesc" value="<%=request.getAttribute("typeDesc") %>"/></td>
  </tr>

  <tr>
  <td>类别封面</td>
  <td><input type="file" name="imgUrl" id="imgUrl"  accept="image/gif, image/jpeg" />修改后需要重新上传封面</td>
  </tr>
  <tr>
  <td><input type="submit" value="修改"/></td>
  <td><a href="admin/studentManage.jsp"><input type="button" value="返回"/></a></td>
  </table>
  </form>
  </body>
</html>
