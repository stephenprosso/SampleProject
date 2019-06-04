var start = function () {
    var inc = document.getElementById('incomming');
    var wsImpl = window.WebSocket || window.MozWebSocket;
    var form = document.getElementById('sendForm');
    var input = document.getElementById('sendText');

    //inc.innerHTML += "connecting to server ..<br/>";

    // create a new websocket and connect
    var cart = new URLSearchParams(window.location.search).get("cart");
    window.ws = new wsImpl('ws://192.168.128.152:8181/');
    //window.ws = new wsImpl('ws://192.168.128.237:8181/' + cart);
    console.log(wsImpl);
    console.log(cart);
    // when data is comming from the server, this metod is called
    ws.onmessage = function (evt) {


        inc.innerHTML += evt.data + '<br/>';


        var obj = JSON.parse(evt.data);


    };

    // when the connection is established, this method is called
    ws.onopen = function () {
        inc.innerHTML += '.. connection open<br/>';
    };

    // when the connection is closed, this method is called
    ws.onclose = function () {
        inc.innerHTML += '.. connection closed<br/>';
    };

    form.addEventListener('submit', function (e) {
        e.preventDefault();
        var val = input.value;
        ws.send(val);
        input.value = "";
    });

};


function wssend() {
    console.log("wssend clicked");
    var UserID = document.getElementById('UserID').value;
    var Password = document.getElementById('PWD').value;

    var data = JSON.stringify({ "action": "initializeSID", "username": UserID, "password": Password });
    console.log(data);
    console.log("send data");
    ws.send(data);
    console.log("data sent");
}

function sendCartNum() {

    var cartNum = document.getElementById('MainContent_cartNumTB').value;

    var data = JSON.stringify({ "Action": "CartSetup", "Cart": cartNum });
    console.log(data);
    console.log("send data");
    //ws.send(data);
    //console.log("data sent");
}

function sendLPN() {

    var cartNum = document.getElementById('MainContent_cartNumTB').value;
    var LPN = document.getElementById('MainContent_LPNTB').value;


    var data = JSON.stringify({ "Action": "CartSetup", "Cart": cartNum, "LPN": LPN });
    console.log(data);
    console.log("send data");
    //ws.send(data);
    //console.log("data sent");
}

