var start1 = function () {

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
            $("#userFieldDiv").css('display', 'block');

            $("#infoBox").css('display', 'block');
            $("#partDetailsAndLocationDiv").css('display', 'block');
            $("#partDetailsAndLocationDiv1").css('display', 'block');

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

        }
        if (action === "Batch Complete" && subAction === "Display") {

            $("#LoginDiv").css('display', 'none');

            $("#directionalDisplayDiv").css('display', 'none');
            $("#partDetailsAndLocationDiv").css('display', 'none');
            $("#userFieldQuantity").css('display', 'none');
            $("#BatchDataDiv").css('display', 'block');

            $("#button-div").css('display', 'none');

            $("#batchCompleteTitle").css('display', 'block');
            $("#BatchCompleteDiv").css('display', 'block');

        }

        if (action === "Early Exit" && subAction === "Display") {
            $("#loginDiv").css('display', 'none');
            $("#CartPickingTitle").css('display', 'none');

            $("#button-div").css('display', 'none');
            $("#earlyExitTitle").css('display', 'block');
            $("#earlyExitButtons").css('display', 'block');
        }

        //if the same fields from lpn Validation i.e. Display data, batch data then full tote can be moved up with
        //the other if statements

        if (action === "Full Tote" && subAction === "Prompt Full Tote") {
            $("#button-div").css('display', 'none');
            $("#BatchDataDiv").css('display', 'none');
            $("#promptFullToteDiv").css('display', 'block');
            document.getElementById('MainContent_promptFullToteTB').focus();
        }
        if (action === "Full Tote" && subAction === "Prompt Current Qty") {
            $("#button-div").css('display', 'none')
            $("#BatchDataDiv").css('display', 'none');
            $("#promptCurrentQtyDiv").css('display', 'block');
            $("#promptFullToteDiv").css('display', 'none');
            document.getElementById('MainContent_promptCurrentQtyTB').focus();
        }
        if (action === "Full Tote" && subAction === "Prompt New Tote") {
            $("#button-div").css('display', 'none')
            $("#BatchDataDiv").css('display', 'none');
            $("#promptCurrentQtyDiv").css('display', 'none');
            $("#promptFullToteDiv").css('display', 'none');
            $("#promptNewToteDiv").css('display', 'block');
            document.getElementById('MainContent_promptNewToteTB').focus();
        }

    };
    ws.onopen = function () {
        // alert("Web Socket Open");
        $("#connectingDiv").css('display', 'none');
        $("#connectedDiv").css('display', 'block');

        $("#toteDiv").css('display', 'none');

    };

}; 