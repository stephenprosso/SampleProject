﻿var start1 = function () {

    var inc = document.getElementById('incomming');
    var wsImpl = window.WebSocket || window.MozWebSocket;
    var form = document.getElementById('sendForm');
    var input = document.getElementById('sendText');

    //inc.innerHTML += "connecting to server ..<br/>";

    // create a new websocket and connect
    var cart = new URLSearchParams(window.location.search).get("cart");
    window.ws = new wsImpl('ws://192.168.128.152:8181/' + cart);
    console.log(wsImpl);
    console.log(cart);

    //on load call a function to make xml request to API
    getToteMatrix();
    function getToteMatrix() {
        var xmlhttp = new XMLHttpRequest();
        var url = "http://promat.dovetree.com/json/api/values/displaydata";

        xmlhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById("id01").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("POST", url, true);
        xmlhttp.send();
    }

    // when data is comming from the server, this metod is called
    ws.onmessage = function (evt) {


        var myObj = JSON.parse(evt.data);
        console.log(evt.data);
        console.log(myObj);

        //var myObj = JSON.parse(myJSON);
        //setting variables with data

        // JSON variables
        var action = myObj.Action;
        var subAction = myObj.SubAction;
        var cart = myObj.Cart;
        var cartPositions = myObj.CartPositions;
        var overallTC = myObj.OverallTC;
        var errorMessage = myObj.ErrorMessage;
        var userResponse1 = myObj.UserResponse1;
        var userResponse2 = myObj.UserResponse2;
        var userResponse3 = myObj.UserResponse3;

        if (action === "Connect" && subAction === "SID") {
            $("#LoginDiv").css('display', 'block');
            document.getElementById('nothingToSeeHere').value = userResponse1;
            console.log(document.getElementById('nothingToSeeHere').value);

        }

        // 1 if statement variables PAGE 1 IN PICKING PROCESS
        if (action === "Login" && subAction === "Response") {

            $("#LoginDiv").css('display', 'block');
            $("#toteDiv").css('display', 'none');
            document.getElementById("MainContent_UserID").focus();
        }
        // 2 send user to PAGE 2 in the picking process
        if (action === "Zone Group" && subAction === "Select") {

            $("#LoginDiv").css('display', 'none');
            $("#zoneSelectDiv").css('display', 'block');
            $("#zoneSelectTite").css('display', 'block');

            if (errorMessage !== '') {
                $("#errorDiv").css('display', 'block');
                $("#errorMessage").css('display', 'block');
                $("#connectedDiv").css('display', 'none');
                document.getElementById("errorMessage").innerHTML = errorMessage;
            }
            else {
                $("#errorDiv").css('display', 'none');
                $("#errorMessage").css('display', 'none');
            }
        }

        // 3 if statement to present work dashboard
        if (action === "Work Dashboard" && subAction === "Present") {
            $("#LoginDiv").css('display', 'none');
            if (errorMessage !== '') {
                $("#errorDiv").css('display', 'block');
                $("#errorMessage").css('display', 'block');
                $("#connectedDiv").css('display', 'none');
                document.getElementById("errorMessage").innerHTML = errorMessage;
            }
            else {
                $("#errorDiv").css('display', 'none');
                $("#errorMessage").css('display', 'none');
            }
            $("#zoneSelectDiv").css('display', 'none');
            $("#zoneSelectTite").css('display', 'none');
            $("#dashboardTitle").css('display', 'block');
            $("#workDashboardDiv").css('display', 'block');

        }

        // 4 if statements for Action = Batch Setup
        if (action === "Batch Setup" && subAction === "Next LPN Pos") {
            $("#LoginDiv").css('display', 'none');
            if (errorMessage !== '') {
                $("#errorDiv").css('display', 'block');
                $("#errorMessage").css('display', 'block');
                $("#connectedDiv").css('display', 'none');
                document.getElementById("errorMessage").innerHTML = errorMessage;
            }
            else {
                $("#errorDiv").css('display', 'none');
                $("#errorMessage").css('display', 'none');
            }

            $("#LoginDiv").css('display', 'none');
            $("#dashboardTitle").css('display', 'none');
            $("#workDashboardDiv").css('display', 'none');
            $("#batchSetupTitle").css('display', 'block');
            $("#BatchSetupTBs").css('display', 'block');
            document.getElementById("MainContent_LPNTB").focus();
        }

        // 5 if statements for starting aisle
        if (action === "Start Aisle" && subAction === "Prompt") {
            if (errorMessage !== '') {
                $("#errorDiv").css('display', 'block');
                $("#errorMessage").css('display', 'block');
                $("#connectedDiv").css('display', 'none');
                document.getElementById("errorMessage").innerHTML = errorMessage;
            }
            else {
                $("#errorDiv").css('display', 'none');
                $("#errorMessage").css('display', 'none');
            }
            $("#dashboardTitle").css('display', 'none');
            $("#workDashboardDiv").css('display', 'none');
            $("#batchSetupTitle").css('display', 'none');
            $("#BatchSetupTBs").css('display', 'none');
            $("#StartAisleDiv").css('display', 'block');
            document.getElementById("MainContent_startAisleTB").focus();
        }


        // 6 if statements for Action = Present Pick
        if (action === "Present Pick" || action === "Location Validation" || action === "Part Validation") {

            $("#LoginDiv").css('display', 'none');
            $("#StartAisleDiv").css('display', 'none');

            $("#CartPickingTitle").css('display', 'block');
            //$("#partDetailsDiv").css('display', 'block');
            //$("#locationQuantityDiv").css('display', 'block');
            //$("#BatchDataDiv").css('display', 'block');
            //$("#directionalDisplayDiv").css('display', 'block'); 
            //$("#userFieldDiv").css('display', 'block');



            $("#directionalDisplayDiv").css('display', 'block');
            $("#partDetailsAndLocationDiv").css('display', 'block');
            $("#userFieldQuantity").css('display', 'block');
            $("#BatchDataDiv").css('display', 'block');

            $("#button-div").css('display', 'block');

            if (errorMessage !== '') {
                $("#errorDiv").css('display', 'block');
                $("#errorMessage").css('display', 'block');
                $("#connectedDiv").css('display', 'none');
                document.getElementById("errorMessage").innerHTML = errorMessage;
            }
            else {
                $("#errorDiv").css('display', 'none');
                $("#errorMessage").css('display', 'none');
            }
            //Display Data Variables
            var part = myObj.DisplayData[0].Part;
            var partDesc1 = myObj.DisplayData[0].PartDesc1;
            var partDesc2 = myObj.DisplayData[0].PartDesc2;
            var userField = myObj.DisplayData[0].UserField;
            var location = myObj.DisplayData[0].Location;
            var totalPickQty = myObj.DisplayData[0].TotalPickQty;
            var directionalDisplay = myObj.DisplayData[0].DirectionalDisplay;

            document.getElementById("partNumber").innerHTML = part;
            document.getElementById("partDesc1").innerHTML = partDesc1;
            document.getElementById("partDesc2").innerHTML = partDesc2;
            document.getElementById("location").innerHTML = location;
            document.getElementById("totalPickQty").innerHTML = totalPickQty;
            document.getElementById("userField").innerHTML = userField;
            document.getElementById("directionalDisplay").innerHTML = directionalDisplay;

            console.log(myObj.DisplayData[0].Part);

            ////Batchdata Variables

            var remainingPickLines = myObj.BatchData[0].RemainingPickLines;
            var remainingLocs = myObj.BatchData[0].RemainingLocs;
            var currentPicksPerHourRate = myObj.BatchData[0].CurrentPicksPerHourRate;

            document.getElementById("remainingPickLines").innerHTML = remainingPickLines;
            document.getElementById("remainingLocs").innerHTML = remainingLocs;
            document.getElementById("currentPicksPerHourRate").innerHTML = currentPicksPerHourRate;

            if (action === "Location Validation" && subAction === "Prompt") {
                $("#id01").css('display', 'none');
                $("#validateLocationDiv").css('display', 'block');
                document.getElementById("MainContent_fullToteButton").disabled = true;
                document.getElementById("MainContent_taskCompleteButton").disabled = true;

                document.getElementById("MainContent_validateLocationTB").focus();

                //hide the task complete button
            }
            if (action === "Part Validation" && subAction === "Prompt") {
                $("#id01").css('display', 'none');
                document.getElementById("MainContent_fullToteButton").disabled = true;
                document.getElementById("MainContent_taskCompleteButton").disabled = true;
                $("#validatePartDiv").css('display', 'block');
                document.getElementById("MainContent_validatePartTB").focus();

                //hide the task complete button
            }
            if (action === "Present Pick" && subAction === "Display Complete Task") {

                $("#id01").css('display', 'block');
                $("#CartPickingTBs").css('display', 'block');

            }

            if (action === "Present Pick" && subAction === "Display Complete Task with LPN Validation") {
                $("#id01").css('display', 'none');
                document.getElementById("MainContent_taskCompleteButton").disabled = true;
                $("#validateLPNDiv").css('display', 'block');
                document.getElementById("MainContent_validateLPNTB").focus();

                //hide the task complete button
            }

            if (action === "Batch Complete" && subAction === "Display") {
                $("#LoginDiv").css('display', 'none');

                $("#batchCompleteTitle").css('display', 'block');
                $("#BatchCompleteDiv").css('display', 'block');

            }
        }
    };
    ws.onopen = function () {
        // alert("Web Socket Open");
        $("#connectingDiv").css('display', 'none');
        $("#connectedDiv").css('display', 'block');

        $("#toteDiv").css('display', 'none');

    };

};
//functions for buttons
function sendLogin() {

    var UserID = document.getElementById('MainContent_UserID').value;
    var Password = document.getElementById('MainContent_PWD').value;
    var cart = new URLSearchParams(window.location.search).get("cart");
    var ntsh = document.getElementById('nothingToSeeHere').value;

    var data = JSON.stringify({ "action": "Login", "SubAction": "Initiate", "Cart": cart, "UserResponse1": UserID, "UserResponse2": Password, "UserResponse3": ntsh });
    console.log(data);
    console.log("send data");
    ws.send(data);
    console.log("data sent");
}

