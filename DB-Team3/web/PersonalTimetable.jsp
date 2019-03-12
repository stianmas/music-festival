<%@ page import="de.tum.in.dbpra.model.beans.TimetableBean" %>
<jsp:useBean id="personalTimetable" scope="request" class="java.util.ArrayList"></jsp:useBean>

<%@ include file="Header.jsp" %>

<% if (request.getAttribute("error") == null) {

// Check if personal timetable is empty. If so, print message how to add entries
    if (personalTimetable.isEmpty()) {%>
<div class="alert alert-info alert-dismissible"
     style="margin-left: 14px; margin-right: 14px; margin-top: 14px; margin-bottom: 0px;">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Info!</strong> You can add entries to your personal timetable via the festival timetable
</div>
<%}%>

<h2>Personal Timetable</h2>

<table class="table table-striped">
    <tr>
        <th style="padding-left: 14px;">Start</th>
        <th>End</th>
        <th>Stage</th>
        <th>Band</th>
        <th></th>
    </tr>
    <% for (Object o : personalTimetable) {
        TimetableBean tb = (TimetableBean) o;
    %>
    <tr>
        <td style="padding-left: 14px;"><%= tb.getStartPlay() %>
        </td>
        <td><%= tb.getEndPlay() %>
        </td>
        <td><%= tb.getStageName() %>
        </td>
        <td><%= tb.getBandName() %>
        </td>
        <td style="width: 168px;">
            <form align="center" ; action="${pageContext.request.contextPath}/personalTimetable" method="get">
                <input type="hidden" name="id" value="<%=tb.getId()%>"/>
                <input type="hidden" name="action" value="<%="remove"%>"/>
                <input class="btn btn-danger" type="submit" name="Remove" value="remove"/>
            </form>
        </td>
    </tr>
    <% } %>
</table>
<%} %>

<%@ include file="Footer.jsp" %>