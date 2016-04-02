<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddImage.ascx.cs" Inherits="JS.Modules.JSImageRotator.AddImage" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>


<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />

<div class="JSRotator">
    <div class="dnnForm add-img">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon">
                <%=LocalizeString("Title")%>
                <a href="http://www.joopsoft.com/" title="JoopSOFT.com" class="link-dev">JoopSOFT.com</a>
            </h3>
        </div>

        <fieldset>
            <asp:Panel ID="pnlMsgBox" runat="server" class="dnnFormItem" Visible="false">
                <div class="dnnFormSectionHead">
                    <asp:Label ID="lblAddedImage" runat="server" CssClass="dnnFormMessage dnnFormInfo" />
                </div>
            </asp:Panel>
            <div class="dnnFormItem">
                <dnn:label ID="lblImage" runat="server" />
                <asp:FileUpload ID="btnImageSelect" runat="server" />
                <asp:LinkButton ID="btnImageUpload" runat="server" ResourceKey="btnUpload" CssClass="dnnSecondaryAction link-upload" OnClick="btnImageUpload_Click" />
            </div>
            <asp:Panel ID="pnlImgSelected" runat="server" CssClass="dnnFormItem">
                <%--<dnn:label ID="lblUploadImage" runat="server" />--%>
                <dnn:label ID="lblImgSelected" runat="server" />
                <asp:Image ID="imgPreview" runat="server" CssClass="rotator-image" Visible="false" AlternateText="Rotator Image" ImageUrl="~/DesktopModules/JSNewsModule/Images/Default Image.png" />
                <asp:LinkButton ID="btnDeleteImg" runat="server" CssClass="btn btn-danger link-delete" Visible="false" ResourceKey="btnDeleteImg.Text" OnClick="btnDeleteImg_Click" />
                <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" Enabled="false" />
            </asp:Panel>
            <asp:Panel ID="pnlAddToList" runat="server" CssClass="dnnFormItem">
                <dnn:label ID="lblAvailableLists" runat="server" Visible="false" />
                <asp:CheckBox ID="cbAddToList" runat="server" Visible="false" OnCheckedChanged="cbAddToList_CheckedChanged" AutoPostBack="true" />
                <asp:DropDownList ID="lstAvailableLists" runat="server" Visible="false" />
            </asp:Panel>
            <asp:Panel ID="pnlConfirmDelete" runat="server" Visible="false">
                <div class="popup-wrapper">
                    <asp:Label ID="lblConfirmIcon" runat="server" />
                    <h3>
                        <asp:Label ID="lblConfirmDelete" runat="server" CssClass="popup-msg"
                            ResourceKey="lblConfirmDelete" />
                    </h3>
                    <asp:LinkButton ID="btnYes" runat="server" CssClass="primary-action btn btn-danger link-delete"
                        OnClick="btnYes_Click" ResourceKey="btnYes"
                        data-toggle="tooltip" ToolTip='Delete Image' />
                    <asp:LinkButton ID="btnNo" runat="server" CssClass="close-action btn btn-default link-close"
                        OnClick="btnNo_Click" ResourceKey="btnNo-RRRRRRRRRRRRRRR"
                        data-toggle="tooltip" ToolTip='Close' />
                </div>
            </asp:Panel>

            <div class="dnnFormItem">
                <dnn:label ID="lblTitle" runat="server" />
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
            </div>
            <div class="dnnFormItem">
                <dnn:label ID="lblDescription" runat="server" />
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control teaser-txt" TextMode="MultiLine" />
            </div>
            <div class="dnnFormItem">
                <dnn:label ID="lblPhotographer" runat="server" />
                <asp:TextBox ID="txtPhotographer" runat="server" CssClass="form-control" />
            </div>
            <div class="dnnFormItem">
                <dnn:label ID="lblContact" runat="server" />
                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" />
            </div>
        </fieldset>
    </div>
    <div class="dnnForm controls">
        <div class="dnnFormItem">
            <asp:LinkButton ID="btnAddImage" runat="server" OnClick="btnAddImage_Click" resourcekey="btnAddImage" CssClass="btn btn-primary link-add" />
            <asp:HyperLink ID="btnSubmit" runat="server" resourcekey="btnSubmit" CssClass="btn btn-primary link-list" />
            <asp:LinkButton ID="btnCancel" runat="server" OnClick="btnCancel_Click" resourcekey="btnCancel" CssClass="btn btn-default link-cancel" />
        </div>
    </div>
</div>

<script type="text/javascript" src="<%= ModulePath %>Js/main.js"></script>
