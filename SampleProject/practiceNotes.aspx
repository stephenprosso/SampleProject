<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="practiceNotes.aspx.cs" Inherits="SampleProject.practiceNotes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

     <asp:Panel ID="Panel3" runat="server" DefaultButton="startAisleButton1">
                    <div class="row text-center" id="StartAisleDiv" style="display: none">

                        <%--<asp:Label ID="Label1" runat="server" Text="Scan Aisle: "></asp:Label>--%>
                        <div class="group">
                            <input id="startAisleTB" type="text" runat="server" />
                            <br />
                            <asp:Button ID="startAisleButton1" runat="server" CssClass="button" Text="Continue" OnClientClick="sendStartAisle(); return false;" Style="display: none" />
                            <br />
                            <asp:Button ID="sendBackFromStartAisleButton" CssClass="button" runat="server" Text="Back" OnClientClick="sendBackFromStartAisle(); return false;" />
                            <br />
                            <asp:Button ID="clearCartButtononStartAisle" runat="server" CssClass="button centered" Text="Clear Cart" OnClientClick="sendClearCartFromBatchSetup(); return false;" />


                        </div>
                    </div>
                </asp:Panel>

</asp:Content>