function sendLogout() {

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "action": "Zone Group", "SubAction": "LogOut", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}
function clearError() {

    $("#errorDiv").css('display', 'none');
    $("#connectedDiv").css('display', 'block');

}

function sendSelectedZoneGrouping() {

    var selectedZoneGrouping = "1";
    var cart = new URLSearchParams(window.location.search).get("cart");
    alert("WTF");
    var data = JSON.stringify({ "Action": "Zone Group", "SubAction": "Response", "Cart": cart, "UserResponse1": selectedZoneGrouping });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}

function sendSelectedBucket(selectedBucket) {


    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Work Dashboard", "SubAction": "Selected Bucket", "Cart": cart, "UserResponse1": selectedBucket });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}

function sendLPN() {

    var LPN = document.getElementById('MainContent_LPNTB').value;
    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "LPN Scanned", "Cart": cart, "UserResponse1": LPN });
    console.log(data);
    console.log("send data");
    ws.send(data);
    console.log("data sent");
}

function processBatch() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "Process Batch", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}

function sendLocnEmpty() {

    var emptyLocn = prompt("Scan Empty Location");
    var data = JSON.stringify({ "Action": "Notify Host Locn Empty", "SubAction": "Request", "Cart": cart, "UserResponse1": emptyLocn });
    console.log(data);
    ws.send(data);
    console.log("data sent");


}

function sendStartAisle() {

    var aisle = document.getElementById('MainContent_startAisleTB').value;
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Start Aisle", "SubAction": "Response", "Cart": cart, "UserResponse1": aisle });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}


function sendBack() {

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "Clear Cart", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");

}

function sendRetryLights() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Batch Complete", "SubAction": "Retry Lights", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");

}
function sendTaskComplete() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Batch Complete", "SubAction": "Task Complete", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}
