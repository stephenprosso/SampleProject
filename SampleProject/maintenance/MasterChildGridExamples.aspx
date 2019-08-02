<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage1.master" AutoEventWireup="true" CodeBehind="MasterChildGridExamples.aspx.cs" Inherits="SampleProject.maintenance.MasterChildGridExamples" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
      <div class="Container" id="SupervisorContent" style="visibility: hidden;">
        <div class="row text-center">
            <h2><%: Title %></h2>

        </div>

        <div class="row text-center">

            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="centered" KeyFieldName="Part_Number">
                <Settings ShowTitlePanel="true" ShowFilterRow="true" />
                <SettingsText Title="Part Master" />
                <Settings ShowFilterRow="True" ShowTitlePanel="true"></Settings>
                <Styles Header-Wrap="True" Cell-HorizontalAlign="Center">
                </Styles>
                <SettingsText Title="Past Master" />
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0" ShowNewButtonInHeader="True" ShowDeleteButton="True" ShowEditButton="True"></dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Part_Number" VisibleIndex="1" Caption="Part Number"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Description_1" VisibleIndex="2" Caption="Description 1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Description_2" VisibleIndex="3" Caption="Description 2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UPC_Code_1" VisibleIndex="4" Caption="UPC Code 1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UPC_Code_2" VisibleIndex="5" Caption="UPC Code 2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UPC_Code_3" VisibleIndex="6" Caption="UPC Code 3"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Unit_of_Measure" VisibleIndex="7" Caption="Unit of Measure"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Case_Qty" VisibleIndex="8" Caption="Case Qty"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Part_Length" VisibleIndex="9" Caption="Part Length"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Part_Width" VisibleIndex="10" Caption="Part Width"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Part_Height" VisibleIndex="11" Caption="Part Height"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Part_Weight" VisibleIndex="12" Caption="Part Weight"></dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>' DeleteCommand="DELETE FROM [Part_Master_Supplement] WHERE (([Part_Number] = ?) OR ([Part_Number] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [Part_Master_Supplement] ([Part_Number], [Description_1], [Description_2], [UPC_Code_1], [UPC_Code_2], [UPC_Code_3], [Unit_of_Measure], [Case_Qty], [Part_Length], [Part_Width], [Part_Height], [Part_Weight]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>' SelectCommand="SELECT * FROM [Part_Master_Supplement] ORDER BY [Part_Number]" UpdateCommand="UPDATE [Part_Master_Supplement] SET [Description_1] = ?, [Description_2] = ?, [UPC_Code_1] = ?, [UPC_Code_2] = ?, [UPC_Code_3] = ?, [Unit_of_Measure] = ?, [Case_Qty] = ?, [Part_Length] = ?, [Part_Width] = ?, [Part_Height] = ?, [Part_Weight] = ? WHERE (([Part_Number] = ?) OR ([Part_Number] IS NULL AND ? IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="Part_Number" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Part_Number" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Description_1" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Description_2" Type="String"></asp:Parameter>
                    <asp:Parameter Name="UPC_Code_1" Type="String"></asp:Parameter>
                    <asp:Parameter Name="UPC_Code_2" Type="String"></asp:Parameter>
                    <asp:Parameter Name="UPC_Code_3" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Unit_of_Measure" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Case_Qty" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Part_Length" Type="Double"></asp:Parameter>
                    <asp:Parameter Name="Part_Width" Type="Double"></asp:Parameter>
                    <asp:Parameter Name="Part_Height" Type="Double"></asp:Parameter>
                    <asp:Parameter Name="Part_Weight" Type="Double"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Description_1" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Description_2" Type="String"></asp:Parameter>
                    <asp:Parameter Name="UPC_Code_1" Type="String"></asp:Parameter>
                    <asp:Parameter Name="UPC_Code_2" Type="String"></asp:Parameter>
                    <asp:Parameter Name="UPC_Code_3" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Unit_of_Measure" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Case_Qty" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Part_Length" Type="Double"></asp:Parameter>
                    <asp:Parameter Name="Part_Width" Type="Double"></asp:Parameter>
                    <asp:Parameter Name="Part_Height" Type="Double"></asp:Parameter>
                    <asp:Parameter Name="Part_Weight" Type="Double"></asp:Parameter>
                    <asp:Parameter Name="Part_Number" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            <div class="row text-center">
                <dx:ASPxLabel ID="PartHistoryTBLabel" runat="server" Text="Search Part History" CssClass="centered"></dx:ASPxLabel>
                <dx:ASPxTextBox ID="PartHistoryTB" runat="server" Width="170px" AutoPostBack="true" CssClass="centered"></dx:ASPxTextBox>
                <dx:ASPxGridView ID="PartHistoryGridview" runat="server" AutoGenerateColumns="False" DataSourceID="PartHistoryDS" KeyFieldName="LogId" CssClass="centered">
                    <Settings ShowFilterRow="True" ShowTitlePanel="true"></Settings>
                    <SettingsText Title="Past History" />
                    <Styles Header-Wrap="True" Cell-HorizontalAlign="Center">
                    </Styles>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Part_Number" VisibleIndex="0" Caption="Part Number"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Description_1" VisibleIndex="1" Caption="Description 1"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Description_2" VisibleIndex="2" Caption="Description 2"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UPC_Code_1" VisibleIndex="3" Caption="UPC Code 1"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UPC_Code_2" VisibleIndex="4" Caption="UPC Code 2"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UPC_Code_3" VisibleIndex="5" Caption="UPC Code 3"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Unit_of_Measure" VisibleIndex="6" Caption="Unit of Measure"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Case_Qty" VisibleIndex="7" Caption="Case Qty"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Part_Length" VisibleIndex="8" Caption="Part Length"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Part_Width" VisibleIndex="9" Caption="Part Width"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Part_Height" VisibleIndex="10" Caption="Part Height"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Part_Weight" VisibleIndex="11" Caption="Part Weight"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="12" Caption="Type"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UserId" VisibleIndex="13" Caption="User Id"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="EventTime" VisibleIndex="14" Caption="Event Time"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="LogId" ReadOnly="True" VisibleIndex="15">
                            <EditFormSettings Visible="False"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="EventId" VisibleIndex="16"></dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="PartHistoryDS" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>' ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>' SelectCommand="SELECT * FROM [Part_Master_Supplement_Log] WHERE ([Part_Number] = ?)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="PartHistoryTB" PropertyName="Text" Name="Part_Number" Type="String"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>

</asp:Content>
