<%@ include file="Header.jsp" %>

<div class="col-md-4 col-md-offset-4" style="margin-top: 14px">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Please enter your credentials</h3>
        </div>
        <div class="panel-body">
            <form method="post" accept-charset="UTF-8" role="form" style="margin-bottom: 0px">
                <fieldset>
                    <div class="form-group">
                        <input class="form-control" placeholder="Email address" name="email" type="email" required/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" placeholder="Password" name="password" type="password" required/>
                    </div>
                    <input class="btn btn-primary btn-block" type="submit" value="Login"/>
                    <div>
                        <br>
                        Don't have an account? <a href="register">Register here</a>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>

<%@ include file="Footer.jsp" %>