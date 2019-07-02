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
        <asp:Panel ID="Panel3" runat="server" DefaultButton="startAisleButton">
            <div class="row text-center" id="StartAisleDiv" style="display: none">
                <h2>Scan Starting Aisle</h2>
                <%--<asp:Label ID="Label1" runat="server" Text="Scan Aisle: "></asp:Label>--%>
                <div class="group-block">
                    <input id="startAisleTB" type="text" runat="server" width="200px" />
                    <dx:BootstrapButton ID="startAisleButton" runat="server" AutoPostBack="false" Text="Continue" Style="display: none;">
                        <ClientSideEvents Click="sendStartAisle" />
                    </dx:BootstrapButton>
                    <dx:BootstrapButton ID="sendBackButton" runat="server" AutoPostBack="false" Text="Back">
                        <ClientSideEvents Click="sendBack" />
                    </dx:BootstrapButton>
                </div>
            </div>
        </asp:Panel>

        <br />
        <%--WORK DASHBOARD DIV--%>
        <div class="container" id="workDashboardDiv" style="display: none">
            <div class="row">
                <div class="col-sm-4 group-block">
                    <asp:Button ID="dashboardButton1" runat="server" CssClass="button centered" Text="Single Alloc" OnClientClick="sendSelectedBucket('1'); return false;" />
                    <table>
                        <tr>
                            <th>Order<br />
                                Priority</th>
                            <th>Order<br />
                                Count</th>
                            <th>Line<br />
                                Count</th>
                        </tr>
                        <tr>
                            <td>0</td>
                            <td>2</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>3</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>8</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>9</td>
                            <td>11</td>

                        </tr>
                        <tr>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-4 group-block">
                    <asp:Button ID="dashboardButton2" runat="server" CssClass="button centered" Text="Multi Alloc" OnClientClick="sendSelectedBucket('2'); return false;" />
                    <table>
                        <tr>
                            <th>Order<br />
                                Priority</th>
                            <th>Order<br />
                                Count</th>
                            <th>Line<br />
                                Count</th>
                        </tr>
                        <tr>
                            <td>0</td>
                            <td>2</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>3</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>8</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>9</td>
                            <td>11</td>

                        </tr>
                        <tr>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-4 group-block">
                    <asp:Button ID="dashboardButton3" runat="server" CssClass="button centered" Text="Mixed Priority" OnClientClick="sendSelectedBucket('3'); return false;" />
                    <table>
                        <tr>
                            <th>Order<br />
                                Priority</th>
                            <th>Order<br />
                                Count</th>
                            <th>Line<br />
                                Count</th>
                        </tr>
                        <tr>
                            <td>0</td>
                            <td>2</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>3</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>8</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>9</td>
                            <td>11</td>

                        </tr>
                        <tr>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 group-block">
                    <asp:Button ID="dashboardButton4" runat="server" CssClass="button centered" Text="Small Order" OnClientClick="sendSelectedBucket('4'); return false;" />
                    <table>
                        <tr>
                            <th>Order<br />
                                Priority</th>
                            <th>Order<br />
                                Count</th>
                            <th>Line<br />
                                Count</th>
                        </tr>
                        <tr>
                            <td>0</td>
                            <td>2</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>3</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>8</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>9</td>
                            <td>11</td>

                        </tr>
                        <tr>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-4 group-block">
                    <asp:Button ID="dashboardButton5" runat="server" CssClass="button centered" Text="Big Order" OnClientClick="sendSelectedBucket('5'); return false;" />
                    <table>
                        <tr>
                            <th>Order<br />
                                Priority</th>
                            <th>Order<br />
                                Count</th>
                            <th>Line<br />
                                Count</th>
                        </tr>
                        <tr>
                            <td>0</td>
                            <td>2</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>3</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>8</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>9</td>
                            <td>11</td>

                        </tr>
                        <tr>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-4 group-block">
                    <asp:Button ID="dashboardButton6" runat="server" CssClass="button centered" Text="High Priority" OnClientClick="sendSelectedBucket('6'); return false;" />
                    <table>
                        <tr>
                            <th>Order<br />
                                Priority</th>
                            <th>Order<br />
                                Count</th>
                            <th>Line<br />
                                Count</th>
                        </tr>
                        <tr>
                            <td>0</td>
                            <td>2</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>3</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>8</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>9</td>
                            <td>11</td>

                        </tr>
                        <tr>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                    </table>
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
            <div class="col-sm-8 text-center" id="zoneSelectDiv" style="display: none">
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="zone_grouping" DataValueField="zone_grouping"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPIK %>' SelectCommand="select zone_grouping from Zone_Grouping_Xref order by zone_grouping"></asp:SqlDataSource>
                <br />
                <asp:Button ID="sendSelectedZoneGroupingButton" runat="server" Text="Select Zone" OnClientClick="sendSelectedZoneGrouping(); return false" />
            </div>
            <%--CENTER OF YOUR PAGE DIV--%>
            <div class="col-sm-8" id="centerCartDisplay">
                <%--PARTS AND DETAILS DIV--%>
                <div class="border group" id="partDetailsAndLocationDiv" style="display: none">
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
                <div class="border text-center" id="userFieldQuantity" style="display: none">
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
                <div class="border text-center" id="promptFullToteDiv" style="display: none">
                    <asp:Label ID="promptFullToteLabel" runat="server" Text="Scan Full Tote"></asp:Label>
                    <asp:TextBox ID="promptFullToteTB" runat="server"></asp:TextBox>
                    <asp:Button ID="promptFullToteButton" runat="server" Text="Send Full Tote" CssClass="button" OnClientClick="sendCurrentFullTote(); return false" />
                </div>
                <%--PROMPT CURRENT QUANTITY DIV--%>
                <div class="border text-center" id="promptCurrentQtyDiv" style="display: none">
                    <asp:Label ID="promptCurrentQtyLabel" runat="server" Text="Enter Current Qty"></asp:Label>
                    <asp:TextBox ID="promptCurrentQtyTB" runat="server"></asp:TextBox>
                    <asp:Button ID="promptCurrentQtyButton" runat="server" Text="Send Current Qty" CssClass="button" OnClientClick="sendCurrentQty(); return false" />
                </div>
                <%--PROMPT NEW TOTE DIV--%>
                <div class="border text-center" id="promptNewToteDiv" style="display: none">
                    <asp:Label ID="promptNewToteLabel" runat="server" Text="Scan New Tote"></asp:Label>
                    <asp:TextBox ID="promptNewToteTB" runat="server"></asp:TextBox>
                    <asp:Button ID="promptNewToteButton" runat="server" Text="Send New Tote" CssClass="button" OnClientClick="sendNewTote(); return false" />
                </div>
                <%--MESSAGE BOX AND ERRORS DIV--%>
                <div class="border text-center" id="errorDiv" style="display: none">
                    <div class="errorMessage" id="errorMessage" style="display: none"></div>
                    <%--<asp:Button ID="clearError" runat="server" Text="OK" OnClientClick="clearError(); return false;" />--%>
                </div>
                <div class="ValidationBox text-center" id="id01" style="display: none">
                    <h1>Tote Matrix Will be HERE</h1>
                </div>
                <%--LOCATION VALIDATION DIV--%>
                <asp:Panel ID="locationValidationPanel" runat="server" DefaultButton="validateLocationTBButton">
                <div class="ValidationBox text-center" id="validateLocationDiv" style="display: none">
                    <h1>Scan Location to Validate</h1>
                    <asp:Label ID="validateLocationTBLabel" runat="server" Text="Scan Location:"></asp:Label>
                    <input id="validateLocationTB" type="text" runat="server" style="display: none" />
                    <asp:Button ID="validateLocationTBButton" runat="server" Text="Enter" />
                </div>
                    </asp:Panel>
                <%--PART VALIDATION DIV--%>
                <asp:Panel ID="partValidationPanel" runat="server" DefaultButton="validatePartTBButton">
                <div class="ValidationBox text-center" id="validatePartDiv" style="display: none">
                    <h1>Scan Part Number to Validate</h1>
                    <asp:Label ID="validatePartTBLabel" runat="server" Text="Scan Part:"></asp:Label>
                    <input id="validatePartTB" type="text" runat="server" style="display: none" />
                    <asp:Button ID="validatePartTBButton" runat="server" Text="Enter" />
                </div>
                    </asp:Panel>
                <asp:Panel ID="LPNValidationPanel" runat="server" DefaultButton="validateLPNTBButton">
                    <%--LPN VALIDATION DIV--%>
                    <div class="ValidationBox text-center" id="validateLPNDiv" style="display: none">
                        <h1>Scan LPN to Validate</h1>
                        <asp:Label ID="validateLPNTBLabel" runat="server" Text="Scan LPN:"></asp:Label>
                        <input id="validateLPNTB" type="text" runat="server" style="display: none" />
                        <asp:Button ID="validateLPNTBButton" runat="server" Text="Enter" />
                    </div>
                </asp:Panel>
                <div class="ValidationBox text-center" id="BatchCompleteDiv" style="display: none">
                    <p>Batch Complete Grid filled by BW</p>

                    <table>

                        <tr>
                            <th>Status</th>
                            <th>More Stats</th>
                            <th>Stats on stats</th>
                        </tr>
                        <tr>
                            <td>0</td>
                            <td>2</td>
                            <td>4</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>3</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>8</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>9</td>
                            <td>11</td>

                        </tr>
                        <tr>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                    </table>
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
                    <dx:BootstrapButton ID="rePrintLabelsButton" runat="server" AutoPostBack="false" Text="Re-Print Labels" CssClasses-Control="button">
                        <ClientSideEvents Click="sendReprintLabels" />
                    </dx:BootstrapButton>
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
                    <dx:BootstrapButton ID="shortPickButton" runat="server" AutoPostBack="false" Text="Short Pick" CssClasses-Control="button">
                        <ClientSideEvents Click="sendShortPick" />
                    </dx:BootstrapButton>
                    <%--10--%>
                    <dx:BootstrapButton ID="fullToteButton" runat="server" AutoPostBack="false" Text="Full Tote" CssClasses-Control="button">
                        <ClientSideEvents Click="sendFullTote" />
                    </dx:BootstrapButton>
                    <%--11--%>
                    <dx:BootstrapButton ID="notifyHostLocnEmptyButton" runat="server" AutoPostBack="false" Text="Notify Location Empty" CssClasses-Control="button">
                        <ClientSideEvents Click="sendLocnEmpty" />
                    </dx:BootstrapButton>
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
