<%@ Page Title="CardView" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CardViewScreen.aspx.cs" Inherits="SampleProject.CardViewScreen" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
    <div class="jumbotron text-center">
        <h1>Welcome to the Card View</h1>
    </div>
    <div class="row text-center">
        <div class="col-xs-6">
            <dx:ASPxLabel ID="ASPxLabelCardView" runat="server" Text="Enter Cart Number:"></dx:ASPxLabel>
            <dx:ASPxTextBox ID="CardViewTextBox" runat="server" Width="170px" AutoPostBack="true" CssClass="centered"></dx:ASPxTextBox>
        </div>
        <div class="col-xs-6">
            <dx:ASPxLabel ID="toteTBLabel" runat="server" Text="Scan Totes:"></dx:ASPxLabel>
            <dx:ASPxTextBox ID="toteTB" runat="server" Width="170px" AutoPostBack="false" CssClass="centered">
            </dx:ASPxTextBox>
            <asp:Button ID="toteButton" runat="server" Text="scanTote" OnClick="Button1_Click" />
        </div>
    </div>
    <div class="row text-center">
        <dx:ASPxCardView ID="ASPxCardView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="centered" KeyFieldName="Cart_ID">
            <SettingsExport ExportSelectedCardsOnly="False"></SettingsExport>
            <SettingsBehavior AllowFocusedCard="true" />
            <Settings LayoutMode="table" ></Settings>
            <Styles FlowCard-Height="100" FlowCard-Width="100"></Styles>
            <EditFormLayoutProperties></EditFormLayoutProperties>
            <SettingsPager SettingsFlowLayout-ItemsPerPage="28" SettingsTableLayout-ColumnCount="7" SettingsTableLayout-RowsPerPage="4" PageSizeItemSettings-ShowAllItem="true"></SettingsPager>
            <Columns>
                <dx:CardViewTextColumn FieldName="Cart_ID" VisibleIndex="0" Visible="false">
                </dx:CardViewTextColumn>
                <dx:CardViewTextColumn FieldName="Cart_Position" VisibleIndex="1">
                </dx:CardViewTextColumn>
                <dx:CardViewTextColumn FieldName="Light_Position" VisibleIndex="2">
                </dx:CardViewTextColumn>
                <dx:CardViewTextColumn FieldName="Tote_Number" VisibleIndex="3">
                </dx:CardViewTextColumn>
                <dx:CardViewTextColumn FieldName="Batch_ID" VisibleIndex="4">
                </dx:CardViewTextColumn>
                <dx:CardViewCheckColumn FieldName="Full_Tote" VisibleIndex="5" Visible="false">
                </dx:CardViewCheckColumn>
            </Columns>

            <StylesExport>
                <Card BorderSize="1" BorderSides="All"></Card>

                <Group BorderSize="1" BorderSides="All"></Group>

                <TabbedGroup BorderSize="1" BorderSides="All"></TabbedGroup>

                <Tab BorderSize="1"></Tab>
            </StylesExport>
        </dx:ASPxCardView>

        <asp:SqlDataSource ID="SqlDataSource2" 
                           runat="server"
                           ConnectionString="<%$ ConnectionStrings:ConnectToAgron %>" 
            ProviderName="<%$ ConnectionStrings:ConnectToAgron.ProviderName %>" 
            SelectCommand="SELECT * FROM [Cart_Detail] WHERE ([Cart_ID] = ?) order by light_position">
            <SelectParameters>
                <asp:ControlParameter ControlID="CardViewTextBox" Name="Cart_ID" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
