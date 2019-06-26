<%@ Page Title="Cart WebApp" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PoweredPIKCart._Default" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="js/cart.js">
    </script>
    <script type="text/javascript">
        window.onload = start1;
    </script>
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
    </div>
    <div id="titlesDiv" class="row text-center">
        <div class="col-sm-4"></div>
        <div class="col-sm-4" id="zoneSelectTite" style="display: none">
            <h2>Select Zone Grouping</h2>
        </div>
        <div class="col-sm-4" id="dashboardTitle" style="display: none">
            <h2>Cart Dashboard</h2>
        </div>
        <div class="col-sm-4" id="batchSetupTitle" style="display: none">
            <h2>Batch Setup</h2>
        </div>
        <div class="col-sm-4" id="CartPickingTitle" style="display: none">
            <h2>Cart Picking</h2>
        </div>
        <div class="col-sm-4" id="batchCompleteTitle" style="display: none">
            <h2>Batch Complete</h2>
        </div>

        <div class="col-sm-4">
        </div>
    </div>
    <div class="container">

        <div class="row text-center" id="StartAisleDiv" style="display: none">
            <h2>Scan Starting Aisle</h2>
            <%--<asp:Label ID="Label1" runat="server" Text="Scan Aisle: "></asp:Label>--%>
            <div class="group-block">
                <input id="startAisleTB" type="text" runat="server" width="200px" />
                <dx:BootstrapButton ID="startAisleButton" runat="server" AutoPostBack="false" Text="Continue">
                    <ClientSideEvents Click="sendStartAisle" />
                </dx:BootstrapButton>
                <dx:BootstrapButton ID="sendBackButton" runat="server" AutoPostBack="false" Text="Back">
                    <ClientSideEvents Click="sendBack" />
                </dx:BootstrapButton>
            </div>
        </div>

        <div class="row text-center" id="BatchSetupTBs" style="display: none">
            <div class="group-block">
                <asp:Label ID="ScanToteTB" runat="server" Text="Scan in Tote: "></asp:Label>
                <input id="LPNTB" type="text" runat="server" width="200px" />
                <dx:BootstrapButton ID="LPNButton" runat="server" AutoPostBack="false" Text="Submit Tote">
                    <ClientSideEvents Click="sendLPN" />
                </dx:BootstrapButton>
                <dx:BootstrapButton ID="processBatchButton" runat="server" AutoPostBack="false" Text="Process Batch">
                    <ClientSideEvents Click="processBatch" />
                </dx:BootstrapButton>
                <dx:BootstrapButton ID="BackButton" runat="server" AutoPostBack="false" Text="Back">
                    <ClientSideEvents Click="sendBack" />
                </dx:BootstrapButton>
            </div>
            <div class="row text-center">
                <div id="id001">
                    <p>BW Code from server goes here</p>

                </div>
            </div>
        </div>

        <br />
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
                <div class="border" id="directionalDisplayDiv">
                    <asp:Label ID="Label1" runat="server" Text="directionalDisplay: " Style="display: none"></asp:Label>
                    <p id="directionalDisplay"></p>
                </div>
            </div>
            <div class="col-sm-8 text-center" id="zoneSelectDiv" style="display: none">
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="zone_grouping" DataValueField="zone_grouping"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPIK %>' SelectCommand="select zone_grouping from Zone_Grouping_Xref order by zone_grouping"></asp:SqlDataSource>
                <br />
                <asp:Button ID="sendSelectedZoneGroupingButton" runat="server" Text="Select Zone" OnClientClick="sendSelectedZoneGrouping(); return false" />
            </div>
            <div class="col-sm-8" id="centerCartDisplay">

                <div class="border group" id="partDetailsAndLocationDiv" style="display: none">
                    <asp:Label ID="partNumberLabel" runat="server" Text="Part Number: " Width="100px"></asp:Label>
                    <p id="partNumber"></p>
                    <br />
                    <asp:Label ID="partDesc1Label" runat="server" Text="partDesc1: " Width="100px"></asp:Label>
                    <p id="partDesc1"></p>
                    <br />
                    <asp:Label ID="partDesc2Label" runat="server" Text="partDesc2: " Width="100px"></asp:Label>
                    <p id="partDesc2"></p>
                    <br />
                    <asp:Label ID="userFieldLabel" runat="server" Text="userField: " Width="100px"></asp:Label>
                    <p id="userField"></p>
                </div>
                <div class="border text-center" id="userFieldQuantity" style="display: none">

                    <asp:Label ID="locationLabel" runat="server" Text="Location: " Width="100px"></asp:Label>
                    <p id="location"></p>
                    <asp:Label ID="totalPickQtyLabel" runat="server" Text="Quantity: " Width="100px"></asp:Label>
                    <p id="totalPickQty"></p>
                </div>
                <div class="border text-center" id="BatchDataDiv" style="display: none">
                    <asp:Label ID="remainingPickLinesLabel" runat="server" Text="Remaining Pick Lines: "></asp:Label>
                    <p id="remainingPickLines"></p>
                    <asp:Label ID="remainingLocsLabel" runat="server" Text="remaining Locations "></asp:Label>
                    <p id="remainingLocs"></p>
                    <asp:Label ID="currentPicksPerHourRateLabel" runat="server" Text="Picks/hr: "></asp:Label>
                    <p id="currentPicksPerHourRate"></p>
                </div>
                <div class="ValidationBox text-center" id="id01" style="display: none">
                    <h1>Tote Matrix Will be HERE</h1>
                </div>
                <div class="ValidationBox text-center" id="validateLocationDiv" style="display: none">
                    <h1>Scan Location to Validate</h1>
                    <asp:Label ID="validateLocationTBLabel" runat="server" Text="Scan Location:"></asp:Label>
                    <input id="validateLocationTB" type="text" runat="server" width="200px" />
                    <asp:Button ID="validateLocationTBButton" runat="server" Text="Enter" />
                </div>
                <div class="ValidationBox text-center" id="validatePartDiv" style="display: none">
                    <h1>Scan Part Number to Validate</h1>
                    <asp:Label ID="validatePartTBLabel" runat="server" Text="Scan Part:"></asp:Label>
                    <input id="validatePartTB" type="text" runat="server" width="200px" />
                    <asp:Button ID="validatePartTBButton" runat="server" Text="Enter" />
                </div>
                <div class="ValidationBox text-center" id="validateLPNDiv" style="display: none">
                    <h1>Scan LPN to Validate</h1>
                    <asp:Label ID="validateLPNTBLabel" runat="server" Text="Scan LPN:"></asp:Label>
                    <input id="validateLPNTB" type="text" runat="server" width="200px" />
                    <asp:Button ID="validateLPNTBButton" runat="server" Text="Enter" />
                </div>


            </div>

            <div class="col-sm-8 text-center" id="BatchCompleteDiv" style="display: none">
                <p>Batch Complete Grid filled by BW</p>
                <asp:Button ID="sendTaskCompleteButton" runat="server" CssClass="button centered" Text="Task Complete" OnClientClick="sendTaskComplete(); return false;" />
                <asp:Button ID="sendRetryLightsButton" runat="server" CssClass="button centered" Text="Single Alloc" OnClientClick="sendRetryLights(); return false;" />

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

            <div class="col-sm-2">
                <div class="button-div" id="button-div" style="display: none">
                    <%--1--%>
                    <dx:BootstrapButton ID="exitBatchButton" runat="server" AutoPostBack="false" Text="Exit Batch" CssClasses-Control="button">
                        <%--<ClientSideEvents Click="sendExitBatch" />--%>
                    </dx:BootstrapButton>
                    <%--2--%>
                    <dx:BootstrapButton ID="retyLightsButton" runat="server" AutoPostBack="false" Text="Retry Lights" CssClasses-Control="button">
                        <%--<ClientSideEvents Click="sendRetryLights" />--%>
                    </dx:BootstrapButton>
                    <%--3--%>
                    <dx:BootstrapButton ID="taskCompleteButton" runat="server" AutoPostBack="false" Text="Task Complete" CssClasses-Control="taskCompleteButton">
                        <%-- <ClientSideEvents Click="sendCompletePick" />--%>
                    </dx:BootstrapButton>
                    <%--4--%>
                    <dx:BootstrapButton ID="relightLastPickButton" runat="server" AutoPostBack="false" Text="Re-Light Last Pick" CssClasses-Control="button">
                        <%--<ClientSideEvents Click="sendRetryLastPick" />--%>
                    </dx:BootstrapButton>
                    <%--5--%>
                    <dx:BootstrapButton ID="rePrintLabelsButton" runat="server" AutoPostBack="false" Text="Re-Print Labels" CssClasses-Control="button">
                        <%--<ClientSideEvents Click="sendOnDemandLabelPrinting" />--%>
                    </dx:BootstrapButton>
                    <%--6--%>
                    <dx:BootstrapButton ID="changeStartAisleButton" runat="server" AutoPostBack="false" Text="Change Start Aisle" CssClasses-Control="button">
                        <%--<ClientSideEvents Click="sendChangeStartAisle" />--%>
                    </dx:BootstrapButton>
                    <%--7--%>
                    <dx:BootstrapButton ID="earlyExitButton" runat="server" AutoPostBack="false" Text="Early Exit" CssClasses-Control="button">
                        <%--<ClientSideEvents Click="sendEarlyExit" />--%>
                    </dx:BootstrapButton>
                    <%--8--%>
                    <dx:BootstrapButton ID="SkipPickButton" runat="server" AutoPostBack="false" Text="Skip Pick" CssClasses-Control="button">
                        <%-- <ClientSideEvents Click="sendSkipPick" />--%>
                    </dx:BootstrapButton>
                    <%--9--%>
                    <dx:BootstrapButton ID="shortPickButton" runat="server" AutoPostBack="false" Text="Short Pick" CssClasses-Control="button">
                        <%-- <ClientSideEvents Click="sendShortPick" />--%>
                    </dx:BootstrapButton>
                    <%--10--%>
                    <dx:BootstrapButton ID="fullToteButton" runat="server" AutoPostBack="false" Text="Full Tote" CssClasses-Control="button">
                        <%-- <ClientSideEvents Click="sendFullTote" />--%>
                    </dx:BootstrapButton>
                    <%--11--%>
                    <dx:BootstrapButton ID="notifyHostLocnEmptyButton" runat="server" AutoPostBack="false" Text="Notify Location Empty" CssClasses-Control="button">
                        <ClientSideEvents Click="sendLocnEmpty" />
                    </dx:BootstrapButton>
                    <%--<asp:Button ID="ChangeQT" runat="server" Text="Change QT" Height="100px" CssClass="button" OnClientClick="ChangeQT()" />--%>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4 text-center" id="connectedDiv" style="display: none">
            <div class="smt">If you are reading this your connection is open.</div>
        </div>
        <div class="col-sm-4 text-center" id="errorDiv" style="display: none">
            <h4>Error Messages</h4>
            <div class="errorMessage" id="errorMessage" style="display: none"></div>
            <%--<asp:Button ID="clearError" runat="server" Text="OK" OnClientClick="clearError(); return false;" />--%>
        </div>
        <div class="col-sm-4 text-center">
        </div>
    </div>

</asp:Content>
