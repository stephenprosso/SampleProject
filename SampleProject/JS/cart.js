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


    var sidJSON = '{"sid": "645613434556789"}';

    var sid = JSON.parse(sidJSON);
    var nothingToSeeHere = sid.sid;

    var inc = document.getElementById('incomming');
    var wsImpl = window.WebSocket || window.MozWebSocket;
    var form = document.getElementById('sendForm');
    var input = document.getElementById('sendText');

    //inc.innerHTML += "connecting to server ..<br/>";

    // create a new websocket and connect
    //var cart = new URLSearchParams(window.location.search).get("cart");
    window.ws = new wsImpl('ws://promat.dovetree.com:8181/');
    //window.ws = new wsImpl('ws://192.168.128.237:8181/' + cart);
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


        //var myObj = JSON.parse(myJSON);
        //setting variables with data
        //document.getElementById("Cart").innerHTML = myObj.Cart;
        //console.log(myObj.Cart);
        //console.log(myObj.Action);
        //document.getElementById("Part").innerHTML = myObj.DisplayData[0].Part;
        //document.getElementById("Location").innerHTML = myObj.DisplayData[0].Location;
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


        //BatchPos Variable

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

        }
    };

};
function ChangeQT() {
    var newQT = prompt("Enter New QT");
    alert(newQT);
};
function wssend() {
    console.log("wssend clicked");
    var UserID = document.getElementById('UserID').value;
    var Password = document.getElementById('PWD').value;
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "action": "Login", "SubAction": "Initiate", "UserResponse1": cart, "UserResponse2": UserID, "UserResponse3": Password });
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
