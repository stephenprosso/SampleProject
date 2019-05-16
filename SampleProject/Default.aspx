<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SampleProject._Default" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        //var start = function () {

        //    document.getElementById("UserID").focus();
        //    var inc = document.getElementById('incomming');
        //    var wsImpl = window.WebSocket || window.MozWebSocket;
        //    var form = document.getElementById('sendForm');
        //    var input = document.getElementById('sendText');

        //    inc.innerHTML += "connecting to server ..<br/>";

        //    // create a new websocket and connect
        //    //var cart = new URLSearchParams(window.location.search).get("cart");
        //    window.ws = new wsImpl('ws://192.168.128.237:8181/');
        //    // when data is comming from the server, this metod is called
        //    ws.onmessage = function (evt) {
        //        //var string = evt.data
        //        //if (typeof evt.data === String) {
        //        //    alert(evt.data);
        //        //} else {

        //        //}
        //        inc.innerHTML += evt.data + '<br/>';
        //        var obj = JSON.parse(evt.data);
        //        document.getElementById("action").innerHTML = obj.action;
        //        document.getElementById("status").innerHTML = obj.status;
        //        document.getElementById("supervisor").innerHTML = obj.supervisor;
        //        document.getElementById("offcarousel").innerHTML = obj.offcarousel;
        //        document.getElementById("research").innerHTML = obj.research;

        //    }

        //};
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


        function wssend() {
            console.log("wssend clicked");
            var UserID = document.getElementById('UserID').value;
            var Password = document.getElementById('PWD').value;

            var data = JSON.stringify({ "action": "initializeSID", "username": UserID, "password": Password })
            console.log(data);
            console.log("send data");
            ws.send(data);
            console.log("data sent");
        }

        function test() {
            ws.send("Is this thing on?")
        }
        function ON() {
            ws.send("ON");
        }
        function TC() {
            ws.send("TC");
        }
        function OFF() {
            ws.send("OFF");
        }
        //function submitToteNumbers() {
        //    $.ajax({

        //        url: webserviceURL + "SubmitTotes&-ARGUMENTS=-A" + UserID + ",-A" + Password,
        //        success: alert('Great Job')
        //    });
        //}
    </script>
    <p id="action"></p>
    <p id="status"></p>
    <p id="supervisor"></p>
    <p id="offcarousel"></p>
    <p id="research"></p>

    <div class="row">
        <div class="col-md text-center">
            <h2>Websocket Login</h2>
            <br />
        </div>
    </div>

    <br />
    <div class="row">
        <div class="col-md-6 text-center">
            Username:
            <input type="text" size="30" name="Username" id="UserID">
            <br>
            <br>
            Password:
            <input type="password" size="30" name="Password" id="PWD">
            <br>
            <br>
        </div>


        <div class="col-xs-6">
            <%--            <dx:ASPxButton ID="btn" runat="server" AutoPostBack="False" ClientInstanceName="btn" UseSubmitBehavior="true" Text="Submit Totes">
                <ClientSideEvents Click="submitToteNumbers" />
            </dx:ASPxButton>--%>
        </div>
        <div class="col-xs-6">
            <dx:BootstrapButton ID="sendUserNameAndPassword" runat="server" AutoPostBack="false" Text="Send Login">
                <ClientSideEvents Click="wssend" />

            </dx:BootstrapButton>
            <br />
            <br />
            <dx:BootstrapButton ID="test" runat="server" AutoPostBack="false" Text="Test Conneciton">
                <ClientSideEvents Click="test" />

            </dx:BootstrapButton>

        </div>
    </div>
    <hr />
    <pre id="incomming"></pre>



</asp:Content>
