<%@ Page Title="CartSetup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CartSetup.aspx.cs" Inherits="SampleProject.CartSetup" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <script src="JS/PromatV2.js">
    </script>
    <script type="text/javascript">
        window.onload = start;

    </script>
    <div class="row text-center">
            <div class="col-xs-3"></div>
            <div class="col-xs-5 text-center">
                <div class="group">
                    <asp:Label ID="Label1" runat="server" Text="1" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID1" type="text" class="totecell" style="text-align: center" />
                </div>

                <div class="group">
                    <asp:Label ID="Label2" runat="server" Text="2" CssClass="totecelllabel"></asp:Label>
                    <br />
                    <input readonly id="TBID2" type="text" class="totecell" style="text-align: center" />

                </div>
                <div class="group">
                    <asp:Label ID="Label3" runat="server" Text="3" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID3" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label4" runat="server" Text="4" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID4" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label5" runat="server" Text="5" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID5" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label6" runat="server" Text="6" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID6" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label7" runat="server" Text="7" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID7" type="text" class="totecell" style="text-align: center" />
                </div>
                <br />
                <br />

                <div class="group">
                    <asp:Label ID="Label8" runat="server" Text="8" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID8" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label9" runat="server" Text="9" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID9" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label10" runat="server" Text="10" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID10" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label11" runat="server" Text="11" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID11" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <input readonly id="TBID26" type="text" class="totecell" />
                </div>
                <div class="group">
                    <input readonly id="TBID27" type="text" class="totecell" />
                </div>
                <div class="group">
                    <input readonly id="TBID28" type="text" class="totecell" />
                </div>
                <br />
                <br />
                <div class="group">
                    <asp:Label ID="Label12" runat="server" Text="12" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID12" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label13" runat="server" Text="13" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID13" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label14" runat="server" Text="14" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID14" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label15" runat="server" Text="15" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID15" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label16" runat="server" Text="16" CssClass="totecelllabel" BorderStyle="None"></asp:Label>
                    <br>
                    <input readonly id="TBID16" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label17" runat="server" Text="17" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID17" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label18" runat="server" Text="18" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID18" type="text" class="totecell" style="text-align: center" />
                </div>
                <br />
                <br />
                <div class="group">
                    <asp:Label ID="Label19" runat="server" Text="19" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID19" type="text" class="totecell" style="text-align: center" placeholder="SCAN"/>
                </div>
                <div class="group">
                    <asp:Label ID="Label20" runat="server" Text="20" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID20" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label21" runat="server" Text="21" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID21" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label22" runat="server" Text="22" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID22" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label23" runat="server" Text="23" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID23" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label24" runat="server" Text="24" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID24" type="text" class="totecell" style="text-align: center" />
                </div>
                <div class="group">
                    <asp:Label ID="Label25" runat="server" Text="25" CssClass="totecelllabel"></asp:Label>
                    <br>
                    <input readonly id="TBID25" type="text" class="totecell" style="text-align: center" />
                </div>
            </div>
            <div class="col-xs-4"></div>

            <dx:BootstrapButton ID="ProcessBatchButton" runat="server" AutoPostBack="false" Text="Process Batch" Width="170px">
                <ClientSideEvents Click="ProcessBatchClick" />
            </dx:BootstrapButton>
            <br />
        </div>
        <div class="row text-center">
        </div>

</asp:Content>
