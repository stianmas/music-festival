<%--
  Created by IntelliJ IDEA.
  User: elias
  Date: 11.07.18
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Error!</title>
</head>
<body>
Error ... redirecting to login. <a href="${request.getContextPath()}/login">Click here</a> if nothing happens.
<%
    String loginPage = request.getContextPath() + "/login";
    response.sendRedirect(loginPage);
%>
</body>
</html>
