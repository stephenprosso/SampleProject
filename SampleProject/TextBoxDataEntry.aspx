<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="TextBoxDataEntry.aspx.cs" Inherits="SampleProject.TextBoxDataEntry" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script type="text/javascript">

        function DoProcessEnterKey(htmlEvent, editName) {
            if (htmlEvent.keyCode == 13) {
                ASPxClientUtils.PreventEventAndBubble(htmlEvent);
                if (editName) {
                    ASPxClientControl.GetControlCollection().GetByName(editName).SetFocus();
                } else {
                    btn.DoClick();
                }
            }
        }

                // var webserviceURL = "http://" + location.hostname + "/cgi-bin/DoveTrackBrokerCGI.exe?-APPNAME=AgronWeb&-PRGNAME="


        //function submitToteNumbers() {
        //    $.ajax({

        //        url: webserviceURL + "SubmitTotes&-ARGUMENTS=-A" + UserID + ",-A" + Password,
        //        success: alert('Great Job')
        //    });
        //}
    </script>

    <div>

        <div class="row">
            <div class="col-xs-2">
                <dx:aspxlabel id="ASPxLabel1" runat="server" text="ASPxLabel" associatedcontrolid="ASPxTextBox1"></dx:aspxlabel>
                <dx:aspxtextbox id="ASPxTextBox1" runat="server" cssclass="totecell centered" maxlength="7" clientinstancename="tb1" backcolor="Blue" focusedstyle-backcolor="Green" forecolor="White" text="SCAN">
                <ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent, 'tb2'); }" />
            </dx:aspxtextbox>
            </div>
            <div class="col-xs-2">
                <dx:aspxlabel id="ASPxLabel2" runat="server" text="ASPxLabel" associatedcontrolid="ASPxTextBox2"></dx:aspxlabel>
                <dx:aspxtextbox id="ASPxTextBox2" runat="server" cssclass="totecell centered" maxlength="7" clientinstancename="tb2" backcolor="Blue" focusedstyle-backcolor="Green" forecolor="White" text="SCAN">
                <ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent, 'tb3'); }" />
            </dx:aspxtextbox>
            </div>
            <div class="col-xs-2">
                <dx:aspxlabel id="ASPxLabel3" runat="server" text="ASPxLabel" associatedcontrolid="ASPxTextBox3"></dx:aspxlabel>
                <dx:aspxtextbox id="ASPxTextBox3" runat="server" cssclass="totecell centered" maxlength="7" clientinstancename="tb3" backcolor="Blue" focusedstyle-backcolor="Green" forecolor="White" text="SCAN">
                <ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent, 'tb4'); }" />
            </dx:aspxtextbox>
            </div>
            <div class="col-xs-2">
                <dx:aspxlabel id="ASPxLabel4" runat="server" text="ASPxLabel" associatedcontrolid="ASPxTextBox4"></dx:aspxlabel>
                <dx:aspxtextbox id="ASPxTextBox4" runat="server" cssclass="totecell centered" maxlength="7" clientinstancename="tb4" backcolor="Blue" focusedstyle-backcolor="Green" forecolor="White" text="SCAN">
                <ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent, 'tb5'); }" />
            </dx:aspxtextbox>
            </div>
            <div class="col-xs-2">
                <dx:aspxlabel id="ASPxLabel5" runat="server" text="ASPxLabel" associatedcontrolid="ASPxTextBox5"></dx:aspxlabel>
                <dx:aspxtextbox id="ASPxTextBox5" runat="server" cssclass="totecell centered" maxlength="7" clientinstancename="tb5" backcolor="Blue" focusedstyle-backcolor="Green" forecolor="White" text="SCAN">
                <ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent, 'tb6'); }" />
            </dx:aspxtextbox>
            </div>
            <div class="col-xs-2">
                <dx:aspxlabel id="ASPxLabel6" runat="server" text="ASPxLabel" associatedcontrolid="ASPxTextBox6"></dx:aspxlabel>
                <dx:aspxtextbox id="ASPxTextBox6" runat="server" cssclass="totecell centered" maxlength="7" clientinstancename="tb6" backcolor="Blue" focusedstyle-backcolor="Green" forecolor="White" text="SCAN" captionsettings-horizontalalign="Center">
                <ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent, ''); }" />
            </dx:aspxtextbox>
            </div>
        </div>

    </div>

</asp:Content>
