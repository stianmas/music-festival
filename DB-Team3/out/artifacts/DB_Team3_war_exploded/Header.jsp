<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%-- include bootstrap for use in jsps --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Labcourse Festival</title>

<%-- redirect to error page (e.g. if not logged in) --%>
<%@ page errorPage="ErrorPage.jsp" %>

<%-- link to favicon --%>
<link rel="icon" type="image/x-icon" href="media/favicon.ico" />

<%-- include stylesheet --%>
<link rel="stylesheet" type="text/css" href="style.css">

<header>
    <h1 class="header">Labcourse Festival</h1>

    <%-- show nav bar (only after login) --%>
    <% if (!request.getRequestURI().matches("(.*)Login.jsp|(.*)Register.jsp")) { %>
    <ul>
        <li class="header"><a href="Homepage.jsp">Home</a></li>
        <li class="header"><a href="/personalTimetable">Personal Timetable</a></li>
        <li class="header"><a href="/festivaltimetable">Festival Timetable</a></li>
        <div style="float:right">
            <li class="header"><a href="PersonalInformation.jsp">Personal Information <span
                    class="glyphicon glyphicon-cog"></span></a></li>
            <li class="header"><a href="/login?action=logout">Logout <span
                    class="glyphicon glyphicon-log-out"></span></a></li>
        </div>
    </ul>
    <% } %>
</header>

<%-- show info bar --%>
    <% if (request.getAttribute("info") != null) { %>
<div class="alert alert-success alert-dismissible" style="margin-left: 14px; margin-right: 14px; margin-top: 14px; margin-bottom: 0px;">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Success!</strong> ${info}
</div>
<% } %>

<%-- show error bar --%>
    <% if (request.getAttribute("error") != null) { %>
<div class="alert alert-danger alert-dismissible" style="margin-left: 14px; margin-right: 14px; margin-top: 14px; margin-bottom: 0px;">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Failure!</strong> ${error}
</div>
<% } %>