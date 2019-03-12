<%@ page import="de.tum.in.dbpra.model.beans.PersonBean" %>
<%@ include file="Header.jsp" %>

<% PersonBean person = (PersonBean) request.getSession().getAttribute("user"); %>

<body>

<!--
Textbox that prints when the countdown is finished
template from: https://stackoverflow.com/questions/45789234/make-a-countdown-timer-display-a-modal-window-bootstrap
-->

<div class="modal fade" id="countdownFinishedModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h1 align="center">The festival has finally started.</h1>
                <h1 align="center">Have Fun!</h1>
            </div>
        </div>
    </div>
</div>

<h1 align="center">Hi <%= person.getFirstname()%> <%=person.getLastname()%></h1>
<br>
<br>

<div>
    <p class="timer" id="demo" style="margin-bottom: 0px"></p>
</div>
<br>
<br>
<h1 id="countdownText" align="center">until the festival starts!</h1>

<%
    boolean booleanShowed = false;
    request.getSession().setAttribute("booleanShowed", booleanShowed);
%>

<!-- Info: Code from https://www.w3schools.com/howto/howto_js_countdown.asp -->
<script>
    // Set the date we're counting down to
    var countDownDate = new Date("Jul 17, 2018 13:25:00").getTime();

    // Update the count down every 1 second
    var x = setInterval(function () {

        // Get todays date and time
        var now = new Date().getTime();

        // Find the distance between now and the count down date
        var distance = countDownDate - now;

        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Output the result in an element with id="demo"
        document.getElementById("demo").innerHTML = days + "d " + hours + "h "
            + minutes + "m " + seconds + "s ";

        // If countdown les than 1 day, write count down in red
        if(distance < (1000 * 60 * 60 * 24)){
            document.getElementById("demo").style.color = "red";
        }

        localStorage.setItem('modalShown', "false");

        // If the count down is over, write some text
        if (distance < 0 && localStorage.getItem('modalShown') != 'shown') {
            clearInterval(x);
            document.getElementById("demo").innerHTML = "0d 0h 0m 0s";
            // Display the modal
            $('#countdownFinishedModal').modal('show');
            localStorage.setItem('modalShown', "shown");
            document.getElementById("demo").style.display = "none";
            document.getElementById("countdownText").style.display = "none";
        }
    }, 1000);
</script>

<br>
<div class="row" style="margin-right: 0px; margin-left: 0px;">

    <div class="col-sm-4">
        <div class="card">
            <a target="_blank" rel="noopener noreferrer" href="http://www.helene-fischer.de/landingpage/" style="text-decoration: none; color: black;">
            <img class="card-img-top" src="media/fischer.jpg" alt="Card image"
                 style="width:100%">
            <div class="card-body">
                <h4 style="padding-left: 5px; padding-right: 5px;" class="card-title">Helene Fischer</h4>
                <p style="padding-left: 5px; padding-right: 5px; padding-bottom: 5px;" class="card-text">Helene Fischer is a German singer, entertainer, television presenter and actress.</p>
            </div>
            </a>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="card">
            <a target="_blank" rel="noopener noreferrer" href="https://www.andreas-gabalier.at" style="text-decoration: none; color: black;">
                <img class="card-img-top" src="media/gabalier.jpg" alt="Card image" style="width:100%">
            <div class="card-body">
                <h4 style="padding-left: 5px; padding-right: 5px;" class="card-title">Andreas Gabalier</h4>
                <p style="padding-left: 5px; padding-right: 5px; padding-bottom: 5px;" class="card-text">Andreas Gabalier is an Austrian folk singer. In 2012, he won the ECHO music award in folk music category.</p>
            </div>
            </a>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="card">
            <a target="_blank" rel="noopener noreferrer" href="http://floriansilbereisen.com" style="text-decoration: none; color: black;">
            <img class="card-img-top" src="media/silbereisen.jpg" alt="Card image" style="width:100%">
            <div class="card-body">
                <h4 style="padding-left: 5px; padding-right: 5px;" class="card-title">Florian Silbereisen</h4>
                <p style="padding-left: 5px; padding-right: 5px; padding-bottom: 5px;" class="card-text">Florian Bernd Silbereisen is a German folk singer and television presenter.</p>
            </div>
            </a>
        </div>
    </div>
</div>

</body>

<%@ include file="Footer.jsp" %>