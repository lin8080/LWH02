<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登录页</title>
<link rel="stylesheet" type="text/css"
	href="./static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<style>
		.form-horizontal{
				width:500px;
				height:300px;
				
		}
	</style>
</head>

<script src="../../static/js/jquery-3.2.1.min.js" language="javascript"></script>
<script type="text/javascript">
	// 控制onsubmit提交的方法，方法名是vform()
		function form(){
			
			var name = $("#loginname").val();
			var password = $("#loginpass").val();
			//判断上面的变量，如果为空字符串不能提交
			if(name == ""){
				alert("请输入登录名！");
				return false;
			}
			if(password == ""){
				alert("请输入密码！");
				return false;
			}
			//除以上结果的可以提交，返回true
			return true;
		}
	</script>

<body>

	<h1>请登录你的账号密码</h1>
	<hr>

	<form class="form-horizontal" action="${pageContext.request.contextPath}/login" method="post"
		  onsubmit="return form()">
		<div class="form-group">
			<label class="col-sm-2 control-label">用户名</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="loginname"
					 name="name">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="loginpass"
					 name="password">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">登录</button>
			</div>
		</div>
	</form>
</body>
</html>
