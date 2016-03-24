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
            <div class="dnnFormItem">
                <%--<dnn:label ID="lblUploadImage" runat="server" />--%>
                <dnn:label ID="lblImgSelected" runat="server" />
                <asp:Image ID="imgPreview" runat="server" CssClass="news-image" AlternateText="News image" ImageUrl="~/DesktopModules/JSNewsModule/Images/Default Image.png" />
                <asp:LinkButton ID="btnDeleteImg" runat="server" CssClass="btn btn-danger link-delete" ResourceKey="btnDeleteImg.Text" />
                <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" Enabled="false" />

            </div>

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
            <div class="dnnFormItem controls">
                <asp:LinkButton ID="btnAddImage" runat="server" OnClick="btnAddImage_Click" resourcekey="btnAddImage" CssClass="btn btn-primary link-add" />
                <asp:HyperLink ID="btnSubmit" runat="server" resourcekey="btnSubmit" CssClass="btn btn-primary link-list" />
                <asp:LinkButton ID="btnCancel" runat="server" OnClick="btnCancel_Click" resourcekey="btnCancel" CssClass="btn btn-default link-cancel" />
            </div>
        </fieldset>
    </div>
</div>

<script type="text/javascript" src="<%= ModulePath %>Js/main.js"></script>
