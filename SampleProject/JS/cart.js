var start1 = function () {

    var wsImpl = window.WebSocket || window.MozWebSocket;
    // create a new websocket and connect
    var cart = new URLSearchParams(window.location.search).get("cart");
    window.ws = new wsImpl('ws://192.168.128.152:8181/' + cart);
    console.log(wsImpl);
    console.log(cart);

    //on load call a function to make xml request to API
    //------THIS CONTENT HAS BEEN MOVED TO ON MESSAGE---

    // when data is comming from the server, this metod is called
    ws.onmessage = function (evt) {


        var myObj = JSON.parse(evt.data);
        console.log(evt.data);
        console.log(myObj);

        //xml code

        //var body = '{"Action":"<must be non blank>", "SubAction":"", "Cart":"", "CartPositions":1,"OverallTC":false, "ErrorMessage":"","UserResponse1":"","UserResponse2":"","UserResponse3":"","DisplayData":[{"Part":"", "PartDesc1":"", "PartDesc2":"", "UserField":"", "Location":"", "DirectionalDisplay":"", "TotalPickQty":"5", "StartingAisle":"","FullTote":"", "FullToteQty":"", "NewToteQty":""}    ],"BatchData":[{"RemainingPickLines":0, "RemainingLocs":0, "CurrentPicksPerHourRate":0.000}],"AlphaPos":[{"Pos": 1, "PrimaryModule":1, "SecondaryModule":3, "Message":"1111", "Color": 1, "BlinkSpeed": 0, "Buzzer": true, "Enable":true},{"Pos": 2, "PrimaryModule":2, "SecondaryModule":4, "Message":"2222", "Color": 1, "BlinkSpeed": 0, "Buzzer": false, "Enable":true}],"BatchPos": [{"Pos": 15, "PrimaryModule":1, "SecondaryModule":51, "Display":"*15*", "TC":false, "Color":1, "BlinkSpeed":0, "Enable":true, "Visible":true}, {"Pos": 2, "PrimaryModule":2, "SecondaryModule":52, "Display":"2222", "TC":false, "Color":1, "BlinkSpeed":0, "Enable":true, "Visible":true}, {"Pos": 5, "PrimaryModule":5, "SecondaryModule":55, "Display":"FIVE", "TC":false, "Color":1, "BlinkSpeed":0, "Enable":true, "Visible":true},{"Pos": 3, "PrimaryModule":3, "SecondaryModule":53, "Display":"3333", "TC":false, "Color":1, "BlinkSpeed":0, "Enable":true, "Visible":false},{"Pos": 4, "PrimaryModule":4, "SecondaryModule":54, "Display":"4444", "TC":false, "Color":1, "BlinkSpeed":0, "Enable":true, "Visible":true}]}';
        function getDashboard(n) {

            var xmlhttp = new XMLHttpRequest();
            var url = "http://192.168.128.152/cart/pickdashboard/" + n;

            xmlhttp.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {

                    if (n === "1") {
                        document.getElementById("dash1").innerHTML = this.responseText;
                    }
                    if (n === "2") {
                        document.getElementById("dash2").innerHTML = this.responseText;
                    }
                    if (n === "3") {
                        document.getElementById("dash3").innerHTML = this.responseText;
                    }
                    if (n === "4") {
                        document.getElementById("dash4").innerHTML = this.responseText;
                    }
                    if (n === "5") {
                        document.getElementById("dash5").innerHTML = this.responseText;
                    }
                    if (n === "6") {
                        document.getElementById("dash6").innerHTML = this.responseText;
                    }
                }
            };
            xmlhttp.open("GET", url, true);

            xmlhttp.send();
        }

        function getToteMatrix(body) {


            var xmlhttp = new XMLHttpRequest();
            var url = "http://192.168.128.152/cart/cart/batchpos";

            xmlhttp.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    document.getElementById("id01").innerHTML = this.responseText;
                }
            };
            xmlhttp.open("POST", url, true);

            xmlhttp.send(body);
        }


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
            checkForErrors();
            $("#LoginDiv").css('display', 'block');
            $("#toteDiv").css('display', 'none');
            document.getElementById("MainContent_UserID").focus();
        }
        // 2 send user to PAGE 2 in the picking process
        if (action === "Zone Group" && subAction === "Select") {
            checkForErrors();

            $("#LoginDiv").css('display', 'none');
            $("#zoneSelectDiv").css('display', 'block');
            $("#zoneSelectTite").css('display', 'block');


        }

        // 3 if statement to present work dashboard
        if (action === "Work Dashboard" && subAction === "Present") {
            checkForErrors();

            getDashboard("1");
            getDashboard("2");
            getDashboard("3");
            getDashboard("4");
            getDashboard("5");
            getDashboard("6");

            $("#LoginDiv").css('display', 'none');
            //hide short pick data if user clicks abort batch during short pick
            $("#shortPickDiv").css('display', 'none');
            //hide picking data when user routes back from abort batch
            hidePickingScreens();
            //hide batch set up div when user routes back to dashboard from batch setup
            $("#batchSetupTitle").css('display', 'none');
            $("#BatchSetupTBs").css('display', 'none');
            $("#batchSetupButtonsDiv").css('display', 'none');
            $("#id01").css('display', 'none');
            //hide batch data and batch complete data to route back to dashboard from batch complete
            $("#batchCompleteTitle").css('display', 'none');
            $("#BatchCompleteDiv").css('display', 'none');
            $("#batchCompleteButtonsDiv").css('display', 'none');
            $("#BatchDataDiv").css('display', 'none');
            $("#zoneSelectDiv").css('display', 'none');
            $("#zoneSelectTite").css('display', 'none');
            //SHOW DASHBOARD INFO
            $("#dashboardTitle").css('display', 'block');
            $("#workDashboardDiv").css('display', 'block');

        }

        // 4 if statements for Action = Batch Setup
        if (action === "Batch Setup" && subAction === "Next LPN Pos") {

            getToteMatrix(evt.data);
            checkForErrors();
            //hide
            $("#StartAisleDiv").css('display', 'none');
            $("#LoginDiv").css('display', 'none');
            $("#zoneSelectDiv").css('display', 'none');
            $("#zoneSelectTite").css('display', 'none');
            $("#LoginDiv").css('display', 'none');
            $("#dashboardTitle").css('display', 'none');
            $("#workDashboardDiv").css('display', 'none');
            //SHOW
            $("#batchSetupTitle").css('display', 'block');
            $("#BatchSetupTBs").css('display', 'block');
            $("#batchSetupButtonsDiv").css('display', 'block');
            $("#id01").css('display', 'block');

            document.getElementById("MainContent_LPNTB").focus();
        }

        // 5 if statements for starting aisle
        if (action === "Start Aisle" && subAction === "Prompt") {
            hidePickingScreens();
            checkForErrors();
            //HIDE
            $("#id01").css('display', 'none');
            $("#dashboardTitle").css('display', 'none');
            $("#workDashboardDiv").css('display', 'none');
            $("#batchSetupTitle").css('display', 'none');
            $("#BatchSetupTBs").css('display', 'none');
            $("#batchSetupButtonsDiv").css('display', 'none');
            //SHOW
            $("#StartAisleDiv").css('display', 'block');
            document.getElementById("MainContent_startAisleTB").focus();
        }


        // 6 if statements for Action = Present Pick


        if (action === "Location Validation" && subAction === "Prompt") {
            checkForErrors();

            populatePickingScreens();
            //hide reprint labels div after labels printed and return to picking or validation
            $("#rePrintLabelsDiv").css('display', 'none');
            //hide
            $("#id01").css('display', 'none');
            $("#validatePartDiv").css('display', 'none');
            $("#validateLPNDiv").css('display', 'none');
            //show
            $("#validateLocationDiv").css('display', 'block');
            document.getElementById("MainContent_fullToteButton").disabled = true;
            document.getElementById("MainContent_taskCompleteButton").disabled = true;
            document.getElementById("MainContent_validateLocationTB").focus();

            //hide the task complete button
        }
        if (action === "Part Validation" && subAction === "Prompt") {
            populatePickingScreens();
            checkForErrors();

            //HIDE
            $("#rePrintLabelsDiv").css('display', 'none');

            $("#id01").css('display', 'none');
            $("#validateLocationDiv").css('display', 'none');
            $("#validateLPNDiv").css('display', 'none');

            document.getElementById("MainContent_fullToteButton").disabled = true;
            document.getElementById("MainContent_taskCompleteButton").disabled = true;
            //SHOW
            $("#validatePartDiv").css('display', 'block');
            document.getElementById("MainContent_validatePartTB").focus();

            //hide the task complete button
        }
        if (action === "Present Pick" && subAction === "Display Complete Task") {
            populatePickingScreens();
            getToteMatrix(evt.data);
            checkForErrors();

            //HIDE
            $("#rePrintLabelsDiv").css('display', 'none');

            $("#validateLocationDiv").css('display', 'none');
            $("#validateLPNDiv").css('display', 'none');
            $("#validatePartDiv").css('display', 'none');
            //SHOW
            $("#id01").css('display', 'block');

        }

        if (action === "Present Pick" && subAction === "Display Complete Task with LPN Validation") {
            populatePickingScreens();
            getToteMatrix(evt.data);
            checkForErrors();
            //HIDE
            $("#rePrintLabelsDiv").css('display', 'none');

            $("#validateLocationDiv").css('display', 'none');
            $("#validatePartDiv").css('display', 'none');
            //SHOW
            $("#id01").css('display', 'block');
            document.getElementById("MainContent_taskCompleteButton").disabled = true;
            $("#validateLPNDiv").css('display', 'block');
            document.getElementById("MainContent_validateLPNTB").focus();

        }


        if (action === "Batch Complete" && subAction === "Display") {
            getToteMatrix(evt.data);
            checkForErrors();
            //HIDE
            $("#LoginDiv").css('display', 'none');
            $("#StartAisleDiv").css('display', 'none');
            $("#directionalDisplayDiv").css('display', 'none');
            $("#partNumberAndDescriptionDiv").css('display', 'none');
            $("#locationAndQtyDiv").css('display', 'none');
            $("#button-div").css('display', 'none');
            $("#CartPickingTitle").css('display', 'none');
            $("#userFieldDiv").css('display', 'none');
            $("#validateLPNDiv").css('display', 'none');

            //SHOW
            $("#BatchDataDiv").css('display', 'block');
            $("#batchCompleteTitle").css('display', 'block');
            $("#id01").css('display', 'block');
            $("#batchCompleteButtonsDiv").css('display', 'block');

        }

        if (action === "Early Exit" && subAction === "Display") {
            checkForErrors();

            //HIDE
            $("#loginDiv").css('display', 'none');
            $("#CartPickingTitle").css('display', 'none');
            $("#button-div").css('display', 'none');
            $("#locationAndQtyDiv").css('display', 'none');
            $("#partNumberAndDescriptionDiv").css('display', 'none');
            $("#userFieldDiv").css('display', 'none');
            $("#directionalDisplayDiv").css('display', 'none');
            $("#validateLocationDiv").css('display', 'none');
            $("#errorDiv").css('display', 'none');

            $("#validatePartDiv").css('display', 'none');


            //SHOW
            $("#earlyExitTitle").css('display', 'block');
            $("#earlyExitButtons").css('display', 'block');
            $("#id01").css('display', 'block');

        }

        //if the same fields from lpn Validation i.e. Display data, batch data then full tote can be moved up with
        //the other if statements

        if (action === "Full Tote" && subAction !== "Request" && subAction !== "Full Tote Response" && subAction !== "Current Qty Response" && subAction !== "New Tote Response" && subAction !== "Scanned Tote") {

            checkForErrors();

            $("#button-div").css('display', 'none');
            $("#BatchDataDiv").css('display', 'none');
            $("#fullToteInfoDiv").css('display', 'block');

            var fullToteNumber = myObj.DisplayData[0].FullTote;
            var fullToteQty = myObj.DisplayData[0].FullToteQty;
            var newFullToteQty = myObj.DisplayData[0].NewToteQty;

            document.getElementById("fullToteNumber").innerHTML = fullToteNumber;
            document.getElementById("fullToteQty").innerHTML = fullToteQty;
            document.getElementById("newFullToteQty").innerHTML = newFullToteQty;


            if (subAction === "Prompt Full Tote") {
                $("#promptFullToteDiv").css('display', 'block');
                document.getElementById('MainContent_promptFullToteTB').focus();
            }
            if (subAction === "Prompt Current Qty") {
                $("#promptCurrentQtyDiv").css('display', 'block');
                $("#promptFullToteDiv").css('display', 'none');
                document.getElementById('MainContent_promptCurrentQtyTB').focus();
            }
            if (subAction === "Prompt New Tote") {
                $("#promptCurrentQtyDiv").css('display', 'none');
                $("#promptFullToteDiv").css('display', 'none');
                $("#promptNewToteDiv").css('display', 'block');
                document.getElementById('MainContent_promptNewToteTB').focus();
            }


        }

        if (action === "Reprint Labels" && subAction === "Display") {
            checkForErrors();
            //HIDE
            $("#validateLocationDiv").css('display', 'none');
            $("#validatePartDiv").css('display', 'none');
            $("#validateLPNDiv").css('display', 'none');
            $("#id01").css('display', 'none');

            //SHOW
            $("#rePrintLabelsDiv").css('display', 'block');


        }

        if (action === "Re-Light Last Pick" && subAction === "Light") {
            checkForErrors();
            //HIDE
            $("#CartPickingTitle").css('display', 'none');
            $("#button-div").css('display', 'none');
            $("#validateLocationDiv").css('display', 'none');
            $("#validatePartDiv").css('display', 'none');
            $("#validateLPNDiv").css('display', 'none');

            //SHOW
            $("#lastPickTitle").css('display', 'block');
            $("#lastPickButtonDiv").css('display', 'block');
            $("#id01").css('display', 'block');

        }
        if (action === "Short Pick" && subAction === "Display") {

            checkForErrors();
            $("#shortPickDiv").css('display', 'block');
            document.getElementById('MainContent_sendShortPickTB').focus();



        }

        if (action === "Short Pick" && subAction === "Response") {

            checkForErrors();
            $("#shortPickDiv").css('display', 'block');
            document.getElementById('MainContent_sendShortPickTB').focus();



        }

        function populatePickingScreens() {

            $("#LoginDiv").css('display', 'none');
            $("#StartAisleDiv").css('display', 'none');
            $("#promptNewToteDiv").css('display', 'none');
            $("#fullToteInfoDiv").css('display', 'none');
            $("#lastPickButtonDiv").css('display', 'none');
            $("#lastPickTitle").css('display', 'none');
            $("#lastPickButtonDiv").css('display', 'none');
            $("#shortPickDiv").css('display', 'none');

            //SHOW
            $("#CartPickingTitle").css('display', 'block');
            $("#directionalDisplayDiv").css('display', 'block');
            $("#userFieldDiv").css('display', 'block');
            $("#infoBox").css('display', 'block');
            $("#partNumberAndDescriptionDiv").css('display', 'block');
            $("#locationAndQtyDiv").css('display', 'block');
            $("#BatchDataDiv").css('display', 'block');
            $("#button-div").css('display', 'block');

            checkForErrors();
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

            ////Batchdata Variables

            var remainingPickLines = myObj.BatchData[0].RemainingPickLines;
            var remainingLocs = myObj.BatchData[0].RemainingLocs;
            var currentPicksPerHourRate = myObj.BatchData[0].CurrentPicksPerHourRate;

            document.getElementById("remainingPickLines").innerHTML = remainingPickLines;
            document.getElementById("remainingLocs").innerHTML = remainingLocs;
            document.getElementById("currentPicksPerHourRate").innerHTML = currentPicksPerHourRate;
        }

        function checkForErrors() {

            if (errorMessage !== '' && errorMessage !== undefined) {
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


    };
    ws.onopen = function () {
        // alert("Web Socket Open");
        $("#connectingDiv").css('display', 'none');
        $("#connectedDiv").css('display', 'block');

        $("#toteDiv").css('display', 'none');

    };


};


function hidePickingScreens() {

    $("#directionalDisplayDiv").css('display', 'none');
    $("#userFieldDiv").css('display', 'none');
    $("#partNumberAndDescriptionDiv").css('display', 'none');
    $("#locationAndQtyDiv").css('display', 'none');
    $("#button-div").css('display', 'none');
    $("#CartPickingTitle").css('display', 'none');

    $("#BatchDataDiv").css('display', 'none');
    $("#validatePartDiv").css('display', 'none');
    $("#validateLocationDiv").css('display', 'none');
    $("#id01").css('display', 'none');

}

