<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SampleProject._Default" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript">

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

    </script>
    <p id="action"></p>
    <p id="status"></p>
    <p id="supervisor"></p>
    <p id="offcarousel"></p>
    <p id="research"></p>

    <div class="container" id="LoginDiv">
        <div class="row">
            <div class="col-md text-center">
                <h2>Websocket Login</h2>
                <br />
            </div>
        </div>

        <br />
        <div class="row">
            <div class="col-sm-6 text-center">
                Username:
            <input type="text" size="30" name="Username" id="UserID">
                <br>
                <br>
                Password:
            <input type="password" size="30" name="Password" id="PWD">
                <br>
                <br>
            </div>


            <div class="col-sm-6">
            </div>
            <div class="col-sm-6">
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
    </div>
    <hr />
    <pre id="incomming"></pre>



</asp:Content>
