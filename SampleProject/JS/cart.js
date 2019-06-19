var start1 = function () {

    //var myJSON = '{ "Action": "CartSetup", "SubAction": "", "Cart": "", "CartPositions": "", "OverallTC": false, "ErrorMessage": "", "UserResponse1": "", "UserResponse2": "", "UserResponse3": "", "DisplayData":' +
    //    '[' +
    //    '{ "Part": "p666", "PartDesc1": "", "PartDesc2": "", "UserField": "", "Location": "", "DirectionalDisplay": "", "TotalPickQty": "5", "StartingAisle": "", "FullTote": "", "FullToteQty": "", "NewToteQty": "" }' +
    //    '], "BatchData":' +
    //    '[' +
    //    '{ "RemainingPickLines": 0, "RemainingLocs": 0, "CurrentPicksPerHourRate":0 }' +
    //    '], "AlphaPos":' +
    //    '[' +
    //    '{ "Pos": "1", "PrimaryModule":1, "SecondaryModule":3, "Message": "", "Color": 1, "BlinkSpeed": 0, "Buzzer": true, "Enable": true },' +
    //    '{ "Pos": "2", "PrimaryModule":2, "SecondaryModule":4, "Message": "", "Color": 1, "BlinkSpeed": 0, "Buzzer": false, "Enable": true }' +
    //    '], "BatchPos":' +
    //    '[' +
    //    '{ "Pos": "1", "PrimaryModule":1, "SecondaryModule":51, "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true },' +
    //    '{ "Pos": "2", "PrimaryModule":2, "SecondaryModule":52, "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true },' +
    //    '{ "Pos": "3", "PrimaryModule":3, "SecondaryModule":53, "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true },' +
    //    '{ "Pos": "4", "PrimaryModule":4, "SecondaryModule":54, "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true },' +
    //    '{ "Pos": "5", "PrimaryModule":5, "SecondaryModule":55, "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true }' +
    //    ']' +
    //    '}';


    //var sidJSON = '{"sid": "645613434556789"}';

    //var MYsid = JSON.parse(sidJSON);
    //var sid = MYsid.sid;
    //console.log(sid);

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
        //document.getElementById("Cart").innerHTML = myObj.Cart;
        //document.getElementById("Part").innerHTML = myObj.DisplayData[0].Part;
        //document.getElementById("Location").innerHTML = myObj.DisplayData[0].Location;
        //console.log(myObj.DisplayData[0].Part);


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

        //Display Data Variables

        //var part = myObj.DisplayData[0].Part;
        //var partDesc1 = myObj.DisplayData[0].PartDesc1;
        //var partDesc2 = myObj.DisplayData[0].PartDesc2;
        //var userField = myObj.DisplayData[0].UserField;
        //var Location = myObj.DisplayData[0].Location;
        //var directionalDisplay = myObj.DisplayData[0].DirectionalDisplay;
        //var totalPickQty = myObj.DisplayData[0].TotalPickQty;
        //var startingAisle = myObj.DisplayData[0].StartingAisle;
        //var fullTote = myObj.DisplayData[0].fullTote;
        //var fullToteQty = myObj.DisplayData[0].FullToteQty;
        //var newToteQty = myObj.DisplayData[0].NewToteQty;

        ////Batchdata Variables

        //var remainingPickLines = myObj.BatchData[0].RemainingPickLines;
        //var remainingLocs = myObj.BatchData[0].RemainingLocs;
        //var currentPicksPerHourRate = myObj.BatchData[0].CurrentPicksPerHourRate;

        // 1 if statement variables PAGE 1 IN PICKING PROCESS
        if (action === "Login" && subAction === "Response") {

            $("#LoginDiv").css('display', 'block');
            $("#toteDiv").css('display', 'none');

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
        }

        // 3 if statement to present work dashboard
        if (action === "Work Dashboard" && subAction === "Present") {

            $("#workDashboardDiv").css('display', 'block');

        }

        // 4 if statements for Action = Batch Setup
        if (action === "Batch Setup" && subAction === "Next LPN Pos") {

            $("#LoginDiv").css('display', 'none');

            $("#BatchSetupTBs").css('display', 'block');
            document.getElementById("MainContent_ScanToteTB").focus();
        }

        // 5 if statements for starting aisle
        if (action === "Start Aisle" && subAction === "Prompt") {

            $("#StartAisleDiv").css('display', 'block');
            $("#BatchSetupTBs").css('display', 'none');
            document.getElementById("MainContent_startAisleTB").focus();
        }

        // 6 if statements for Action = Present Pick
        if (action === "Present Pick" && subAction === "Display Complete Task") {
            $("#LoginDiv").css('display', 'none');
            $("#CartPickingTitle").css('display', 'block');
            $("#id01").css('display', 'block');

            $("#pickStatsDiv").css('display', 'block');

            $("#button-div").css('display', 'block');
            document.getElementById("MainContent_ToteScanTB").focus();
        }

        if (action === "Present Pick" && subAction === "Display Complete Task with LPN Validation") {

            $("#CartPickingTitle").css('display', 'block');
            $("#CartPickingTBs").css('display', 'block');

            $("#pickStatsDiv").css('display', 'block');
            document.getElementById("MainContent_ToteScanTB").focus();
            $("#button-div").css('display', 'block');
            //hide the task complete button
        }

        if (action === "Batch Complete" && subAction === "Display") {
            $("#batchCompleteTitle").css('display', 'block');
            $("#BatchCompleteDiv").css('display', 'block');

        }

    };
    ws.onopen = function () {
        alert("in Open");
        $("#connectingDiv").css('display', 'none');
        $("#connectedDiv").css('display', 'block');

        $("#toteDiv").css('display', 'none');

    };

};
//functions for buttons
function sendLogin() {

    var UserID = document.getElementById('UserID').value;
    var Password = document.getElementById('PWD').value;
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
    console.log("send data");
    ws.send(data);
    console.log("data sent");
}

function sendLPN() {

    var LPN = document.getElementById('MainContent_LPNTB').value;
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "LPN Scanned", "Cart": cart, "LPN": LPN });
    console.log(data);
    console.log("send data");
    ws.send(data);
    console.log("data sent");
}
function processBatch() {

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "Process Batch", "Cart": cart });
    console.log(data);
    console.log("send data");
    ws.send(data);
    console.log("data sent");
}

function sendLocnEmpty() {

    var emptyLocn = prompt("Scan Empty Location");
    var data = JSON.stringify({ "Action": "Notify Host Locn Empty", "SubAction": "Request", "Cart": cart, "UserResponse1": emptyLocn });
    console.log(data);
    console.log("send data");
    ws.send(data);
    console.log("data sent");


}

function sendStartAisle() {

    var aisle = document.getElementById('MainContent_startAisleTB').value;
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "Response", "Cart": cart, "UserResponse1": aisle });
    console.log(data);
    console.log("send data");
    ws.send(data);
    console.log("data sent");
}


function sendBack() {

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "Clear Cart", "Cart": cart });
    console.log(data);
    console.log("send data");
    ws.send(data);
    console.log("data sent");

}
