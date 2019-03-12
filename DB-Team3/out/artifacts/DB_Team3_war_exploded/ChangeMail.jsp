<%@ page import="de.tum.in.dbpra.model.beans.PersonBean" %>
<%@ include file="Header.jsp" %>

<%-- Get current user --%>
<% PersonBean person = (PersonBean) request.getSession().getAttribute("user"); %>

<h2>Change Mail-Address</h2>

<div class="row" style="padding-left: 14px">
    <div class="col-sm-3">
        <form action="/changemail" method="post" autocomplete="off">
            <div class="form-group">
                <b>Current Mail-Address:</b>
                <br>
                <%= person.getEmail()%>
            </div>
            <div class="form-group">
                <label>New Mail-Address:</label>
                <br>
                <input class="form-control" type="email" placeholder="Mail" name="newMail" required>
            </div>
            <div class="form-group">
                <label>Current Password:</label>
                <br>
                <input class="form-control" type="password" placeholder="Password" name="password" required>
            </div>
            <button class="btn btn-primary" class="button" type="submit">Save</button>
            <button class="btn btn-primary" class="button" type="button" onclick="window.history.back()">Cancel</button>
        </form>
    </div>
</div>

<%@ include file="Footer.jsp" %>
