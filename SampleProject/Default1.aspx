<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default1.aspx.cs" Inherits="SampleProject.Default1" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
        <script src="js/cart.js">
    </script>
    <script type="text/javascript">
        window.onload = start1;

    </script>
    <div id="connectingDiv" class="row text-center"><p>Connecting to the WebSocket</p></div>
    <div class="container" id="LoginDiv" style="display: none">
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
                <dx:BootstrapButton ID="sendUserNameAndPassword" runat="server" AutoPostBack="false" Text="Login" Width="140px">
                    <ClientSideEvents Click="wssend" />

                </dx:BootstrapButton>
                <br />
                <br />
                <dx:BootstrapButton ID="Clear" runat="server" AutoPostBack="false" Text="Clear" Width="140px">
                    <%--<ClientSideEvents Click="test" />--%>
                </dx:BootstrapButton>

            </div>
        </div>
    </div>
    <div class="row text-center">
        <div class="col-sm-4"></div>
        <div class="col-sm-4" id="CartSetupTitle" style="display: none">
            <h1>Cart Setup</h1>
        </div>
        <div class="col-sm-4" id="CartPickingTitle" style="display: none">
            <h1>Cart Picking</h1>
        </div>

        <div class="col-sm-4" id="pickDiv" style="display: none">

            <asp:Label ID="partNumberLabel" runat="server" Text="Cart Number: "></asp:Label>
            <p id="Cart"></p>
            <br />

            <asp:Label ID="CartNumberLabel" runat="server" Text="Part NUmber: "></asp:Label>
            <p id="Part"></p>
            <br />
            <asp:Label ID="locationLabel" runat="server" Text="Location: "></asp:Label>
            <p id="Location"></p>
            <br />
        </div>
    </div>
    <div class="container">

        <div class="row text-center" id="CartSetupTBs" style="display: none">
            <div class="group-block">
                <asp:Label ID="ScanCartTB" runat="server" Text="Scan in Cart:"></asp:Label>
                <input id="cartNumTB" type="text" runat="server" width="200px" />
                <dx:BootstrapButton ID="sendCartNumButton" runat="server" AutoPostBack="false" Text="Submit Cart">
                    <ClientSideEvents Click="sendCartNum" />
                </dx:BootstrapButton>
            </div>
            <div class="group-block">
                <asp:Label ID="ScanToteTB" runat="server" Text="Scan in Tote: "></asp:Label>
                <input id="LPNTB" type="text" runat="server" width="200px" />
                <dx:BootstrapButton ID="LPNButton" runat="server" AutoPostBack="false" Text="Submit Tote">
                    <ClientSideEvents Click="sendLPN" />
                </dx:BootstrapButton>
            </div>
        </div>
        <br />
        <div class="row text-center" id="CartPickingTBs" style="display: none">
            <asp:Label ID="ScanToteLabel" runat="server" Text="Scan in Location or Part Number:"></asp:Label>
            <input id="ToteScanTB" type="text" runat="server" width="200px" />
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </div>
        <br />
        <div class="row text-center" id="tcDiv" style="display: none">
            <h4>Completed with TC</h4>
        </div>



        <div class="row text-center" id="toteDiv">
            <div class="col-sm-3"></div>
            <div class="col-sm-6 text-center" id="id01">
            </div>

            <div class="col-sm-3">
                <div class="button-div" id="button-div" style="display: none">
                    <dx:BootstrapButton ID="AbortBatchButton" runat="server" AutoPostBack="false" Text="Abort Batch" CssClasses-Control="button">
                        <ClientSideEvents Click="" />
                    </dx:BootstrapButton>

                    <dx:BootstrapButton ID="RetyLightsButton" runat="server" AutoPostBack="false" Text="Retry Lights" CssClasses-Control="button">
                        <ClientSideEvents Click="" />
                    </dx:BootstrapButton>


                    <dx:BootstrapButton ID="TC" runat="server" AutoPostBack="false" Text="Task Complete" CssClasses-Control="button">
                        <%--<ClientSideEvents Click="TC" />--%>
                    </dx:BootstrapButton>

                    <dx:BootstrapButton ID="PICK" runat="server" AutoPostBack="false" Text="PICK" CssClasses-Control="button">
                        <%-- <ClientSideEvents Click="PICK" />--%>
                    </dx:BootstrapButton>


                    <dx:BootstrapButton ID="ReprintLabelButton" runat="server" AutoPostBack="false" Text="Reprint Label" CssClasses-Control="button" heigth="300px">
                        <ClientSideEvents Click="" />
                    </dx:BootstrapButton>

                    <dx:BootstrapButton ID="SkipPickButton" runat="server" AutoPostBack="false" Text="Skip Pick" CssClasses-Control="button">
                        <ClientSideEvents Click="" />
                    </dx:BootstrapButton>

                    <dx:BootstrapButton ID="ChangeQtyButton" runat="server" AutoPostBack="false" Text="Change Qty" CssClasses-Control="button">
                        <ClientSideEvents Click="ChangeQT" />
                    </dx:BootstrapButton>

                    <%--<asp:Button ID="ChangeQT" runat="server" Text="Change QT" Height="100px" CssClass="button" OnClientClick="ChangeQT()" />--%>
                </div>
            </div>
        </div>
    </div>

    <div id="connectedDiv"><p>If you are reading this your connection is open.</p></div>
</asp:Content>
