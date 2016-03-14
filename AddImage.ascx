<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddImage.ascx.cs" Inherits="JS.Modules.JSImageRotator.AddImage" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<div class="dnnForm dnnEditBasicSettings" id="dnnEditBasicSettings">
    <div class="dnnFormExpandContent dnnRight "><a href=""><%=LocalizeString("ExpandAll")%></a></div>

    <h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead dnnClear">
        <a href="" class="dnnSectionExpanded">
            <%=LocalizeString("BasicSettings")%></a></h2>
    <fieldset>
        <div class="dnnFormItem">
            <dnn:label ID="lblImage" runat="server" />
            <asp:TextBox ID="txtImageUrl" runat="server" Enabled="false" />
        </div>
        <div class="dnnFormItem">
            <dnn:label ID="lblUploadImage" runat="server" />
            <asp:FileUpload ID="btnImageSelect" runat="server" CssClass="btn btn-primary" />
            <asp:LinkButton ID="btnImageUpload" runat="server" ResourceKey="btnUpload.Text" CssClass="dnnSecondaryAction" OnClick="btnImageUpload_Click" />
        </div>
        <div class="dnnFormItem">
            <dnn:label ID="lblTitle" runat="server" />
            <asp:TextBox ID="txtTitle" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:label ID="lblDescription" runat="server" />
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" />
        </div>
        <div class="dnnFormItem">
            <dnn:label ID="lblPhotographer" runat="server" />
            <asp:TextBox ID="txtPhotographer" runat="server" />
        </div>
        <div class="dnnFormItem">
            <dnn:label ID="lblContact" runat="server" />
            <asp:TextBox ID="txtContact" runat="server" />
        </div>
    </fieldset>
</div>
<asp:LinkButton ID="btnSubmit" runat="server"
    OnClick="btnSubmit_Click" resourcekey="btnSubmit" CssClass="dnnPrimaryAction" />
<asp:LinkButton ID="btnCancel" runat="server"
    OnClick="btnCancel_Click" resourcekey="btnCancel" CssClass="dnnSecondaryAction" />

<script type="text/javascript">
    /*globals jQuery, window, Sys */
    (function ($, Sys) {
        function dnnEditBasicSettings() {
            $('#dnnEditBasicSettings').dnnPanels();
            $('#dnnEditBasicSettings .dnnFormExpandContent a').dnnExpandAll({ expandText: '<%=Localization.GetString("ExpandAll", LocalResourceFile)%>', collapseText: '<%=Localization.GetString("CollapseAll", LocalResourceFile)%>', targetArea: '#dnnEditBasicSettings' });
        }

        $(document).ready(function () {
            dnnEditBasicSettings();
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                dnnEditBasicSettings();
            });
        });

    }(jQuery, window.Sys));
</script>
