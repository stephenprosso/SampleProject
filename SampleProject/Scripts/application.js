var start = function () {
    var inc = document.getElementById('incomming');
    var wsImpl = window.WebSocket || window.MozWebSocket;
    var form = document.getElementById('sendForm');
    var input = document.getElementById('sendText');


    //inc.innerHTML += "connecting to server ..<br/>";
    var cart = new URLSearchParams(window.location.search).get("cart");
    // create a new websocket and connect
    //window.ws = new wsImpl('ws://192.168.128.152:8181/');
    window.ws = new wsImpl('ws://192.168.128.237:8181/' + cart);
    console.log(wsImpl);
    console.log(cart);
    // when data is comming from the server, this metod is called
    ws.onmessage = function (evt) {


        inc.innerHTML += evt.data + '<br/>';


        var obj = JSON.parse(evt.data);


    }
}