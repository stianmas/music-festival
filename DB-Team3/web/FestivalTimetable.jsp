<%-- This file displays all timeslots for the festival. It lets the user add and remove timeslots to/from
     their personal timetable. If their are conflicting performances an error will occur.
     Their is also a filter option on dates.
--%>

<%@ page import="de.tum.in.dbpra.model.beans.TimetableBean"%>
<jsp:useBean id="personalTimetable" scope="request" class="java.util.ArrayList"></jsp:useBean>
<jsp:useBean id="festivalTimetable" scope="request" class="java.util.ArrayList"></jsp:useBean>
<jsp:useBean id="dates" scope="request" class="java.util.ArrayList"></jsp:useBean>

<%@ include file="Header.jsp" %>

<%-- Check for conflicting timeslots in personal timetable when a new entry is added. If so, print message --%>
<% if (request.getAttribute("info2")!= null) {%>
<div class="alert alert-danger alert-dismissible" style="margin-left: 14px; margin-right: 14px; margin-top: 14px; margin-bottom: 0px;">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Conflict, mutiple conserts at the same time!</strong> ${info2}
</div>
<% } %>

<h2>Festival Timetable</h2>

<% if (request.getAttribute("error") == null) {
    int i = 0;
%>

<%-- Filter option for dates. When a button is pressed it calls the FestivalTimetableServlet which does the actual filtering
     This method may not be prefered, but I did not manage to find an easier solution with the Bootstrap table. Has a defualt
     option 'All* which shows all the dates. The dates are gathered from the useBean 'dates' which is created by the servlet.
 --%>
<div class="dropdown" style="padding-left: 14px;">
    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Dates
        <span class="caret"></span></button>
    <ul class="dropdown-menu" style="margin-left: 14px; align-items: center;">
        <li>
        <form action="${pageContext.request.contextPath}/festivaltimetable" align="center" method="post">
            <input class="btn btn-default" style="width: 110px; height: 34px; margin-top: 14px;" type="submit" name="status" value="All" align="middle"/>
        </form>
        </li>
        <% for(int j = 0; j < dates.size(); j++) {%>
            <li>
                <form action="${pageContext.request.contextPath}/festivaltimetable" align="center" method="post">
                    <input class="btn btn-default" type="submit" name="status" value="<%=(String) dates.get(j)%>"/>
                </form>
            </li>
        <%}%>
    </ul>
</div>
<br>
<%--
The table with the timeslots. Checks if an entry in festivalTimetable is in the users table. If so a
remove button is displayed, else an add button. The buttons calls the post method in FestivalTimetableServlet.
--%>
<table class="table table-striped">
    <tr>
        <th style="padding-left: 14px;">Start</th>
        <th>End</th>
        <th>Stage</th>
        <th>Band</th>
        <th></th>
    </tr>
    <%while (i != festivalTimetable.size()){%>
    <% boolean b = false;%>
    <% for(int j = 0; j < personalTimetable.size(); j++) {%>
    <% if ( j < personalTimetable.size() && ((TimetableBean) festivalTimetable.get(i)).getId() == ((TimetableBean) personalTimetable.get(j)).getId() ) { %>
    <tr>
        <td style="padding-left: 14px;"><%= ((TimetableBean) festivalTimetable.get(i)).getStartPlay() %></td>
        <td><%= ((TimetableBean) festivalTimetable.get(i)).getEndPlay() %></td>
        <td><%= ((TimetableBean) festivalTimetable.get(i)).getStageName() %></td>
        <td><%= ((TimetableBean) festivalTimetable.get(i)).getBandName() %></td>
        <td style="width: 168px;">
            <form align="center"; action="${pageContext.request.contextPath}/festivaltimetable" method="post">
                <input type="hidden" name="table" value="<%=((TimetableBean) festivalTimetable.get(i)).getId()%>" />
                <input type="hidden" name="status" value="<%="remove"%>" />
                <input class="btn btn-danger" type="submit" name="Remove" value="remove"/>
            </form>
        </td>
    </tr>
    <% b = true; break; }%>
    <%}%>
    <% if (!b) { %>
    <tr>
        <td style="padding-left: 14px;"><%= ((TimetableBean) festivalTimetable.get(i)).getStartPlay() %></td>
        <td><%= ((TimetableBean) festivalTimetable.get(i)).getEndPlay() %></td>
        <td><%= ((TimetableBean) festivalTimetable.get(i)).getStageName() %></td>
        <td><%= ((TimetableBean) festivalTimetable.get(i)).getBandName() %></td>
        <td>
            <form align="center"; action="${pageContext.request.contextPath}/festivaltimetable" method="post">
                <input type="hidden" name="table" value="<%=((TimetableBean) festivalTimetable.get(i)).getId()%>" />
                <input type="hidden" name="status" value="<%="add"%>" />
                <input style="width: 79px; height: 34px" class="btn btn-success" type="submit" name="Add" value="add" />
            </form>
        </td>
    </tr>
    <%}%>
    <% i = i+1;%>
    <%}%>
</table>
<%} %>

<%@ include file="Footer.jsp" %>