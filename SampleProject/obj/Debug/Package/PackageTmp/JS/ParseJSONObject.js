var start = function () {

    var bwJSON = '{"action": "Pick", "Cart": "5", "Part": "sku1", "Location": "01A1", "batchpos":' +
        '[' +
        '{ "Pos": "1", "Order": "ord1", "RequestQty": 1, "ActualQty": 1, "TC": true, "Color": 1, "BlinkSpeed": 0 },' +
        '{ "Pos": "2", "Order": "ord2", "RequestQty": "2", "ActualQty": 2, "TC": true, "Color": 2, "BlinkSpeed": 0 },' +
        '{ "Pos": "3", "Order": "ord3", "RequestQty": "3", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "4", "Order": "ord3", "RequestQty": "4", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "5", "Order": "ord3", "RequestQty": "5", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "6", "Order": "ord3", "RequestQty": "6", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "7", "Order": "ord3", "RequestQty": "7", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "8", "Order": "ord3", "RequestQty": "8", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "9", "Order": "ord3", "RequestQty": "9", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "10", "Order": "ord3", "RequestQty": "10", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "11", "Order": "ord3", "RequestQty": "11", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "12", "Order": "ord3", "RequestQty": "12", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "13", "Order": "ord3", "RequestQty": "13", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "14", "Order": "ord3", "RequestQty": "14", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "15", "Order": "ord3", "RequestQty": "15", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "16", "Order": "ord3", "RequestQty": "16", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "17", "Order": "ord3", "RequestQty": "17", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "18", "Order": "ord3", "RequestQty": "18", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        //'{ "Pos": "19", "Order": "ord3", "RequestQty": "19", "ActualQty": 3, "TC": true, "Color": 3, "BlinkSpeed": 0 }' +
        ']' +
        '}';

    var myObj = JSON.parse(bwJSON);


    //document.getElementById("action").innerHTML = myObj.action;
    document.getElementById("Cart").innerHTML = myObj.Cart;
    console.log(myObj.Cart);
    document.getElementById("Part").innerHTML = myObj.Part;
    document.getElementById("Location").innerHTML = myObj.Location;
    //document.getElementById("batchpos").innerHTML = myObj.batchpos[0].Pos;
    //hide boxes not being used and filling space
    document.getElementById("TBID26").style.border = "none";
    document.getElementById("TBID27").style.border = "none";
    document.getElementById("TBID28").style.border = "none";
    //
    // Position 1
    var pos1 = myObj.batchpos[0].Pos;
    var orderNum1 = myObj.batchpos[0].Order;
    var requestQty1 = myObj.batchpos[0].RequestQty;

    //position 2
    var pos2 = myObj.batchpos[1].Pos;
    var orderNum2 = myObj.batchpos[1].Order;
    var requestQty2 = myObj.batchpos[1].RequestQty;


    //position 3

    var pos3 = myObj.batchpos[2].Pos;
    var orderNum3 = myObj.batchpos[2].Order;
    var requestQty3 = myObj.batchpos[2].RequestQty;


    // if statement variables
    var action = myObj.action;
    console.log(myObj.action);
    var cart = myObj.Cart;
    var part = myObj.Part;
    var location = myObj.Location;
    var batchpos = myObj.batchpos[0].Pos;
    //if statements for Action = CartSetup
    if (action === "CartSetup") {
        $("#CartSetupTitle").css('display', 'block');
        $("#CartSetupTBs").css('display', 'block');


    }

    //if statements for Action = Pick
    if (action === "Pick") {
        document.getElementById("TBID1").focus();
        $("#CartPickingTitle").css('display', 'block');
        $("#CartPickingTBs").css('display', 'block');

        $("#pickDiv").css('display', 'block');
        //document.getElementById("PickingToteTB").focus();
        $("#button-div").css('display', 'block');

        if (pos1 === "1") {
            document.getElementById("TBID1").style.backgroundColor = "Green";
            //document.getElementById("TBID1").value = orderNum1;
            document.getElementById("TBID1").value = requestQty1;


        } if (pos2 === "2") {
            document.getElementById("TBID2").style.backgroundColor = "Pink";
            //document.getElementById("TBID2").value = orderNum2;
            document.getElementById("TBID2").value = requestQty2;


        } if (pos3 === "3") {
            document.getElementById("TBID3").value = requestQty3;


        }
        //if (pos3 === "4") {
        //    document.getElementById("TBID4").value = requestQty3;


        //} if (pos3 === "5") {
        //    document.getElementById("TBID5").value = requestQty3;


        //} if (pos3 === "6") {
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
}