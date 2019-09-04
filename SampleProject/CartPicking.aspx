<%@ Page Title="CartPicking" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="CartPicking.aspx.cs" Inherits="SampleProject.PromatV2" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v19.1, Version=19.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">


    <script src="JS/complexJSON.js">
    </script>
    <script type="text/javascript">
        window.onload = start;

    </script>

    <br />
    <br />
     <div class="container" id="LoginDiv" style="display: none">
        <div class="row">
            <div class="col-md text-center">
                <h2>Websocket Login</h2>
                <br />
            </div>
        </div>

        <br />

         <%--//LOGIN DIV--%>
        <div class="row" id="LoginDiv">
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
                    <ClientSideEvents click="sendCartNum"/>
                </dx:BootstrapButton>
            </div>
            <div class="group-block">
                <asp:Label ID="ScanToteTB" runat="server" Text="Scan in Tote: "></asp:Label>
                <input id="LPNTB" type="text" runat="server" width="200px" />
                <dx:BootstrapButton ID="LPNButton" runat="server" AutoPostBack="false" Text="Submit Tote" >
                    <ClientSideEvents click="sendLPN"/>
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
            <div class="col-sm-3">
            </div>
            <div class="body">

                <div class="col-sm-6 text-center">
                    <div class="group">
                        <asp:Label ID="Label1" runat="server" Text="1" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID1" type="text" class="totecell" style="text-align: center" />
                    </div>

                    <div class="group">
                        <asp:Label ID="Label2" runat="server" Text="2" CssClass="totecelllabel"></asp:Label>
                        <br />
                        <input readonly id="TBID2" type="text" class="totecell" style="text-align: center" />

                    </div>
                    <div class="group">
                        <asp:Label ID="Label3" runat="server" Text="3" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID3" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label4" runat="server" Text="4" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID4" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label5" runat="server" Text="5" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID5" type="text" class="totecell" style="text-align: center" aria-multiline="true" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label6" runat="server" Text="6" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID6" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label7" runat="server" Text="7" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID7" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <br />
                    <br />

                    <div class="group">
                        <asp:Label ID="Label8" runat="server" Text="8" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID8" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label9" runat="server" Text="9" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID9" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label10" runat="server" Text="10" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID10" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label11" runat="server" Text="11" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID11" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <input readonly id="TBID26" type="text" class="totecell" />
                    </div>
                    <div class="group">
                        <input readonly id="TBID27" type="text" class="totecell" />
                    </div>
                    <div class="group">
                        <input readonly id="TBID28" type="text" class="totecell" />
                    </div>
                    <br />
                    <br />
                    <div class="group">
                        <asp:Label ID="Label12" runat="server" Text="12" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID12" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label13" runat="server" Text="13" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID13" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label14" runat="server" Text="14" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID14" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label15" runat="server" Text="15" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID15" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label16" runat="server" Text="16" CssClass="totecelllabel" BorderStyle="None"></asp:Label>
                        <br>
                        <input readonly id="TBID16" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label17" runat="server" Text="17" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID17" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label18" runat="server" Text="18" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID18" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <br />
                    <br />
                    <div class="group">
                        <asp:Label ID="Label19" runat="server" Text="19" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID19" type="text" class="totecell" style="text-align: center" placeholder="SCAN" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label20" runat="server" Text="20" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID20" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label21" runat="server" Text="21" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID21" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label22" runat="server" Text="22" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID22" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label23" runat="server" Text="23" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID23" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label24" runat="server" Text="24" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID24" type="text" class="totecell" style="text-align: center" />
                    </div>
                    <div class="group">
                        <asp:Label ID="Label25" runat="server" Text="25" CssClass="totecelllabel"></asp:Label>
                        <br>
                        <input readonly id="TBID25" type="text" class="totecell" style="text-align: center" />
                    </div>
                </div>

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
        <div class="row text-center">
           
        </div>
    </div>
    <%--    <pre id="incomming"></pre>--%>
</asp:Content>
