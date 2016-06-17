<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
var msg = "${message}"
	if(msg!="")
	alert(msg);
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>分类管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Loading Flat UI -->
<link href="css/flat-ui.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="css/jquery.mobile-1.2.1.min.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/check.js"></script>
<script type="text/javascript" src="js/jquery.mobile-1.2.1.min.js"></script>
<style type="text/css">
p {
	font-style: italic;
}
h7{
color:#FF0000;
font-size:8px;
text-align:center;
}
</style>
</head>
<body>

	<!-- 弹出添加界面start -->
	<div data-role="popup" id="popupAdd" data-theme="a"
		class="ui-corner-all" style="padding:10px 20px ;" >
		<form style="width:400px;"action="addType" method="post">
		<input type="text" name="typeID" id="typeID" value="" placeholder="类别ID" data-theme="a"  onblur="checkform1()"/>
		<h7 id="ms1" style="display:none;">不能为空!</h7>
		<input type="text" name="typeName" id="typeName" value="" placeholder="类别名" data-theme="a" onblur="checkform2()"/>
		<h7 id="ms2" style="display:none;">不能为空!</h7>
		<input type="file" id="imgUrl" name="imgUrl" accept="image/gif, image/jpeg"/>
		<input type="text" name="typeDesc" id="typeDesc" value="" placeholder="类别描述" data-theme="a" onblur="checkform3()"/>
		<h7 id="ms3" style="display:none;">不能为空!</h7>
		<button type="submit" data-theme="a" >添加</button>
		</form>
		</div>
	<!-- 弹出添加界面end -->
	<!-- 弹出删除界面start -->
	<div data-role="popup" id="popupDelete" data-theme="a"
		class="ui-corner-all" style="padding:10px 20px ;">
		<form style="width:400px;"action="delType" method="post">
		<input type="text" name="typeID" value="" placeholder="类别ID" data-theme="a" onblur="checkform4()"/>
		<h7 id="ms4" style="display:none;">不能为空!</h7>
		<button type="submit" data-theme="a">删除</button>
		</form>
		</div>
	<!-- 弹出删除界面end -->
	<!-- 弹出编辑界面start -->
	<div data-role="popup" id="popupUpdate" data-theme="a"
		class="ui-corner-all" style="padding:10px 20px ;">
		<form style="width:400px;"action="beforeUpd" method="post">
		<input type="text" name="typeID" value="" placeholder="类别ID" data-theme="a" onblur="checkform5()"/>
		<h7 id="ms5" style="display:none;">不能为空!</h7>
		<button type="submit" data-theme="a">编辑</button>
		</form>
		</div>
	<!-- 弹出编辑界面end -->
	<!-- 弹出查询界面start -->
		</div>
	<div class="container">
	<!-- 弹出查询界面end -->
		<h4>分类管理</h4>
		<div class="row">
			<div class="col-lg-10">
				<div class="row">
					<div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
						<div class="tile">
							<img src="images/clipboard.svg" alt="Compas"
								class="tile-image big-illustration">
								<h3 class="tile-title">添加类型</h3>
								<p>向MRSystem内添加类型信息</p> <a
								class="btn btn-primary btn-large btn-block" href="#popupAdd"
								data-rel="popup" data-inline="true">添加</a>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
						<div class="tile">
							<img src="images/paper-bag.svg" alt="Infinity-Loop"
								class="tile-image">
							<h3 class="tile-title">删除类型</h3>
							<p>从MRSystem内删除类型信息</p>
							<a class="btn btn-primary btn-large btn-block"
								href="#popupDelete" data-rel="popup" data-inline="true">删除</a>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
						<div class="tile">
							<img src="images/pencils.svg" alt="Pensils" class="tile-image">
							<h3 class="tile-title">编辑类型</h3>
							<p>修改MRSystem内的类型信息</p>
							<a class="btn btn-primary btn-large btn-block"
								href="#popupUpdate" data-rel="popup" data-inline="true">编辑</a>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
						<div class="tile">
							<img src="images/retina.svg" alt="Chat" class="tile-image">
							<h3 class="tile-title">查看所有类型信息</h3>
							<p>查看MRSystem内所有的类型信息</p>
							<a class="btn btn-primary btn-large btn-block"
								href="admin/showAllType.jsp" data-rel="popup" data-inline="true">查看</a>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
		</div>
		<!-- /row -->
	</div>
	<!-- /.container -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/vjquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/flat-ui.min.js"></script>
	<script src="js/application.js"></script>
</body>
</html>
