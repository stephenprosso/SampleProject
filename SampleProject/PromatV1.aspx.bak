<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PromatV1.aspx.cs" Inherits="SampleProject.PromatV1" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="JS/PromatV1.js">
    </script>
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


                inc.innerHTML += evt.data + '<br/>';


                var obj = JSON.parse(evt.data);
                document.getElementById("action").innerHTML = obj.action;
                console.log(obj.action);
                document.getElementById("Part").innerHTML = obj.Part;
                console.log(obj.Part);

                document.getElementById("Location").innerHTML = obj.Location;
                console.log(obj.Location);

                document.getElementById("Quantity").innerHTML = obj.Quantity;
                console.log(obj.Quantity);

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
        function START() {
            ws.send("START");
        }
        function TC() {
            ws.send("TC");
        }

    </script>
    <br />
    <br />
    <div class="jumbotron text-center">
        <h1>Promat Demo</h1>
    </div>
    <div class="container">

        <div>

            <p id="action"></p>
            <br />
            <asp:Label ID="partNumberLabel" runat="server" Text="Part Number: "></asp:Label>
            <p id="Part"></p>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Location: "></asp:Label>
            <p id="Location"></p>
            <br />
            <asp:Label ID="CartNumberLabel" runat="server" Text="Quantity: "></asp:Label>
            <p id="Quantity"></p>
            <br />

        </div>

        <div class="row text-center">

        </div>
        <br />
        <div class="row text-center">
            <dx:BootstrapButton ID="TC" runat="server" AutoPostBack="false" Text="Task Complete">
                <ClientSideEvents Click="TC" />
            </dx:BootstrapButton>


            <dx:BootstrapButton ID="ON" runat="server" AutoPostBack="false" Text="START">
                <ClientSideEvents Click="START" />
            </dx:BootstrapButton>
        </div>
    </div>
    <pre id="incomming"></pre>
</asp:Content>
