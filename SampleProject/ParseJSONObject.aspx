<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ParseJSONObject.aspx.cs" Inherits="SampleProject.ParseJSONObject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="JS/ParseJSONObject.js">
    </script>
    <script type="text/javascript">
        window.onload = start;

    </script>
    <div class="container-fluid">
        <div class="row listrow">

            <%--    <div class="row text-center" id="pickDiv">
        <div class="info">
            <asp:Label ID="actionLabel" runat="server" Text="Action"></asp:Label>

            <p id="action"></p>

            <asp:Label ID="cartNumberLabel" runat="server" Text="Cart Number"></asp:Label>
            <p id="Cart"></p>
            <asp:Label ID="Label1" runat="server" Text="Part Number"></asp:Label>
            <p id="Part"></p>
            <asp:Label ID="locationLabel" runat="server" Text="Location"></asp:Label>
            <p id="Location"></p>

        </div>

    </div>
    <div class="row">
        <div class="col-sm-6">
            <asp:Label ID="batchposLabel1" runat="server" Text="Position"></asp:Label>
            <p id="Pos1"></p>
            <asp:Label ID="posOrderLabel1" runat="server" Text="batchpos"></asp:Label>
            <p id="posOrder1"></p>
            <asp:Label ID="posRequestQtyLabel1" runat="server" Text="Request Qty"></asp:Label>
            <p id="posRequestQty1"></p>
            <asp:Label ID="posActualQtyLabel1" runat="server" Text="Actual qty"></asp:Label>
            <p id="posActualQty1"></p>

        </div>


        <div class="col-sm-6">
            <asp:Label ID="Label2" runat="server" Text="Position"></asp:Label>
            <p id="Pos2"></p>
            <asp:Label ID="Label3" runat="server" Text="batchpos"></asp:Label>
            <p id="posOrder2"></p>
            <asp:Label ID="Label4" runat="server" Text="Request Qty"></asp:Label>
            <p id="posRequestQty2"></p>
            <asp:Label ID="Label5" runat="server" Text="Actual qty"></asp:Label>
            <p id="posActualQty2"></p>

        </div>
    </div>--%>

            <asp:ListView ID="toteListView" runat="server"> 

                 <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <itemtemplate>
                    <td runat="server" class="toteCell" style="padding: 10px;">
                        <div class="container" style='background-color:violet'>
                            <div class="row light-pos-wrapper">
                                <div class="col text-center">
                                    <asp:Label ID="Light_PositionLabel" runat="server" Text= "<%# DataBinder.Eval(Container.DataItem, "Action").ToString() %>" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col text-center">
                                    <asp:Label ID="Tote_NumberLabel" runat="server" Text="Ze 2 Label" />
                                    <br />
                                    <%-- <asp:Label ID="Batch_IDLabel" runat="server" Text='<%# Eval("Batch_ID") %>' />--%>
                                    <asp:Label ID='Order_TypeLabel' runat='server' Text="Ze Order Label" Visible="false" />
                                    <asp:Label ID="Num_Overflow_TotesLabel" runat="server" Text="Ze zote over flow" Visible="false" />
                                </div>
                            </div>
                        </div>
                    </td>
                </itemtemplate>
                <layouttemplate>
                    <table runat="server" class="toteTable table">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">

                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </layouttemplate>
                <selecteditemtemplate>
                    <td runat="server" class="toteCell" style="padding: 10px;">
                        <div class="container" style='background-color:purple'>
                            <div class="row light-pos-wrapper">
                                <div class="col text-center">
                                    <asp:Label ID="Label1" runat="server" Text="Light_Position" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col text-center">
                                    <asp:Label ID="Label2" runat="server" Text="Tote_Number" />
                                    <br />
                                    <asp:Label ID='Label3' runat='server' Text="Order_Type" Visible="false" />
                                    <asp:Label ID="Label4" runat="server" Text="Over FLow" Visible="false" />
                                </div>
                            </div>
                        </div>
                    </td>
                </selecteditemtemplate>
            </asp:ListView>
            <dx:ASPxListBox ID="ASPxListBox1" runat="server" ValueType="System.String">

                
            </dx:ASPxListBox>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true">


               
            </asp:GridView>
        </div>
    </div>

</asp:Content>
