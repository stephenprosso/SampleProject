//functions for buttons
function sendLogin() {

    var UserID = document.getElementById('MainContent_UserID').value;
    var Password = document.getElementById('MainContent_PWD').value;
    var cart = new URLSearchParams(window.location.search).get("cart");
    var ntsh = document.getElementById('nothingToSeeHere').value;

    var data = JSON.stringify({ "action": "Login", "SubAction": "Initiate", "Cart": cart, "UserResponse1": UserID, "UserResponse2": Password, "UserResponse3": ntsh });
    console.log(data);
    ws.send(data);
    document.getElementById('MainContent_UserID').value = "";
    document.getElementById('MainContent_PWD').value = "";

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


//SELECTED ZONE GROUPING BUTTONS
function sendSelectedZoneGrouping() {

    var list = document.getElementById("MainContent_ListBox1");

    var optsLength = list.options.length;
    for (var i = 0; i < optsLength; i++) {

        if (list.options[i].selected) {

            var zone = list.options[i].value;
        }

    }

    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Zone Group", "SubAction": "Response", "Cart": cart, "UserResponse1": zone });

    ws.send(data);
    document.getElementById('MainContent_ListBox1').selectedIndex = -1;

}
//WORK DASHBOARD BUTTONS
function sendSelectedBucket(selectedBucket) {


    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Work Dashboard", "SubAction": "Selected Bucket", "Cart": cart, "UserResponse1": selectedBucket });
    console.log(data);
    ws.send(data);
}
function sendBackFromDashboard() {
    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Work Dashboard", "SubAction": "Back", "Cart": cart });
    console.log(data);

    ws.send(data);

}

function sendLPN() {

    var LPN = document.getElementById('MainContent_LPNTB').value;
    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "LPN Scanned", "Cart": cart, "UserResponse1": LPN });
    console.log(data);

    ws.send(data);
    document.getElementById("MainContent_LPNTB").value = "";
}

function processBatch() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "Process Batch", "Cart": cart });
    console.log(data);

    ws.send(data);
}


//START AISLE BUTTONS
function sendStartAisle() {

    var aisle = document.getElementById('MainContent_startAisleTB').value;
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Start Aisle", "SubAction": "Response", "Cart": cart, "UserResponse1": aisle });
    console.log(data);

    ws.send(data);
    document.getElementById('MainContent_startAisleTB').value = "";
}

function sendBackFromStartAisle() {

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Start Aisle", "SubAction": "Back", "Cart": cart });
    ws.send(data);
}

//BATCH SETUP BUTTONS
function sendClearCartFromBatchSetup() {
    if (confirm("Do you really want to clear the cart?")) {
        var cart = new URLSearchParams(window.location.search).get("cart");
        var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "Clear Cart", "Cart": cart });
        console.log(data);

        ws.send(data);
    } else {
        return false;
    }


}
function sendBackFromBatchSetup() {

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Batch Setup", "SubAction": "Back LPNs", "Cart": cart });
    console.log(data);
    ws.send(data);

}
//buttons on the picking screen
//1 
function sendExitBatch() {

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Abort Batch", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);

}


//2
function sendRetryLights() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Retry Lights", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);

}
//3
function sendCompletePick() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Task Complete", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
}
//4 
function sendReLightLastPick() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Re-Light Last Pick", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
}

//5 ON DEMAN LABEL PRINTING 
function sendReprintLabelsRequest() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Reprint Labels", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);

}

function exitReprintLabels() {
    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Reprint Labels", "SubAction": "Back", "Cart": cart });
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

    $('input[type="checkbox"]').prop('checked', false);

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

//7 EARLY EIXT BUTTON FUNCTIONS
function sendEarlyExit() {

    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Early Exit", "SubAction": "Request", "Cart": cart });
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


//8
function sendSkipPick() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Skip Pick", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
}
//9 SHORT PICK PROGRAM BUTTONS
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
    var data = JSON.stringify({ "Action": "Short Pick", "SubAction": "Send Qty", "Cart": cart, "UserResponse1": qty });
    console.log(data);
    ws.send(data);
    $("#validateLPNDiv").css('display', 'none');
    $("#validatePartDiv").css('display', 'none');
    $("#validateLocationDiv").css('display', 'none');
    document.getElementById('MainContent_sendShortPickTB').value = "";
}

//10 FULL TOTE BUTTON FUNCTIONS
function sendFullTote() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Full Tote", "SubAction": "Request", "Cart": cart });
    console.log(data);
    ws.send(data);
    console.log("data sent");
    $("#validateLPNDiv").css('display', 'none');

}

function backFromFullTote() {
    var cart = new URLSearchParams(window.location.search).get("cart");

    var data = JSON.stringify({ "Action": "Full Tote", "SubAction": "Abort", "Cart": cart });
    console.log(data);
    ws.send(data);
    $("#promptFullToteDiv").css('display', 'none');


}
function sendCurrentFullTote() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var fullTote = document.getElementById('MainContent_promptFullToteTB').value;
    var data = JSON.stringify({ "Action": "Full Tote", "SubAction": "Scanned Tote", "Cart": cart, "UserResponse1": fullTote });
    console.log(data);
    ws.send(data);
    console.log("data sent");
    document.getElementById("MainContent_promptFullToteTB").value = "";

}

function sendCurrentQty() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var currentQty = document.getElementById('MainContent_promptCurrentQtyTB').value;
    var data = JSON.stringify({ "Action": "Full Tote", "SubAction": "Current Qty Response", "Cart": cart, "UserResponse1": currentQty });
    console.log(data);
    ws.send(data);
    console.log("data sent");
    document.getElementById("MainContent_promptCurrentQtyTB").value = "";
}

function sendNewTote() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var newTote = document.getElementById('MainContent_promptNewToteTB').value;
    var data = JSON.stringify({ "Action": "Full Tote", "SubAction": "New Tote Response", "Cart": cart, "UserResponse1": newTote });
    console.log(data);
    ws.send(data);
    console.log("data sent");
    document.getElementById("MainContent_promptNewToteTB").value = "";


}
//11 THIS IS NOT CURRENTLY BEING USED FOR TOP KNOBS
function sendLocnEmpty() {
    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Notify Host Locn Empty", "SubAction": "Request", "Cart": cart });
    ws.send(data);
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
    document.getElementById("MainContent_validateLocationTB").value = "";

}
function sendValidatePart() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var part = document.getElementById("MainContent_validatePartTB").value;

    var data = JSON.stringify({ "Action": "Part Validation", "SubAction": "Response", "Cart": cart, "UserResponse1": part });
    console.log(data);
    ws.send(data);
    console.log("data sent");
    document.getElementById("MainContent_validatePartTB").value = "";

}
function sendValidateLPN() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var LPN = document.getElementById("MainContent_validateLPNTB").value;

    var data = JSON.stringify({ "Action": "Task Complete", "SubAction": "Request", "Cart": cart, "UserResponse1": LPN });
    console.log(data);
    ws.send(data);
    console.log("data sent");
    document.getElementById("MainContent_validateLPNTB").value = "";

}

function sendBackToCurrentPick() {

    var cart = new URLSearchParams(window.location.search).get("cart");
    var data = JSON.stringify({ "Action": "Re-Light Last Pick", "SubAction": "Current Pick", "Cart": cart });
    ws.send(data);

}
