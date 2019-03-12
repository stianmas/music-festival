<%@ include file="Header.jsp" %>

<script language='javascript' type='text/javascript'>
    // check if password_control field (input) equals org password field
    // if not inform the user
    function check(input) {
        if (input.value != document.getElementById('password').value) {

            document.getElementById("message").style.display = "block"
        } else {
            document.getElementById("message").style.display = "none"
        }
    }

    //check if password field is equal to password_control field (if there is something entered)
    // if not inform the user
    function check2(input) {
        if (input.value != document.getElementById('password_control').value && document.getElementById('password_control').value != "") {
            document.getElementById("message").style.display = "block"
        } else {
            document.getElementById("message").style.display = "none"
        }
    }

    //check if password and password_control field match, otherwise do not let submit
    function validateForm() {
        if (document.getElementById('message').style.display != "block") {
            document.getElementById("submit_error").style.display = "none";
            return true;
        }
        else {
            document.getElementById("submit_error").style.display = "block";
            return false;
        }
    }
</script>

<div class="col-md-4 col-md-offset-4" style="margin-top: 14px">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Registration</h3>
        </div>
        <div class="panel-body">
            <form method="post" onsubmit="return validateForm()" accept-charset="UTF-8" role="form"
                  style="margin-bottom: 0px">
                <fieldset>
                    <div class="form-group">
                        <input class="form-control" placeholder="First name" name="firstname" type="text" required/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" placeholder="Last name" name="lastname" type="text" required/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" placeholder="Email" name="email" type="email" required/>
                    </div>
                    <div class="form-group">
                        <input oninput="check2(this)" id="password" class="form-control" placeholder="Password"
                               name="password" type="password" required/>
                    </div>
                    <div class="form-group">
                        <input oninput="check(this)" id="password_control" class="form-control"
                               placeholder="Repeat Password" name="password_control" type="password" required/>
                        <p id='message' style="color:red; display:none; margin-top:0px;margin-bottom:0px;"> Passwords do
                            not match</p>
                    </div>
                    <div class="form-inline">
                        <div class="form-group">
                            <input size="24" class="form-control" placeholder="Street" name="street" type="text"
                                   required/>
                        </div>
                        <div class="form-group">
                            <input size="6" class="form-control" placeholder="Number" name="streetNumber" type="text"
                                   required/>
                        </div>
                    </div>
                    <div class="form-group"></div>
                    <div class="form-inline">
                        <div class="form-group">
                            <input size="6" class="form-control" placeholder="Zipcode" name="zipcode" type="text"
                                   required/>
                        </div>
                        <div class="form-group">
                            <input size="24" class="form-control" placeholder="City" name="city" type="text" required/>
                        </div>
                    </div>
                    <div class="form-group"></div>
                    <div class="form-group">
                        <input class="form-control" placeholder="Country" name="country" type="text" required/>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input name="subscribe_newsletter" type="checkbox"/> Subscribe to newsletter?</label>
                    </div>
                    <input class="btn btn-primary btn-block" type="submit" value="Register"/>
                    <text id='submit_error' style="color:red; display:none; margin-top:0px;margin-bottom:0px;">
                        Passwords do not match, please ensure they match before you continue.
                    </text>
                    <div>
                        <br>
                        Do you already have an account? <a href="login"> Go to login</a>
                    </div>
                </fieldset>
            </form>
        </div>
   </div>
</div>

<%@ include file="Footer.jsp" %>