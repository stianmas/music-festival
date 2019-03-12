<%@ page import="de.tum.in.dbpra.model.beans.PersonBean" %>
<%@ include file="Header.jsp" %>

<%-- Get current user --%>
<% PersonBean person = (PersonBean) request.getSession().getAttribute("user"); %>

<h2>Change Newsletter Preferences</h2>

<div class="row" style="padding-left: 14px">
    <div class="col-sm-3">
        <form action="/changenewsletterpreference" method="post">
            <div class="form-group">
                <label><input type="radio" name="preference" value="true"
                              <% if (person.isSubscribed_newsletter()) {%>checked<%}%>> Subscribe</label><br>
                <label><input type="radio" name="preference" value="false"
                              <% if (!person.isSubscribed_newsletter()) {%>checked<%}%>> Unsubscribe</label>
            </div>
            <button class="btn btn-primary" type="submit">Save</button>
            <button class="btn btn-primary" type="button" onclick="window.history.back()">Cancel</button>
        </form>
    </div>
</div>

<%@ include file="Footer.jsp" %>
