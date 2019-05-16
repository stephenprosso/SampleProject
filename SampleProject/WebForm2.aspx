<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage1.master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="SampleProject.WebForm2" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript">

        //var txt = '';
        //var xmlhttp = new XMLHttpRequest();
        //xmlhttp.onreadystatechange = function () {
        //    if (xmlhttp.status == 200 && xmlhttp.readyState == 4) {
        //        txt = xmlhttp.responseText;
        //    }
        //};
        //xmlhttp.open("GET", "C:\inetpub\wwwroot\helloworld.txt", true);
        //xmlhttp.send();


        function loadDoc() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("demo").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "Content/helloworld.txt", true);
            xhttp.send();
        }
        function loadLocalDoc() {
            var xhttp = new XMLHttpRequest();

            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("localdemo").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "file:///C:/inetpub/wwwroot/helloworld.txt", true);
            xhttp.send();
        }


    </script>

    <div class="row text-center">
        <div class="col-xs-6">
            <div id="demo">
                <h2>Let AJAX change text from project</h2>
                <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="false" Text="Change Content" ClientSideEvents-Click="loadDoc()">
                    <ClientSideEvents Click="loadDoc" />
                </dx:ASPxButton>
            </div>

        </div>


        <div class="col-xs-6">
             <div id="localdemo">
                <h2>Let AJAX change text from local machine</h2>
                <button type="button" onclick="loadLocalDoc()">Change Content</button>
            </div>

        </div>
    </div>

</asp:Content>