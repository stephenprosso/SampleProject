<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MasterDeatailGridViews.aspx.cs" Inherits="SampleProject.maintenance.MasterDeatailGridViews" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
      <script type="text/javascript">
        function updateDetailGridview(s, e) {
            console.log('update Grid triggered!');
            DetailGridview.PerformCallback();
        }

    </script>
    <div class="row text-center">
        <h2><%: Title %></h2>
        <dx:ASPxGridView ID="ASPxGridView2" runat="server"></dx:ASPxGridView>
    </div>
    <div class="row text-center">
        <dx:ASPxGridView ID="HeaderGridview" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Location" CssClass="centered">
            <Settings ShowTitlePanel="true" ShowFilterRow="true" />
            <SettingsText Title="Consolidation Location Header" />
            <SettingsBehavior AllowFocusedRow="true" FilterRowMode="Auto" AllowClientEventsOnLoad="false" />
            <ClientSideEvents FocusedRowChanged="updateDetailGridview" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Location" ReadOnly="True" VisibleIndex="0" Caption="Location"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cell_Size" VisibleIndex="1" Caption="Cell Size"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Order_Number" VisibleIndex="2" Caption="Order Number"></dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Location_Full" VisibleIndex="3" Caption="Location Full"></dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="Consolidation_Status" VisibleIndex="4" Caption="Consolidation Status"></dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Initial_Consolidation_Eventtime" VisibleIndex="5" Caption="Initial Consolidation Eventtime"></dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Initial_Consolidation_User" VisibleIndex="6" Caption="Initial Consolidation User"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Sort_Path" VisibleIndex="7" Caption="Sort Path"></dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>'
            ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
            SelectCommand="SELECT * FROM [Consolidation_Location_Header]"></asp:SqlDataSource>
    </div>
    <br />
    <div class="row text-center">

        <dx:ASPxGridView ID="DetailGridview" runat="server" ClientInstanceName="DetailGridview" AutoGenerateColumns="False" DataSourceID="DetailDS" KeyFieldName="Location" CssClass="centered" OnCustomCallback="DetailGridview_CustomCallback">
            <Settings ShowTitlePanel="true" ShowFilterRow="true" />
            <SettingsDetail ShowDetailRow="true" />
            <SettingsText Title="Consolidation Location Details" />
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" CssClass="centered" DataSourceID="SqlDataSource2" KeyFieldName="seq_#" OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect">
                        <Styles Header-Wrap="True" Cell-HorizontalAlign="Center">
                        </Styles>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Order_Number" VisibleIndex="0" Caption="Order_Number"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Line_Number" VisibleIndex="1" Caption="Line_Number"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Container_ID" VisibleIndex="2" Caption="Container_ID"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PO_Number" VisibleIndex="3" Caption="PO_Number"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Part_Number" VisibleIndex="4" Caption="Part_Number"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Order_Quantity" VisibleIndex="5" Caption="Order_Quantity"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Zone_Grouping" VisibleIndex="6" Caption="Zone_Grouping"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Zone" VisibleIndex="7" Caption="Zone"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Host_Location" VisibleIndex="8" Caption="Host_Location"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Sort_Path" VisibleIndex="9" Caption="Sort_Path"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Tote_Number" VisibleIndex="10" Caption="Tote_Number"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Alloc_Weight" VisibleIndex="11" Caption="Alloc_Weight"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Alloc_Cube" VisibleIndex="12" Caption="Alloc_Cube"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Alloc_Qty" VisibleIndex="13" Caption="Alloc_Qty"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Picked_Qty" VisibleIndex="14" Caption="Picked_Qty"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn FieldName="Picked_Flag" VisibleIndex="15" Caption="Picked_Flag"></dx:GridViewDataCheckColumn>
                            <dx:GridViewDataDateColumn FieldName="Picked_Date" VisibleIndex="16" Caption="Picked Date"></dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Picked_User" VisibleIndex="17" Caption="Picked User"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Picked_Cart" VisibleIndex="18" Caption="Picked Cart"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="seq_#" ReadOnly="True" VisibleIndex="19" Caption="Seq #">
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>' ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>' SelectCommand="SELECT * FROM [Allocation_Tote_Assignment] WHERE ([seq_#] = ?)">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="ATA_Seq_#" Name="seq_#" Type="String"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </DetailRow>
            </Templates>
            <Columns>

                <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="0" Caption="Location"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Order_Number" VisibleIndex="1" Caption="Order Number"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Container_ID" VisibleIndex="2" Caption="Container ID"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LPN" VisibleIndex="3" Caption="LPN"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ATA_Seq_#" VisibleIndex="4" Caption="ATA Seq #"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Consolidation_User" VisibleIndex="5" Caption="Consolidation User"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Consolidated_Qty" VisibleIndex="6" Caption="Consolidated Qty"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Consolidation_Seq_#" ReadOnly="True" VisibleIndex="7" Caption="Consolidation Seq #">
                    <EditFormSettings Visible="False"></EditFormSettings>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>

        <asp:SqlDataSource ID="DetailDS" runat="server"
            ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>'
            ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
            SelectCommand="SELECT * FROM [Consolidation_Location_Detail] where ([Location] = ?)">
            <SelectParameters>
                <asp:Parameter Name="Location" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