var start1 = function () {

    var myJSON = '{ "Action": "CartSetup", "SubAction": "", "Cart": "", "CartPositions": "", "OverallTC": false, "ErrorMessage": "", "UserResponse1": "", "UserResponse2": "", "UserResponse3": "", "DisplayData":' +
        '[' +
        '{ "Part": "p666", "PartDesc1": "", "PartDesc2": "", "UserField": "", "Location": "", "DirectionalDisplay": "", "TotalPickQty": "5", "StartingAisle": "", "FullTote": "", "FullToteQty": "", "NewToteQty": "" }' +
        '], "BatchData":' +
        '[' +
        '{ "RemainingPickLines": "", "RemainingLocs": "", "CurrentPicksPerHourRate": "" }' +
        '], "AlphaPos":' +
        '[' +
        '{ "Pos": "1", "PrimaryModule":1, "SecondaryModule":3, "Message": "", "Color": 1, "BlinkSpeed": 0, "Buzzer": true, "Enable": true },' +
        '{ "Pos": "2", "PrimaryModule":2, "SecondaryModule":4, "Message": "", "Color": 1, "BlinkSpeed": 0, "Buzzer": false, "Enable": true }' +
        '], "BatchPos":' +
        '[' +
        '{ "Pos": "1", "PrimaryModule":1, "SecondaryModule":51, "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true },' +
        '{ "Pos": "2", "PrimaryModule":2, "SecondaryModule":52, "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true },' +
        '{ "Pos": "3", "PrimaryModule":3, "SecondaryModule":53, "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true },' +
        '{ "Pos": "4", "PrimaryModule":4, "SecondaryModule":54, "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true },' +
        '{ "Pos": "5", "PrimaryModule":5, "SecondaryModule":55, "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true }' +
        ']' +
        '}';



    var myObj = JSON.parse(newJSON);
    //setting variables with data
    document.getElementById("Cart").innerHTML = myObj.Cart;
    console.log(myObj.Cart);
    console.log(myObj.Action);
    document.getElementById("Part").innerHTML = myObj.DisplayData[0].Part;
    document.getElementById("Location").innerHTML = myObj.DisplayData[0].Location;
    // JSON variables
    var action = myObj.Action;
    var subAction = myObj.SubAction;
    var cart = myObj.Cart;
    var cartPositions = myObj.CartPositions;
    var overallTC = myObj.OverallTC;
    var errorMessage = myObj.ErrorMessage;
    var cartNumTB = myObj.Cart;


    //Display Data Variables
    var part = myObj.DisplayData[0].Part;
    var partDesc1 = myObj.DisplayData[0].PartDesc1;
    var partDesc2 = myObj.DisplayData[0].PartDesc2;
    var userField = myObj.DisplayData[0].UserField;
    var Location = myObj.DisplayData[0].Location;
    var directionalDisplay = myObj.DisplayData[0].DirectionalDisplay;
    var totalPickQty = myObj.DisplayData[0].TotalPickQty;
    var startingAisle = myObj.DisplayData[0].StartingAisle;
    var fullTote = myObj.DisplayData[0].fullTote;
    var fullToteQty = myObj.DisplayData[0].FullToteQty;
    var newToteQty = myObj.DisplayData[0].NewToteQty;

    //Batchdata Variables

    var remainingPickLines = myObj.BatchData[0].RemainingPickLines;
    var remainingLocs = myObj.BatchData[0].RemainingLocs;
    var currentPicksPerHourRate = myObj.BatchData[0].CurrentPicksPerHourRate;

    //alpha 1 Position Variables
    var alphaPos1 = myObj.AlphaPos[0].Pos;
    var alphaPos1Message = myObj.AlphaPos[0].Message;
    var alphaPos1Color = myObj.AlphaPos[0].Color;
    var alphaPos1BlinkSpeed = myObj.AlphaPos[0].BlinkSpeed;
    var alphaPos1Buzzer = myObj.AlphaPos[0].Buzzer;
    var alphaPos1Enable = myObj.AlphaPos[0].Enable;

    //alpha 2 Position Variables
    var alphaPos2 = myObj.AlphaPos[1].Pos;
    var alphaPos2Message = myObj.AlphaPos[1].Message;
    var alphaPos2Color = myObj.AlphaPos[1].Color;
    var alphaPos2BlinkSpeed = myObj.AlphaPos[1].BlinkSpeed;
    var alphaPos2Buzzer = myObj.AlphaPos[1].Buzzer;
    var alphaPos2Enable = myObj.AlphaPos[1].Enable;

    //BatchPos Variable
    //pos1 variables
    var pos1 = myObj.BatchPos[0].Pos;
    var pos1Display = myObj.BatchPos[0].Display;
    var pos1TC = myObj.BatchPos[0].TC;
    var pos1Color = myObj.BatchPos[0].Color;
    var pos1BlinkSpeed = myObj.BatchPos[0].BlinkSpeed;
    var pos1Enable = myObj.BatchPos[0].Enable;
    var pos1Visible = myObj.BatchPos[0].Visible;
    //pos2 variables
    var pos2 = myObj.BatchPos[1].Pos;
    var pos2Display = myObj.BatchPos[1].Display;
    var pos2TC = myObj.BatchPos[1].TC;
    var pos2Color = myObj.BatchPos[1].Color;
    var pos2BlinkSpeed = myObj.BatchPos[1].BlinkSpeed;
    var pos2Enable = myObj.BatchPos[1].Enable;
    var pos2Visible = myObj.BatchPos[1].Visible;
    //pos3 variables
    var pos3 = myObj.BatchPos[2].Pos;
    var pos3Display = myObj.BatchPos[2].Display;
    var pos3TC = myObj.BatchPos[2].TC;
    var pos3Color = myObj.BatchPos[2].Color;
    var pos3BlinkSpeed = myObj.BatchPos[2].BlinkSpeed;
    var pos3Enable = myObj.BatchPos[2].Enable;
    var pos3Visible = myObj.BatchPos[2].Visible;

    //pos4 variables
    var pos4 = myObj.BatchPos[3].Pos;
    var pos4Display = myObj.BatchPos[3].Display;
    var pos4TC = myObj.BatchPos[3].TC;
    var pos4Color = myObj.BatchPos[3].Color;
    var pos4BlinkSpeed = myObj.BatchPos[3].BlinkSpeed;
    var pos4Enable = myObj.BatchPos[3].Enable;
    var pos4Visible = myObj.BatchPos[3].Visible;

    //pos5 variables
    var pos5 = myObj.BatchPos[4].Pos;
    var pos5Display = myObj.BatchPos[4].Display;
    var pos5TC = myObj.BatchPos[4].TC;
    var pos5Color = myObj.BatchPos[4].Color;
    var pos5BlinkSpeed = myObj.BatchPos[4].BlinkSpeed;
    var pos5Enable = myObj.BatchPos[4].Enable;
    var pos5Visible = myObj.BatchPos[4].Visible;



    // if statement variables
    if (action === "Login") {

        $("#LoginDiv").css('display', 'block');
        $("#toteDiv").css('display', 'none');

    }
    //if statements for Action = CartSetup
    if (action === "CartSetup") {

        $("#CartSetupTitle").css('display', 'block');
        $("#CartSetupTBs").css('display', 'block');
        document.getElementById("MainContent_cartNumTB").focus();
    }
    if (action === "CartSetup" && subAction === "ScanTote") {
        $("#CartSetupTitle").css('display', 'block');
        $("#CartSetupTBs").css('display', 'block');
        document.getElementById("MainContent_cartNumTB").value = cartNumTB;
        document.getElementById("MainContent_LPNTB").focus();

    };
    //if statements for Action = Pick
    if (action === "Pick") {


        $("#CartPickingTitle").css('display', 'block');
        $("#CartPickingTBs").css('display', 'block');

        $("#pickDiv").css('display', 'block');
        document.getElementById("MainContent_ToteScanTB").focus();
        $("#button-div").css('display', 'block');
        if (pos1 === "1") {
            //document.getElementById("TBID1").style.backgroundColor = "Green";
            //document.getElementById("TBID1").value = orderNum1;
            document.getElementById("TBID1").value = pos1LPN;


        } if (pos2 === "2") {
            //document.getElementById("TBID2").style.backgroundColor = "Pink";
            //document.getElementById("TBID2").value = orderNum2;
            document.getElementById("TBID2").value = pos2LPN;


        } if (pos3 === "3") {
            document.getElementById("TBID3").value = pos3LPN;


        }
        if (pos4 === "4") {
            document.getElementById("TBID4").value = pos4LPN;


        } if (pos5 === "5") {
            document.getElementById("TBID5").value = pos5LPN;


        }
        // if (pos3 === "6") {
        //    document.getElementById("TBID6").value = requestQty3;


        //} if (pos3 === "7") {
        //    document.getElementById("TBID7").value = requestQty3;


        //} if (pos3 === "8") {
        //    document.getElementById("TBID8").value = requestQty3;


        //} if (pos3 === "9") {
        //    document.getElementById("TBID9").value = requestQty3;
        //} if (pos3 === "10") {
        //    document.getElementById("TBID10").value = requestQty3;
        //} if (pos3 === "11") {
        //    document.getElementById("TBI11").value = requestQty3;
        //} if (pos3 === "12") {
        //    document.getElementById("TBID12").value = requestQty3;
        //} if (pos3 === "13") {
        //    document.getElementById("TBID13").value = requestQty3;
        //} if (pos3 === "14") {
        //    document.getElementById("TBID14").value = requestQty3;
        //} if (pos3 === "15") {
        //    document.getElementById("TBID15").value = requestQty3;
        //} if (pos3 === "16") {
        //    document.getElementById("TBID16").value = requestQty3;
        //} if (pos3 === "17") {
        //    document.getElementById("TBID17").value = requestQty3;
        //} if (pos3 === "18") {
        //    document.getElementById("TBID18").value = requestQty3;
        //} if (pos3 === "19") {
        //    document.getElementById("TBID19").value = requestQty3;
        //}
    }

};
function ChangeQT() {
    var newQT = prompt("Enter New QT");
    alert(newQT);
};