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

function sendBackFromStartAisle() {

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "", "SubAction": "", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}


function sendClearCartFromBatchSetup() {
    confirm("Do you really want to clear the cart?");
    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "Clear Cart", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");

}
function sendBackFromBatchSetup() {

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "Back LPNs", "Cart": cart });
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
function sendReprintLabelsRequest() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Reprint Labels", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);

}
//the response from magic cart daemon will display the reprint labels div. below function send the data
function sendReprintLabels() {
    var cart = new URLSearchParams(window.location.search).get("cart");
    //label type
    var type;
    if ($('#MainContent_OL').is(":checked")) {

        type = "OL";
    }
    if ($('#MainContent_PL').is(":checked")) {

        type = "PL";
    }
    if ($('#MainContent_LL').is(":checked")) {

        type = "LL";
    }

    //label qty
    var qty;
    if ($('#MainContent_A').is(":checked")) {

        qty = "A";
    }
    if ($('#MainContent_B').is(":checked")) {

        qty = "B";
    }
    if ($('#MainContent_C').is(":checked")) {

        qty = "C";
    }


    var data = JSON.stringify({ "Action": "Reprint Labels", "SubAction": "Reprint", "Cart": cart, "UserResponse1": type, "UserResponse2": qty });
    console.log(data);
    ws.send(data);

}
//6
function sendChangeStartAisle() {


    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Change Start Aisle", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
    document.getElementById("MainContent_startAisleTB").value = "";
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
function sendShortPickRequest() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Short Pick", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    document.getElementById('MainContent_sendShortPickTB').focus();
}
function sendShortPick() {
    var cart = new URLSearchParams(window.location.search).get("cart");
    var qty = document.getElementById('MainContent_sendShortPickTB').value;
    var data = JSON.stringify({ "Action": "Short Pick", "SubAction": "Request", "Cart": cart, "UserResponse1": qty });
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


    ws.send(data);


    //var xmlhttp = new XMLHttpRequest();
    //var url = "http://192.168.128.152/cart/cart/batchpos";

    //xmlhttp.onreadystatechange = function () {
    //    if (this.readyState === 4 && this.status === 200) {
    //        document.getElementById("id01").innerHTML = this.responseText;
    //    }
    //};
    //xmlhttp.open("POST", url, true);

    //xmlhttp.send(data);


}

//BUTTONS ON EARLY EXIT 
function sendScanNewLPN() {

    hideEarlyExit();
    hideValidationBox();

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Early Exit", "SubAction": "Scan New LPN", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");

}

//BUTTONS ON EARLY EXIT
function sendEarlyExitAbort() {


    hideEarlyExit();
    hideValidationBox();

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Early Exit", "SubAction": "Abort", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");

}
//FUCNTION TO HELP HIDE ELEMENTS
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
    $("#partNumberAndDescriptionDiv").css('display', 'none');
    $("#locationAndQtyDiv").css('display', 'none');
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
    var part = document.getElementById("MainContent_validatePartTB").value;

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
