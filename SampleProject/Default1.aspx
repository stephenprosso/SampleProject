<%@ Page Title="Cart WebApp" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PoweredPIKCart._Default" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="js/cart.js"></script>
    <script src="js/cartButtons.js"></script>
    <script type="text/javascript">
        window.onload = start1;
    </script>
    <script type="text/javascript"> document.addEventListener('click', function (e) { if (document.activeElement.toString() == '[object HTMLButtonElement]') { document.activeElement.blur(); } }); </script>
    <asp:HiddenField ID="nothingToSeeHere" runat="server" Value="" ClientIDMode="static" />
    <link href="Content/PoweredPik.css" rel="stylesheet" type="text/css" />
    <div id="connectingDiv" class="row text-center">
        <p>Connecting to the WebSocket</p>
    </div>

    <div class="container" id="LoginDiv" style="display: none">
        <div class="row">
            <div class="col-md text-center">
                <h2>Cart Login</h2>
                <br />
            </div>
        </div>

        <br />
        <asp:Panel ID="Panel1" runat="server">
            <div class="row text-center">

                <div class="group-block">
                    Username:
                <input id="UserID" type="text" runat="server" width="200px" />
                    <br>
                    Password:
            <input type="text" size="30" runat="server" name="Password" id="PWD">
                    <br>
                    <asp:Button ID="sendUserAndPassword" type="button" runat="server" Text="Login" CssClass="button centered" OnClientClick="sendLogin(); return false;" />
                    <br />
                    <br />
                </div>
            </div>
        </asp:Panel>
    </div>
    <div id="titlesDiv" class="row text-center">
        <div class="col-sm-4">
            <%--THIS SM-4 IS AVAILABLE TO DISPLAY DATA NEXT TO THE TITLE IF NEEDED--%>
        </div>
        <div class="col-sm-4" id="zoneSelectTite" style="display: none">
            <h1>Select Zone Grouping</h1>
        </div>
        <div class="col-sm-4" id="dashboardTitle" style="display: none">
            <h1>Cart Dashboard</h1>
        </div>
        <div class="col-sm-4" id="batchSetupTitle" style="display: none">
            <h1>Batch Setup</h1>
        </div>
        <div class="col-sm-4" id="CartPickingTitle" style="display: none">
            <h1>Cart Picking</h1>
        </div>
        <div class="col-sm-4" id="batchCompleteTitle" style="display: none">
            <h1>Batch Complete</h1>
        </div>
        <div class="col-sm-4" id="earlyExitTitle" style="display: none">
            <h1>Early Exit</h1>
        </div>
        <div class="col-sm-4">
            <%--THIS SM-4 IS AVAILABLE TO DISPLAY DATA NEXT TO THE TITLE IF NEEDED--%>
        </div>
    </div>
    <div class="container">
        <%--START AISLE DIV--%>
        <asp:Panel ID="Panel3" runat="server" DefaultButton="startAisleButton1">
            <div class="row text-center" id="StartAisleDiv" style="display: none">
                <h2>Scan Starting Aisle</h2>
                <%--<asp:Label ID="Label1" runat="server" Text="Scan Aisle: "></asp:Label>--%>
                <div class="group-block">
                    <input id="startAisleTB" type="text" runat="server" width="200px" />

                    <asp:Button ID="startAisleButton1" runat="server" CssClass="button" Text="Continue" OnClientClick="sendStartAisle(); return false;" Style="display: none" />
                    <asp:Button ID="sendBackFromStartAisleButton" CssClass="button" runat="server" Text="Back" OnClientClick="sendBackFromStartAisle(); return false;" />
                    <asp:Button ID="clearCartButtononStartAisle" runat="server" CssClass="button centered" Text="Clear Cart" OnClientClick="sendClearCartFromBatchSetup(); return false;" />


                </div>
            </div>
        </asp:Panel>

        <br />
        <%--WORK DASHBOARD DIV--%>
        <div class="container" id="workDashboardDiv" style="display: none">
            <div class="row">

                <div class="col-sm-4 text-center">
                    <asp:Button ID="dashboardButton1" runat="server" CssClass="button centered" Text="Single Alloc" OnClientClick="sendSelectedBucket('1'); return false;" />
                    <div id="dash1"></div>
                </div>
                <div class="col-sm-4 text-center">
                    <asp:Button ID="dashboardButton2" runat="server" CssClass="button centered" Text="Multi Alloc" OnClientClick="sendSelectedBucket('2'); return false;" />
                    <div id="dash2"></div>
                </div>
                <div class="col-sm-4 group-block">
                    <asp:Button ID="dashboardButton3" runat="server" CssClass="button centered" Text="Mixed Priority" OnClientClick="sendSelectedBucket('3'); return false;" />
                    <div id="dash3"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 group-block">
                    <asp:Button ID="dashboardButton4" runat="server" CssClass="button centered" Text="Small Order" OnClientClick="sendSelectedBucket('4'); return false;" />
                    <div id="dash4"></div>
                </div>
                <div class="col-sm-4 group-block">
                    <asp:Button ID="dashboardButton5" runat="server" CssClass="button centered" Text="Big Order" OnClientClick="sendSelectedBucket('5'); return false;" />
                    <div id="dash5"></div>
                </div>
                <div class="col-sm-4 group-block">
                    <asp:Button ID="dashboardButton6" runat="server" CssClass="button centered" Text="High Priority" OnClientClick="sendSelectedBucket('6'); return false;" />
                        <div id="dash6"></div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-2">
                <%--DIRECTIONAL DISPLAY DIV--%>
                <div class="border" id="directionalDisplayDiv" style="display: none">
                    <asp:Label ID="Label1" runat="server" Text="directionalDisplay: " Style="display: none"></asp:Label>
                    <p id="directionalDisplay"></p>
                </div>
                <%--USER FIELD DIV--%>
                <div class="border" id="userFieldDiv" style="display: none">
                    <asp:Label ID="userFieldLabel" runat="server" Text="userField: "></asp:Label>
                    <p id="userField"></p>
                </div>
            </div>

            <%--CENTER OF YOUR PAGE DIV--%>
            <div class="col-sm-8" id="centerCartDisplay">
                <%--ZONE SELECT DIV--%>
                <div class="text-center" id="zoneSelectDiv" style="display: none">
                    <div class="zoneHeader text-center">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="centered">
                            <Columns>
                                <asp:BoundField DataField="zone_grouping" HeaderText="zone_grouping" SortExpression="zone_grouping"></asp:BoundField>
                                <asp:BoundField DataField="#_of_Containers" HeaderText="#_of_Containers" ReadOnly="True" SortExpression="#_of_Containers"></asp:BoundField>
                                <asp:BoundField DataField="#_of_Picks" HeaderText="#_of_Picks" ReadOnly="True" SortExpression="#_of_Picks"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPIK %>' SelectCommand="sp_Zone_Grouping_AvailPicks" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                    <div class="text-center" id="listboxdiv">
                        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="zone_grouping" DataValueField="zone_grouping"></asp:ListBox>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPIK %>' SelectCommand="select zone_grouping from Zone_Grouping_Xref order by zone_grouping"></asp:SqlDataSource>
                        <br />
                        <asp:Button ID="sendSelectedZoneGroupingButton" runat="server" Text="Select Zone" OnClientClick="sendSelectedZoneGrouping(); return false" />
                    </div>
                    <div class="zoneDetails">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Location Zone" CssClass="centered" DataSourceID="SqlDataSource3">
                            <Columns>
                                <asp:BoundField DataField="Zone_Grouping" HeaderText="Zone_Grouping" SortExpression="Zone_Grouping"></asp:BoundField>
                                <asp:BoundField DataField="Location Zone" HeaderText="Location Zone" ReadOnly="True" SortExpression="Location Zone"></asp:BoundField>
                                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPIK %>' SelectCommand="
