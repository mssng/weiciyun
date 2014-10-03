<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="test.OAuth4Code" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>My JSP 'MyJsp.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>

  <body>
    This is my JSP page. <br>
    <%
		//out.print(Oauth.class.getName());
		out.print(OAuth4Code.getToken());
		
		
		
	%>
	<input type=button onclick="window.open('连接')" title="生成">
  </body>
</html>
