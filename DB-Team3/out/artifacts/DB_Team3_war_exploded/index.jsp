<%--
  Created by IntelliJ IDEA.
  User: schwarz
  Date: 02.05.18
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<html>

<head>
    <title>redirect</title>
</head>

<body>
You're redirected to login. <a href="${request.getContextPath()}/login">Click here</a> if nothing happens.
<%
    String loginPage = request.getContextPath() + "/login";
    response.sendRedirect(loginPage);
%>
</body>

</html>
<%--- servlet annotation --%>