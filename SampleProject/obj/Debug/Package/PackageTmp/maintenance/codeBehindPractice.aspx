<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="codeBehindPractice.aspx.cs" Inherits="SampleProject.maintenance.codeBehindPractice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
     <div class="row text-center">
        <h2><%: Title %></h2>
    </div>
    <div class="row text-center">
        <asp:Panel ID="ScanCartPanel" runat="server" DefaultButton="ScanCartButton">
            <dx:ASPxLabel ID="ScanCartTBLabel" runat="server" Text="Scan a Cart"></dx:ASPxLabel>
            <dx:ASPxTextBox ID="ScanCartTB" runat="server" Width="170px"></dx:ASPxTextBox>
             <dx:ASPxButton ID="ScanCartButton" runat="server" Text="Scan Cart" OnClick="SendScanCartID" ClientInstanceName="ScanCartID" AutoPostBack="False" UseSubmitBehavior="false" Visible="false">
                </dx:ASPxButton>
        </asp:Panel>
        <asp:Panel ID="NewCartPanel" runat="server">
            <div class="borderd">
                <p>This is a new cart!</p>

            </div>
        </asp:Panel>
    </div>
    <div class="row">
    </div>
    <div class="row">
    </div>
</asp:Content>
