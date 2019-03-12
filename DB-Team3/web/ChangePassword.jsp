<%@ include file="Header.jsp" %>

<h2>Change Password</h2>

<div class="row" style="padding-left: 14px">
    <div class="col-sm-3">
        <form action="/changepassword" method="post" autocomplete="off">
            <div class="form-group">
                <label>Old Password:</label>
                <br>
                <input class="form-control" type="password" placeholder="Password" name="oldPassword" required>
            </div>
            <div class="form-group">
                <label>New Password:</label>
                <br>
                <input class="form-control" type="password" placeholder="New Password" name="newPassword" required>
            </div>
            <div class="form-group">
                <label>Repeat New Password:</label>
                <br>
                <input class="form-control" type="password" placeholder="New Password" name="reNewPassword" required>
            </div>
            <button class="btn btn-primary" type="submit">Save</button>
            <button class="btn btn-primary" type="button" onclick="window.history.back()">Cancel</button>
        </form>
    </div>
</div>

<%@ include file="Footer.jsp" %>