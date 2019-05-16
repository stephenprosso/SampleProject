var start = function () {
    var inc = document.getElementById('incomming');
    var wsImpl = window.WebSocket || window.MozWebSocket;
    var form = document.getElementById('sendForm');
    var input = document.getElementById('sendText');
    document.getElementById("TBID26").style.border = "none";
    document.getElementById("TBID27").style.border = "none";

    document.getElementById("TBID28").style.border = "none";

    inc.innerHTML += "connecting to server ..<br/>";

    // create a new websocket and connect
    window.ws = new wsImpl('ws://192.168.128.144:8181/');

    // when data is comming from the server, this metod is called
    ws.onmessage = function (evt) {


        inc.innerHTML += evt.data + '<br/>';
        var obj = JSON.parse(evt.data);
        document.getElementById("action").innerHTML = obj.action;
        document.getElementById("Part").innerHTML = obj.Part;
        document.getElementById("Location").innerHTML = obj.Location;
        document.getElementById("Quantity").innerHTML = obj.Quantity;
        //document.getElementById("offcarousel").innerHTML = obj.offcarousel;
        //document.getElementById("research").innerHTML = obj.research;
        if (obj.action === "ShortPick") {
            alert(evt.data);
            ws.send("PICK");
        }
        var action = obj.action;
        if (action === "TaskConfirmation") {
            $("#tcDiv").css('display', 'block');
            document.getElementById("pickDiv").style.display = "none";

        } else if (action === "Pick") {
            $("#pickDiv").css('display', 'block');
            document.getElementById("tcDiv").style.display = "none";
            document.getElementById("action").style.display = "none";


        }
        var location = obj.Location;
        var qty = obj.Quantity;
        if (location === "01A1") {
            document.getElementById("TBID1").style.backgroundColor = "Green";
            document.getElementById("TBID1").value = qty;
        } else {
            document.getElementById("TBID1").style.backgroundColor = "White";
        }


        if (location === "01A2") {
            document.getElementById("TBID2").style.backgroundColor = "Green";
            document.getElementById("TBID2").value = qty;

        } else {
            document.getElementById("TBID2").style.backgroundColor = "White";
        }

        if (location === "01A3") {
            document.getElementById("TBID3").style.backgroundColor = "Green";
            document.getElementById("TBID3").value = qty;


        } else {
            document.getElementById("TBID3").style.backgroundColor = "White";
        }
        if (location === "01A4") {
            document.getElementById("TBID4").style.backgroundColor = "Green";
            document.getElementById("TBID4").value = qty;

        } else {
            document.getElementById("TBID4").style.backgroundColor = "White";
        }
        if (location === "01A5") {
            document.getElementById("TBID5").style.backgroundColor = "Green";
            document.getElementById("TBID5").value = qty;

        } else {
            document.getElementById("TBID5").style.backgroundColor = "White";
        }

    };

    // when the connection is established, this method is called
    ws.onopen = function () {
        inc.innerHTML += '.. connection open<br/>';
    };

    // when the connection is closed, this method is called
    ws.onclose = function () {
        inc.innerHTML += '.. connection closed<br/>';
    }

    form.addEventListener('submit', function (e) {
        e.preventDefault();
        var val = input.value;
        ws.send(val);
        input.value = "";
    });

};

function ChangeQT() {
    prompt("Enter New QT");
    //var data = JSON.stringify({ "action": "ChangeQT", "NewQT": answer });
    //console.log(data);
    //console.log("send data");
    //ws.send(data);
    //console.log("data sent");

}


function PICK() {
    ws.send("PICK");
}
//function ON() {
//    ws.send("ON");
//}
function TC() {
    ws.send("TC");
}
function shortPick() {
    ws.send("ShortPick");
}

function DoProcessEnterKey(htmlEvent, editName) {
    if (htmlEvent.keyCode === 13) {
        ASPxClientUtils.PreventEventAndBubble(htmlEvent);
        if (editName) {
            ASPxClientControl.GetControlCollection().GetByName(editName).SetFocus();
        } else {
            btn.DoClick();
        }
    }
}