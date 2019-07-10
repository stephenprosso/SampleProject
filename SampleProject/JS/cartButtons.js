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
    document.getElementById("MainContent_LPNTB").value = "";
}

function processBatch() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "Process Batch", "Cart": cart });
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
//buttons on the picking screen
//1 
function sendExitBatch() {

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Abort Batch", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");

}


//2
function sendRetryLights() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Retry Lights", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");

}
//3
function sendCompletePick() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Task Complete", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}
//4 
function sendReLightLastPick() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Re-Light Last Pick", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}

//5 
function sendReprintLabels() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Reprint Labels", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}
//6
function sendChangeStartAisle() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Change Start Aisle", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}

//7
function sendEarlyExit() {

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Early Exit", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}


//8
function sendSkipPick() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Skip Pick", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}
//9 
function sendShortPick() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Short Pick", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}

//10 
function sendFullTote() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Full Tote", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}
//11 
function sendLocnEmpty() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Notify Host Locn Empty", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");



}
function sendScanNewLPN() {

    hideEarlyExit();
    hideValidationBox();

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Early Exit", "SubAction": "Scan New LPN", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");

}


function sendEarlyExitAbort() {


    hideEarlyExit();
    hideValidationBox();

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Early Exit", "SubAction": "Abort", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");

}

function hideValidationBox() {

    $("#id01").css('display', 'none');
    $("#validateLPNDiv").css('display', 'none');
    $("#validatePartDiv").css('display', 'none');
    $("#validateLocationDiv").css('display', 'none');

}

function hideEarlyExit() {
    $("#earlyExitTitle").css('display', 'none');
    $("#earlyExitButtons").css('display', 'none');
    $("#directionalDisplayDiv").css('display', 'none');
    $("#partDetailsAndLocationDiv").css('display', 'none');
    $("#userFieldQuantity").css('display', 'none');
    $("#BatchDataDiv").css('display', 'none');
    $("#userFieldDiv").css('display', 'none');

}


function sendCurrentFullTote() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var fullTote = document.getElementById('MainContent_promptFullToteTB').value;
    var data = JSON.stringify({ "Action": "Full Tote", "SubAction": "Scanned Tote", "Cart": cart, "UserResponse1": fullTote });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}

function sendCurrentQty() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var currentQty = document.getElementById('MainContent_promptCurrentQtyTB').value;
    var data = JSON.stringify({ "Action": "Full Tote", "SubAction": "Current Qty Response", "Cart": cart, "UserResponse1": currentQty });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}

function sendNewTote() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var newTote = document.getElementById('MainContent_promptNewToteTB').value;
    var data = JSON.stringify({ "Action": "Full Tote", "SubAction": "New Tote Response", "Cart": cart, "UserResponse1": newTote });
    console.log(data);
    ws.send(data);
    console.log("data sent");

}


function sendBatchCompleteTaskComplete() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Batch Complete", "SubAction": "Task Complete", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");

}

function sendBatchCompleteRetryLights() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Batch Complete", "SubAction": "Retry Lights", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");

}

function sendValidateLocation() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var location = document.getElementById("MainContent_validateLocationTB").value;
    var data = JSON.stringify({ "Action": "Location Validation", "SubAction": "Response", "Cart": cart, "UserResponse1": location });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}
function sendValidatePart() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var part = document.getElementById("MainContent_validatePartTB");
    var data = JSON.stringify({ "Action": "Part Validation", "SubAction": "Response", "Cart": cart, "UserResponse1": part });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}
function sendValidateLPN() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var LPN = document.getElementById("MainContent_validateLPNTB").value;

    var data = JSON.stringify({ "Action": "Task Complete", "SubAction": "Request", "Cart": cart, "UserResponse1": LPN });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}

function sendReprintLabels() {
    var cart = new URLSearchParams(window.location.search).get("cart");
    //label type
    var type;
    if (document.getElementById("MainContent_orderRadioButton").checked) {

        type = document.getElementById('MainContent_orderRadioButton').value;
    }
    if (document.getElementById("MainContent_partRadioButton").checked) {

        type = document.getElementById('MainContent_partRadioButton').value;
    }
    if (document.getElementById("MainContent_LPNRadioButton").checked) {

        type = document.getElementById('MainContent_LPNRadioButton').value;
    }

    //label qty
    var qty;
    if (document.getElementById("MainContent_onePerPosRadioButton").checked) {

        qty = document.getElementById("MainContent_onePerPosRadioButton").value;
    }
    if (document.getElementById("MainContent_onePerPosPerCaseRadioButton").checked) {

        qty = document.getElementById("MainContent_onePerPosPerCaseRadioButton").value;
    }
    if (document.getElementById("MainContent_oneLabelRadioButton").checked) {

        qty = document.getElementById("MainContent_oneLabelRadioButton").value;
    }

    var data = JSON.stringify({ "Action": "Reprint Labels", "SubAction": "Request", "Cart": cart, "UserResponse1": type, "UserResponse2": qty });
    console.log(data);
    ws.send(data);
    console.log("data sent");
