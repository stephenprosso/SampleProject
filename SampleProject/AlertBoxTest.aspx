<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlertBoxTest.aspx.cs" Inherits="SampleProject.AlertBoxTest" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v19.1, Version=19.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <script type="text/javascript">
        var start = function () {
            var inc = document.getElementById('incomming');
            var wsImpl = window.WebSocket || window.MozWebSocket;
            var form = document.getElementById('sendForm');
            var input = document.getElementById('sendText');

            inc.innerHTML += "connecting to server ..<br/>";

            // create a new websocket and connect
            window.ws = new wsImpl('ws://192.168.128.144:8181/');

            // when data is comming from the server, this metod is called
            ws.onmessage = function (evt) {
                alert(evt.data);
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

        }
        window.onload = start;

        //function wssend() {
        //    console.log("wssend clicked");
        //    var UserID = document.getElementById('UserID').value;
        //    var Password = document.getElementById('PWD').value;

        //    var data = JSON.stringify({ "action": "initializeSID", "username": UserID, "password": Password })
        //    console.log(data);
        //    console.log("send data");
        //    ws.send(data);
        //    console.log("data sent");
        //}

        function ON() {
            ws.send("ON");

            function OFF() {
                ws.send("OFF");
    </script>
    <title>Alert Box Test</title>
</head>
<body>

    <div class="row text-center">
        <h1>Alert Box Test</h1>
    </div>
    <div class="row">
    <form id="form1" runat="server">
        <div>
            <p id="action"></p>
            <p id="status"></p>
            <p id="supervisor"></p>
            <p id="offcarousel"></p>
            <p id="research"></p>
        </div>
        <div>

            <dx:BootstrapButton ID="ON" runat="server" AutoPostBack="false" Text="ON">
                <ClientSideEvents Click="ON" />

            </dx:BootstrapButton>
            <br />
            <br />
            <dx:BootstrapButton ID="OFF" runat="server" AutoPostBack="false" Text="OFF">
                <ClientSideEvents Click="OFF" />

            </dx:BootstrapButton>
        </div>
    </form>
        </div>
</body>
</html>
