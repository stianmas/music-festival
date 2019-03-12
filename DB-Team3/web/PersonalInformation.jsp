<%@ page import="de.tum.in.dbpra.model.beans.PersonBean" %>
<%@ include file="Header.jsp" %>

<%-- Create a String of the password with '*' symbols --%>
<% PersonBean person = (PersonBean) request.getSession().getAttribute("user");
    String password = "";
    for (int i = 0; i < person.getPassword_length(); i++) {
        password = password + "*";
    }
%>

<h2>Personal Information</h2>

<table class="table table-striped" style="width:100%">
    <col width="20%">
    <col width="75%">
    <col width="5%">
    <tr>
        <td style="padding-left: 14px;"><b>E-Mail Address</b></td>
        <td><%=person.getEmail()%>
        </td>
        <td align="center"><a href="ChangeMail.jsp">Edit</a></td>
    </tr>
    <tr>
        <td style="padding-left: 14px;"><b>Password</b></td>
        <td><%=password%>
        </td>
        <td align="center"><a href="ChangePassword.jsp">Edit</a></td>
    </tr>
    <tr>
        <td style="padding-left: 14px;"><b>Emergency Information</b></td>
        <% if (person.getEmergency_info() == null) {%>
        <td></td>
        <%} else {%>
        <td><%=person.getEmergency_info()%></td>
        <%}%>
        <td align="center"><a href="ChangeEmergencyInfo.jsp">Edit</a></td>
    </tr>
    <tr>
        <td style="padding-left: 14px;"><b>Newsletter</b></td>
        <% if (person.isSubscribed_newsletter()) {%>
        <td>Subscribed</td>
        <%} else {%>
        <td>Not subscribed</td>
        <%}%>
        <td align="center"><a href="ChangeNewsletterPreferences.jsp">Edit</a></td>
    </tr>
</table>

<%@ include file="Footer.jsp" %>