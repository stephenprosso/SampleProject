var start = function () {
    var inc = document.getElementById('incomming');
    var wsImpl = window.WebSocket || window.MozWebSocket;
    var form = document.getElementById('sendForm');
    var input = document.getElementById('sendText');


    //inc.innerHTML += "connecting to server ..<br/>";
    var cart = new URLSearchParams(window.location.search).get("cart");
    // create a new websocket and connect
    window.ws = new wsImpl('ws://echo.websocket.org/');
    //window.ws = new wsImpl('ws://192.168.128.237:8181/' + cart);
    console.log(wsImpl);
    console.log(cart);
    // when data is comming from the server, this metod is called
    ws.onmessage = function (evt) {


        inc.innerHTML += evt.data + '<br/>';


        var obj = JSON.parse(evt.data);


    };
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