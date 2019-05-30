function sendCartNum() {

    var cartNum = document.getElementById('MainContent_Content_cartNumTB').value;

    var data = JSON.stringify({ "Action": "CartSetup", "Cart": cartNum });
    console.log(data);
    console.log("send data");
    //ws.send(data);
    //console.log("data sent");
}

function sendLPN() {

    var cartNum = document.getElementById('MainContent_Content_cartNumTB').value;
    var LPN = document.getElementById('MainContent_Content_LPNTB').value;


    var data = JSON.stringify({ "Action": "CartSetup", "Cart": cartNum, "LPN": LPN });
    console.log(data);
    console.log("send data");
    //ws.send(data);
    //console.log("data sent");
}

var start = function () {

    var myJSON = '{"Action": "CartSetup", "SubAction": "Scan", "OverallTC": false, "ErrorMessage": "", "UserResponse": "", "DisplayData":' +
        '[' +
        '{ "Cart": "666", "Part": "777", "Part Desc 1": "", "Part Desc 2": "", "User Field": "", "HostLocation": "", "PoweredPIKLocation": "", "TotalPickQty": "5", "StartingAisle": "" }' +
        '], "AlphaPos":' +
        '[' +
        '{ "Pos": "1", "Message": "", "Color": 1, "BlinkSpeed": 0, "Buzzer": true, "Enable": true },' +
        '{ "Pos": "2", "Message": "", "Color": 1, "BlinkSpeed": 0, "Buzzer": false, "Enable": true }' +
        '], "BatchPos":' +
        '[' +
        '{ "Pos": "1", "Order": "", "Container": "", "LPN": "1111", "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true },' +
        '{ "Pos": "2", "Order": "", "Container": "", "LPN": "2222", "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true },' +
        '{ "Pos": "3", "Order": "", "Container": "", "LPN": "3333", "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true },' +
        '{ "Pos": "4", "Order": "", "Container": "", "LPN": "4444", "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true },' +
        '{ "Pos": "5", "Order": "", "Container": "", "LPN": "5555", "Display": "", "TC": false, "Color": 1, "BlinkSpeed": 0, "Enable": true, "Visible": true }' +
        '], "Labels":' +
        '[' +
        '{ "LabelType": "1", "NumberofLabels": "" }' +
        ']' +
        '}';

    var myObj = JSON.parse(myJSON);
    //setting variables with data
    document.getElementById("Cart").innerHTML = myObj.DisplayData[0].Cart;
    console.log(myObj.DisplayData[0].Cart);
    console.log(myObj.Action);
    document.getElementById("Part").innerHTML = myObj.DisplayData[0].Part;
    document.getElementById("Location").innerHTML = myObj.DisplayData[0].HostLocation;
    // JSON variables
    var action = myObj.Action;
    var subAction = myObj.SubAction;
    var overallTC = myObj.OverallTC;
    var errorMessage = myObj.ErrorMessage;
    var userResponse = myObj.UserResponse;
    var cartNumTB = myObj.DisplayData[0].Cart;


    //label variables
    var labelType = myObj.Labels[0].LabelType;
    var numberOfLabels = myObj.Labels[0].NumberofLabels;

    //cart variables
    var cart = myObj.DisplayData[0].Cart;
    var part = myObj.DisplayData[0].Part;
    var partDesc1 = myObj.DisplayData[0].PartDesc1;
    var partDesc2 = myObj.DisplayData[0].PartDesc2;
    var userField = myObj.DisplayData[0].UserField;
    var hostLocation = myObj.DisplayData[0].HostLocation;
    var poweredPIKLocation = myObj.DisplayData[0].PoweredPIKLocation;
    var totalPickQty = myObj.DisplayData[0].TotalPickQty;
    var startingAisle = myObj.DisplayData[0].StartingAisle;

    //pos1 variables
    var pos1 = myObj.BatchPos[0].Pos;
    var pos1Order = myObj.BatchPos[0].Order;
    var pos1Container = myObj.BatchPos[0].Container;
    var pos1LPN = myObj.BatchPos[0].LPN;
    var pos1Display = myObj.BatchPos[0].Display;
    var pos1TC = myObj.BatchPos[0].TC;
    var pos1Color = myObj.BatchPos[0].Color;
    var pos1BlinkSpeed = myObj.BatchPos[0].BlinkSpeed;
    var pos1Enable = myObj.BatchPos[0].Enable;
    var pos1Visible = myObj.BatchPos[0].Visible;
    //pos2 variables
    var pos2 = myObj.BatchPos[1].Pos;
    var pos2Order = myObj.BatchPos[1].Order;
    var pos2Container = myObj.BatchPos[1].Container;
    var pos2LPN = myObj.BatchPos[1].LPN;
    var pos2Display = myObj.BatchPos[1].Display;
    var pos2TC = myObj.BatchPos[1].TC;
    var pos2Color = myObj.BatchPos[1].Color;
    var pos2BlinkSpeed = myObj.BatchPos[1].BlinkSpeed;
    var pos2Enable = myObj.BatchPos[1].Enable;
    var pos2Visible = myObj.BatchPos[1].Visible;
    //pos3 variables
    var pos3 = myObj.BatchPos[2].Pos;
    var pos3Order = myObj.BatchPos[2].Order;
    var pos3Container = myObj.BatchPos[2].Container;
    var pos3LPN = myObj.BatchPos[2].LPN;
    var pos3Display = myObj.BatchPos[2].Display;
    var pos3TC = myObj.BatchPos[2].TC;
    var pos3Color = myObj.BatchPos[2].Color;
    var pos3BlinkSpeed = myObj.BatchPos[2].BlinkSpeed;
    var pos3Enable = myObj.BatchPos[2].Enable;
    var pos3Visible = myObj.BatchPos[2].Visible;

    //pos4 variables
    var pos4 = myObj.BatchPos[3].Pos;
    var pos4Order = myObj.BatchPos[3].Order;
    var pos4Container = myObj.BatchPos[3].Container;
    var pos4LPN = myObj.BatchPos[3].LPN;
    var pos4Display = myObj.BatchPos[3].Display;
    var pos4TC = myObj.BatchPos[3].TC;
    var pos4Color = myObj.BatchPos[3].Color;
    var pos4BlinkSpeed = myObj.BatchPos[3].BlinkSpeed;
    var pos4Enable = myObj.BatchPos[3].Enable;
    var pos4Visible = myObj.BatchPos[3].Visible;

    //pos5 variables
    var pos5 = myObj.BatchPos[4].Pos;
    var pos5Order = myObj.BatchPos[4].Order;
    var pos5Container = myObj.BatchPos[4].Container;
    var pos5LPN = myObj.BatchPos[4].LPN;
    var pos5Display = myObj.BatchPos[4].Display;
    var pos5TC = myObj.BatchPos[4].TC;
    var pos5Color = myObj.BatchPos[4].Color;
    var pos5BlinkSpeed = myObj.BatchPos[4].BlinkSpeed;
    var pos5Enable = myObj.BatchPos[4].Enable;
    var pos5Visible = myObj.BatchPos[4].Visible;

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

    // if statement variables

    //if statements for Action = CartSetup
    if (action === "CartSetup") {

        $("#CartSetupTitle").css('display', 'block');
        $("#CartSetupTBs").css('display', 'block');
        document.getElementById("MainContent_Content_cartNumTB").focus();
    }
    if (action === "CartSetup" && subAction === "ScanTote") {
        $("#CartSetupTitle").css('display', 'block');
        $("#CartSetupTBs").css('display', 'block');
        document.getElementById("MainContent_Content_cartNumTB").value = cartNumTB;
        document.getElementById("MainContent_Content_LPNTB").focus();

    };
    if (action === "Login") {

        $("#LoginDiv").css('display', 'block');
    }
    //if statements for Action = Pick
    if (action === "Pick") {
        
        
        $("#CartPickingTitle").css('display', 'block');
        $("#CartPickingTBs").css('display', 'block');

        $("#pickDiv").css('display', 'block');
        document.getElementById("MainContent_Content_ToteScanTB").focus();
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