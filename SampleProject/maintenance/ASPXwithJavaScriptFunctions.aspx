<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ASPXwithJavaScriptFunctions.aspx.cs" Inherits="SampleProject.maintenance.ASPXwithJavaScriptFunctions" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v19.1, Version=19.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
       <div class="Container" id="SupervisorContent" style="visibility: hidden;">
        <script type="text/javascript">
            function updateDetailGrids(s, e) {
                console.log('update Grid triggered!');
                DetailGridview.PerformCallback();
            }
            function onShown(s, e) {
                setTimeout(function () { notificationPopup.Hide(); }, 3000);
            }

        </script>
        <div class="row text-center">
            <h2><%: Title %></h2>
        </div>
        <div class="row text-center">

            <dx:ASPxGridView ID="HeaderGridview" runat="server" DataSourceID="HeaderDS" CssClass="centered"
                AutoGenerateColumns="False" KeyFieldName="Cart_ID">
                <Settings ShowFilterRow="True" ShowTitlePanel="true"></Settings>
                <SettingsDataSecurity AllowEdit="False" AllowInsert="False" AllowDelete="False"></SettingsDataSecurity>
                <ClientSideEvents FocusedRowChanged="updateDetailGrids" />
                <SettingsBehavior AllowFocusedRow="true" FilterRowMode="Auto" AllowClientEventsOnLoad="false" />
                <SettingsText Title="Cart Header" />
                <Styles Header-Wrap="True" Cell-HorizontalAlign="Center">
                </Styles>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Cart_ID" ReadOnly="True" VisibleIndex="0" Caption="Cart ID"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cart_Setup" VisibleIndex="1" Caption="Cart Setup"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="Lightless_Cart" VisibleIndex="2" Caption="Lightless Cart"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="CartDaemon_Terminal" VisibleIndex="3" Caption="Cart Daemon Terminal"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Tablet_IP_Address" VisibleIndex="4" Caption="Tablet IP Address"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Printer_IP_Address" VisibleIndex="5" Caption="Printer IP Address"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ATOP_Controller_IP_Address" VisibleIndex="6" Caption="ATOP Controller IP Address"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="WebApp_SID" VisibleIndex="7" Caption="Web App SID" Visible="false"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CartDaemon_SID" VisibleIndex="8" Caption="Cart Daemon SID" Visible="false"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ATOPDaemon_SID" VisibleIndex="9" Caption="ATOP Deamon SID" Visible="false"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Current_Zone_Grouping" VisibleIndex="10" Caption="Current Zone Grouping"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Current_Bucket" VisibleIndex="11" Caption="Current Bucket"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Starting_Zone" VisibleIndex="12" Caption="Starting Zone"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Starting_Aisle" VisibleIndex="13" Caption="Starting Aisle"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="14" Caption="Status"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="User_Name" VisibleIndex="15" Caption="User Name"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="Eventtime" VisibleIndex="16" Caption=" Event Time"></dx:GridViewDataDateColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="HeaderDS"
                runat="server"
                ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>'
                ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
                SelectCommand="SELECT * FROM [Cart_Header]"></asp:SqlDataSource>
        </div>
        <br />
        <div class="row text-center">
            <div class="col-sm-6">
                <dx:ASPxButton ID="CleanUpCart" runat="server" Text="Cart Cleanup" OnClick="CartCleanUp" ClientInstanceName="CartCleanUp" AutoPostBack="False" UseSubmitBehavior="false" Width="170px">
                    <ClientSideEvents Click="function(s, e) {e.processOnServer = confirm('Clicking OK will change the cart status and remove all totes. Do you want to continue?');}" />
                </dx:ASPxButton>
            </div>
            <div class="col-sm-6">

                <dx:ASPxButton ID="RemoveToteButton" runat="server" Text="Remove Tote" OnClick="RemoveToteFromCart" AutoPostBack="False" UseSubmitBehavior="false" Width="170px">
                </dx:ASPxButton>
            </div>
        </div>

        <br />


        <div class="row text-center">
            <dx:ASPxGridView ID="DetailGridview" runat="server" CssClass="centered" DataSourceID="DetailDS"
                AutoGenerateColumns="False" OnCustomCallback="DetailGridview_CustomCallback" ClientInstanceName="DetailGridview" KeyFieldName="Cart_ID">
                <Settings ShowFilterRow="True" ShowTitlePanel="true"></Settings>
                <SettingsDataSecurity AllowEdit="False" AllowInsert="False" AllowDelete="False"></SettingsDataSecurity>
                <SettingsBehavior AllowFocusedRow="true" FilterRowMode="Auto" AllowClientEventsOnLoad="false" />
                <Styles Header-Wrap="True" Cell-HorizontalAlign="Center">
                </Styles>
                <SettingsBehavior FilterRowMode="Auto" AllowClientEventsOnLoad="false" />
                <SettingsText Title="Cart Details" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Cart_ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Cart ID"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cart_Position" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Cart Position"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Light_Position" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Light Position"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Tote_Number" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Tote Number"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Order_Number" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Order Number"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Container_ID" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Container ID"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="Full_Tote" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Full Tote"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="Batch_Complete" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Batch Complete"></dx:GridViewDataCheckColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="DetailDS" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>'
                ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
                SelectCommand="SELECT * FROM [Cart_Detail] WHERE ([Cart_ID] = ?)">
                <SelectParameters>
                    <asp:Parameter Name="Cart_ID" Type="String" />

                </SelectParameters>
            </asp:SqlDataSource>
            <dx:ASPxPopupControl ID="notificationPopup" runat="server" ClientInstanceName="notificationPopup" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowOnPageLoad="false">
                <ClientSideEvents Shown="onShown" />
            </dx:ASPxPopupControl>
        </div>
        <%--<div class="row text-center">
            <a class="btn btn-primary" href="CreateChangeCart" role="button">Create or Change Cart</a>
        </div>--%>
    </div>
</asp:Content>
