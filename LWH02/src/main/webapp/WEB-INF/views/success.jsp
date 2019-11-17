<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


  </head>
  
  <body>

  <div class="row">
      <form class="form-inline" action="/find">
          <div class="form-group">
              <label class="label-middle">创建时间</label><input size="16" type="text" value="${startTime}" name="startTime">
              &nbsp; <button type="submit">查询</button>
          </div>
      </form>
  </div>

  <div class="row margin-top-20">
      <table class="table">
          <thead>
          <tr>
              <th class="seq">序号</th>
              <th>时间</th>
              <th>MSG</th>
          </tr>
          </thead>
          <tbody>
          </tbody>
          <c:forEach var="data" items="${datas}" varStatus="loop">
              <tr>
                  <td>${loop.index + 1}</td>
                  <td>${data.time}</td>
                  <td>${data.msg}</td>
              </tr>
          </c:forEach>
      </table>
  </div>
  </body>
</html>
