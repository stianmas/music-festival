<%@ page import="de.tum.in.dbpra.model.beans.PersonBean" %>

<%@ include file="Header.jsp" %>

<%-- Get current user --%>
<% PersonBean person = (PersonBean) request.getSession().getAttribute("user");%>

<h2>Change Emergency Information</h2>

<div class="row" style="padding-left: 14px">
    <div class="col-sm-4">
        <form action="/changeemergencyinfoservlet" method="post">
            <div class="form-group">
                <textarea class="form-control" rows="4" name="emergencyinfo"
                          placeholder="Enter your emergency information"><%=person.getEmergency_info().trim()%></textarea>
            </div>
            <button class="btn btn-primary" type="submit">Save</button>
            <button class="btn btn-primary" type="button" onclick="this.form.elements['emergencyinfo'].value=''">Clear
            </button>
            <button class="btn btn-primary" type="button" onclick="window.history.back()">Cancel</button>
        </form>
    </div>
</div>

<%@ include file="Footer.jsp" %>