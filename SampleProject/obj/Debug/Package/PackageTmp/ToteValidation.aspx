<%@ Page Title="ToteValidation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ToteValidation.aspx.cs" Inherits="SampleProject.ToteValidation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function validateTote() {
            var inc = document.getElementById('incomming');
            var wsImpl = window.WebSocket || window.MozWebSocket;
            var form = document.getElementById('sendForm');
            var input = document.getElementById('sendText');

            // create a new websocket and connect
            window.ws = new wsImpl('ws://192.168.128.144:8181/');

            // when data is comming from the server, this metod is called
            ws.onmessage = function (evt) {
                inc.innerHTML += evt.data + '<br/>';
                //var obj = JSON.parse(evt.data);
                //document.getElementById("action").innerHTML = obj.action;
                //document.getElementById("status").innerHTML = obj.status;
                //document.getElementById("supervisor").innerHTML = obj.supervisor;
                //document.getElementById("offcarousel").innerHTML = obj.offcarousel;
                //document.getElementById("research").innerHTML = obj.research;

            };

            form.addEventListener('submit', function (e) {
                e.preventDefault();
                var val = input.value;
                ws.send(val);
                input.value = "";
            });
        }

    </script>
    <h1><%: Title %></h1>

    <div class="row">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server"></dx:ASPxGridView>
        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="170px"></dx:ASPxTextBox>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>
</asp:Content>
