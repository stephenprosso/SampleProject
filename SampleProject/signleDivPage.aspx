<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="signleDivPage.aspx.cs" Inherits="SampleProject.signleDivPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

    <div class="group">
        <asp:Label ID="Label1" runat="server" Text="1" CssClass="totecelllabel"></asp:Label>
        <br>
        <input readonly id="TBID1" type="text" class="totecell" style="text-align: center" />
    </div>
    <div class="group">
        <asp:Label runat="server" Text="6" CssClass="totecelllabel" style="text-align: center"></asp:Label>
        <br>
        <asp:Label runat="server" Text="678" CssClass="totecelllabel1" style="text-align: center"></asp:Label>

    </div>
</asp:Content>