select Zone_Grouping, zone 'Location Zone', description from Zone_Grouping_Xref order by Zone_Grouping, Zone"></asp:SqlDataSource>

                    </div>
                </div>
                <%--PARTS AND DETAILS DIV--%>
                <div class="border group" id="partNumberAndDescriptionDiv" style="display: none">
                    <asp:Label ID="partNumberLabel" runat="server" Text="Part Number: "></asp:Label>
                    <p class="pl" id="partNumber"></p>
                    <asp:Label ID="partDesc1Label" runat="server" Text="partDesc1: "></asp:Label>
                    <p class="pl" id="partDesc1"></p>
                    <p class="pl" id="partDesc2"></p>
                </div>
                <%--BATCH STATS DIV--%>
                <div class="border text-center" id="BatchDataDiv" style="display: none">
                    <asp:Label ID="remainingPickLinesLabel" runat="server" Text="Remaining Pick Lines: "></asp:Label>
                    <p class="pl" id="remainingPickLines"></p>
                    <asp:Label ID="remainingLocsLabel" runat="server" Text="remaining Locations "></asp:Label>
                    <p class="pl" id="remainingLocs"></p>
                    <asp:Label ID="currentPicksPerHourRateLabel" runat="server" Text="Picks/hr: "></asp:Label>
                    <p class="pl" id="currentPicksPerHourRate"></p>
                </div>
                <%--BATCH SET UP DIV--%>
                <asp:Panel ID="batchSetupPanel" runat="server" DefaultButton="LPNButton1">

                    <div class="row text-center border" id="BatchSetupTBs" style="display: none">

                        <asp:Label ID="ScanToteTB" runat="server" Text="Scan in Tote: "></asp:Label>
                        <input id="LPNTB" type="text" runat="server" />
                        <asp:Button ID="LPNButton1" runat="server" Text="Submit Tote" Style="display: none" OnClientClick="sendLPN(); return false;" />

                    </div>
                </asp:Panel>
                <%--LOCATION AND QUANTITY DIV--%>
                <div class="border text-center" id="locationAndQtyDiv" style="display: none">
                    <asp:Label ID="locationLabel" runat="server" Text="Location: " Width="100px"></asp:Label>
                    <p class="pl" id="location"></p>
                    <asp:Label ID="totalPickQtyLabel" runat="server" Text="Quantity: " Width="100px"></asp:Label>
                    <p class="pl" id="totalPickQty"></p>
                </div>

                <%--FULL TOTE INFO DIV--%>
                <div class="border text-center" id="fullToteInfoDiv" style="display: none">
                    <asp:Label ID="fullToteNumberLabel" runat="server" Text="Full Tote: " Width="100px"></asp:Label>
                    <p class="pl" id="fullToteNumber"></p>
                    <asp:Label ID="fullToteQtyLabel" runat="server" Text="Full Tote Qty: " Width="100px"></asp:Label>
                    <p class="pl" id="fullToteQty"></p>
                    <asp:Label ID="newFullToteQtyLabel" runat="server" Text="New Tote Qty: " Width="100px"></asp:Label>
                    <p class="pl" id="newFullToteQty"></p>

                </div>
                <%--PROMPT FULL TOTE DIV--%>
                <asp:Panel ID="promptFullTotePanel" runat="server" DefaultButton="promptFullToteButton">
                    <div class="border text-center" id="promptFullToteDiv" style="display: none">
                        <asp:Label ID="promptFullToteLabel" runat="server" Text="Scan Full Tote"></asp:Label>
                        <asp:TextBox ID="promptFullToteTB" runat="server"></asp:TextBox>
                        <asp:Button ID="promptFullToteButton" runat="server" Text="Send Full Tote" Style="display: none" OnClientClick="sendCurrentFullTote(); return false" />
                    </div>
                </asp:Panel>
                <%--PROMPT CURRENT QUANTITY DIV--%>
                <asp:Panel ID="promptCurrentQtyPanel" runat="server" DefaultButton="promptCurrentQtyButton">
                    <div class="border text-center" id="promptCurrentQtyDiv" style="display: none">
                        <asp:Label ID="promptCurrentQtyLabel" runat="server" Text="Enter Current Qty"></asp:Label>
                        <asp:TextBox ID="promptCurrentQtyTB" runat="server"></asp:TextBox>
                        <asp:Button ID="promptCurrentQtyButton" runat="server" Text="Send Current Qty" OnClientClick="sendCurrentQty(); return false" />
                    </div>
                </asp:Panel>
                <%--PROMPT NEW TOTE DIV--%>
                <asp:Panel ID="promptNewTotePanel" runat="server" DefaultButton="promptNewToteButton">
                    <div class="border text-center" id="promptNewToteDiv" style="display: none">
                        <asp:Label ID="promptNewToteLabel" runat="server" Text="Scan New Tote"></asp:Label>
                        <asp:TextBox ID="promptNewToteTB" runat="server"></asp:TextBox>
                        <asp:Button ID="promptNewToteButton" runat="server" Text="Send New Tote" Style="display: none" OnClientClick="sendNewTote(); return false" />
                    </div>
                </asp:Panel>
                <%--SHORT PICK--%>
                <asp:Panel ID="shortPickPanel" runat="server" DefaultButton="sendShortPickButton">
                    <div class="border text-center" id="shortPickDiv" style="display: none">
                        <asp:Label ID="sendShortPickLabel" runat="server" Text="Enter Qty"></asp:Label>
                        <asp:TextBox ID="sendShortPickTB" runat="server"></asp:TextBox>
                        <asp:Button ID="sendShortPickButton" runat="server" Text="Enter Qty" OnClientClick="sendShortPick(); return false" />
                    </div>
                </asp:Panel>
                <%--REPRINT LABELS DIV--%>
                <asp:Panel ID="Panel2" runat="server">
                    <div class="border text-center" id="rePrintLabelsDiv" style="display: none">
                        <div class="group">
                            <asp:Label ID="Label2" runat="server" Text="Label Type"></asp:Label>
                            <asp:CheckBox ID="OL" runat="server" Text="Order Label"  />
                            <asp:CheckBox ID="PL" runat="server" Text="Part Label" />
                            <asp:CheckBox ID="LL" runat="server" Text="LPN Label" />
                        </div>
                        <br />
                        <div class="group">
                            <asp:Label ID="Label3" runat="server" Text="Label Type"></asp:Label>
                            <asp:CheckBox ID="B" runat="server" Text="1 Per Pos" />
                            <asp:CheckBox ID="C" runat="server" Text="1 per pos/ per case" />
                            <asp:CheckBox ID="A" runat="server" Text="1 label" />
                            <asp:Button ID="Button1" runat="server" Text="Reprint Labels" OnClientClick="sendReprintLabels(); return false" />
                        </div>
                    </div>
                </asp:Panel>


                <%--MESSAGE BOX AND ERRORS DIV--%>
                <div class="border text-center" id="errorDiv" style="display: none">
                    <div class="errorMessage" id="errorMessage" style="display: none"></div>
                    <%--<asp:Button ID="clearError" runat="server" Text="OK" OnClientClick="clearError(); return false;" />--%>
                </div>

                <%--LOCATION VALIDATION DIV--%>
                <asp:Panel ID="locationValidationPanel" runat="server" DefaultButton="validateLocationTBButton">
                    <div class="border text-center" id="validateLocationDiv" style="display: none">
                        <h1>Scan Location to Validate</h1>
                        <asp:Label ID="validateLocationTBLabel" runat="server" Text="Scan Location:"></asp:Label>
                        <input id="validateLocationTB" type="text" runat="server" width="100px" />
                        <asp:Button ID="validateLocationTBButton" runat="server" Text="Enter" OnClientClick="sendValidateLocation(); return false;" Style="display: none" />
                    </div>
                </asp:Panel>
                <%--PART VALIDATION DIV--%>
                <asp:Panel ID="partValidationPanel" runat="server" DefaultButton="validatePartTBButton">
                    <div class="border text-center" id="validatePartDiv" style="display: none">
                        <h1>Scan Part Number to Validate</h1>
                        <asp:Label ID="validatePartTBLabel" runat="server" Text="Scan Part:"></asp:Label>
                        <input id="validatePartTB" type="text" runat="server" />
                        <asp:Button ID="validatePartTBButton" runat="server" Text="Enter" OnClientClick="sendValidatePart(); return false;" Style="display: none" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="LPNValidationPanel" runat="server" DefaultButton="validateLPNTBButton">
                    <%--LPN VALIDATION DIV--%>
                    <div class="border text-center" id="validateLPNDiv" style="display: none">
                        <h1>Scan LPN to Validate</h1>
                        <asp:Label ID="validateLPNTBLabel" runat="server" Text="Scan LPN:"></asp:Label>
                        <input id="validateLPNTB" type="text" runat="server" width="100px" />
                        <asp:Button ID="validateLPNTBButton" runat="server" Text="Enter" OnClientClick="sendValidateLPN(); return false;" Style="display: none" />
                    </div>
                </asp:Panel>
                <div class="ValidationBox text-center" id="id01" style="display: none">
                    <h1>One moment while we build your digital cart</h1>
                </div>
                <div class="ValidationBox text-center" id="BatchCompleteDiv" style="display: none">
                </div>
            </div>

            <%--THIS DIV SIZE SMALL 2 HOLDS THE DIFFERENT BUTTON GROUPS--%>
            <div class="col-sm-2">

                <div class="batchSetupButtonsDiv" id="batchSetupButtonsDiv" style="display: none">
                    <asp:Button ID="processBatchButton1" runat="server" Text="Process Batch" CssClass="button centered" OnClientClick="processBatch(); return false;" />
                    <asp:Button ID="BackButton1" runat="server" Text="Back" CssClass="button centered" OnClientClick="sendBackFromBatchSetup(); return false" />
                    <asp:Button ID="sendClearCartFromBatchSetupButton" runat="server" CssClass="button centered" Text="Clear Cart" OnClientClick="sendClearCartFromBatchSetup(); return false;" />
                </div>
                <%--BATCH COMPLETE BUTTONS--%>
                <div class="batchCompleteButtons" id="batchCompleteButtonsDiv" style="display: none">
                    <asp:Button ID="sendBatchCompleteTaskCompleteButton" runat="server" CssClass="button centered" Text="Task Complete" OnClientClick="sendBatchCompleteTaskComplete(); return false;" />
                    <asp:Button ID="sendBatchCompleteRetryLightsButton" runat="server" CssClass="button centered" Text="Retry Lights" OnClientClick="sendBatchCompleteRetryLights(); return false;" />
                </div>
                <%--EARLY EXIT BUTTONS--%>
                <div class="earlyExitButtons" id="earlyExitButtons" style="display: none">
                    <asp:Button ID="scanNewLPNButton" runat="server" Text="Scan New LPN" CssClass="button" OnClientClick="sendScanNewLPN(); return false;" />
                    <asp:Button ID="earlyExitAbortButton" runat="server" Text="Exit Early Exit" CssClass="button" OnClientClick="sendEarlyExitAbort(); return false;" />
                </div>
                <div class="fullToteButtons" id="fullToteButtons" style="display: none">
                </div>
                <%--ALL AVAILABLE BUTTONS DURING PICKING--%>
                <div class="button-div" id="button-div" style="display: none">
                    <%--1--%>
                    <dx:BootstrapButton ID="exitBatchButton" runat="server" AutoPostBack="false" Text="Exit Batch" CssClasses-Control="button">
                        <ClientSideEvents Click="sendExitBatch" />
                    </dx:BootstrapButton>
                    <%--2--%>
                    <dx:BootstrapButton ID="retyLightsButton" runat="server" AutoPostBack="false" Text="Retry Lights" CssClasses-Control="button">
                        <ClientSideEvents Click="sendRetryLights" />
                    </dx:BootstrapButton>
                    <%--3--%>
                    <dx:BootstrapButton ID="taskCompleteButton" runat="server" AutoPostBack="false" Text="Task Complete" CssClasses-Control="taskCompleteButton">
                        <ClientSideEvents Click="sendCompletePick" />
                    </dx:BootstrapButton>
                    <%--4--%>
                    <dx:BootstrapButton ID="relightLastPickButton" runat="server" AutoPostBack="false" Text="Re-Light Last Pick" CssClasses-Control="button">
                        <ClientSideEvents Click="sendReLightLastPick" />
                    </dx:BootstrapButton>
                    <%--5--%>
                    <asp:Button ID="reprintLabelsButton1" runat="server" Text="Re-Print Labels" CssClass="button" OnClientClick="sendReprintLabelsRequest(); return false;" />
                    <%--6--%>
                    <dx:BootstrapButton ID="changeStartAisleButton" runat="server" AutoPostBack="false" Text="Change Start Aisle" CssClasses-Control="button">
                        <ClientSideEvents Click="sendChangeStartAisle" />
                    </dx:BootstrapButton>
                    <%--7--%>
                    <dx:BootstrapButton ID="earlyExitButton" runat="server" AutoPostBack="false" Text="Early Exit" CssClasses-Control="button">
                        <ClientSideEvents Click="sendEarlyExit" />
                    </dx:BootstrapButton>
                    <%--8--%>
                    <dx:BootstrapButton ID="SkipPickButton" runat="server" AutoPostBack="false" Text="Skip Pick" CssClasses-Control="button">
                        <ClientSideEvents Click="sendSkipPick" />
                    </dx:BootstrapButton>
                    <%--9--%>
                    <asp:Button ID="shortPickButton" runat="server" Text="Short Pick" CssClass="button" OnClientClick="sendShortPickRequest(); return false;" />

                    <%--10--%>
                    <dx:BootstrapButton ID="fullToteButton" runat="server" AutoPostBack="false" Text="Full Tote" CssClasses-Control="button">
                        <ClientSideEvents Click="sendFullTote" />
                    </dx:BootstrapButton>
                    <%--11--%>
<%--                    <dx:BootstrapButton ID="notifyHostLocnEmptyButton" runat="server" AutoPostBack="false" Text="Notify Location Empty" CssClasses-Control="button">
                        <ClientSideEvents Click="sendLocnEmpty" />
                    </dx:BootstrapButton>--%>
                    <%--<asp:Button ID="ChangeQT" runat="server" Text="Change QT" Height="100px" CssClass="button" OnClientClick="ChangeQT()" />--%>
                </div>
            </div>
        </div>

        <div class="row">
            <%--THIS IS IS ONLY FOR DOVETREE TESTING--%>
            <div class="col-sm-4 text-center" id="connectedDiv" style="display: none">
                <div class="smt">If you are reading this your connection is open.</div>
            </div>
            <div class="col-sm-4 text-center">
            </div>
        </div>
    </div>
</asp:Content>
