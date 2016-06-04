<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddImage.ascx.cs" Inherits="JS.Modules.JSImageRotator.AddImage" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />
<dnn:DnnCssInclude ID="moduleCss" runat="server" FilePath="~/DesktopModules/JSImageRotator/module.min.css" />

<div class="JSRotator">
    <div class="dnnForm add-img">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <asp:HyperLink ID="joopSoft" runat="server" />
            </h3>
            <div class="dnnFormItem JSRotatorMenu">
                <asp:Panel ID="headerMenu" runat="server" CssClass="dnnFormMessage one-control dnnFormTitle no-spacing">
                    <asp:Label ID="lblAddedImage" runat="server" Text="Adding New Image" />
                </asp:Panel>
                <asp:HyperLink ID="btnEdit" runat="server" CssClass="btn btn-primary link-edit-square no-txt"
                    data-toggle="tooltip" ToolTip="Edit Lists" Visible="true" />
                <asp:HyperLink ID="btnLists" runat="server" CssClass="btn btn-primary link-list no-txt"
                    data-toggle="tooltip" ToolTip="Select Image Lists" Visible="true" />                
                <asp:HyperLink ID="lnkSettings" runat="server" CssClass="btn btn-primary link-settings no-txt"
                    ResourceKey="lnkSettings" ToolTip="Settings" />
            </div>
        </div>
        <fieldset>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblImage" runat="server" />
                    <asp:FileUpload ID="btnImageSelect" runat="server" data-target=".btnImgUpload" />
                    <asp:LinkButton ID="btnImageUpload" runat="server" CssClass="btnImgUpload dnnSecondaryAction link-upload"
                        OnClick="btnImageUpload_Click" ResourceKey="btnUpload" />
                </div>
                <asp:Panel ID="pnlImgSelected" runat="server" CssClass="dnnFormItem group" Visible="false">
                    <dnn:label ID="lblImgSelected" runat="server" />
                    <asp:Image ID="imgPreview" runat="server" CssClass="rotator-image"
                        AlternateText="Rotator Image" ImageUrl="~/DesktopModules/JSNewsModule/Images/Default Image.png" />
                    <asp:LinkButton ID="btnDeleteImg" runat="server" CssClass="btn btn-danger link-delete"
                        OnClick="btnDeleteImg_Click" ResourceKey="btnDeleteImg" />
                    <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control txt-img-url" Enabled="false" />
                </asp:Panel>
                <asp:Panel ID="pnlAddToList" runat="server" CssClass="dnnFormItem group" Visible="false">
                    <dnn:label ID="lblAvailableLists" runat="server" />
                    <asp:CheckBox ID="cbAddToList" runat="server" CssClass="hidder pull-left" 
                        data-target=".availableLists" />
                    <asp:DropDownList ID="ddAvailableLists" runat="server" CssClass="availableLists selectpicker single-select cb-group" 
                          />
                </asp:Panel>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblTitle" runat="server" />
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"
                        Placeholder="Enter Title" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblDescription" runat="server" />
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control teaser-txt" TextMode="MultiLine"
                        Placeholder="Enter Description" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblPhotographer" runat="server" />
                    <asp:TextBox ID="txtPhotographer" runat="server" CssClass="form-control"
                        Placeholder="Enter Photographer Name" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblContact" runat="server" />
                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"
                        Placeholder="Enter E-mail Address" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblGlobalFx" runat="server" />
                    <asp:CheckBox ID="cbGlobalFx" runat="server" CssClass="unhidder" data-target=".globalFx"
                        Checked="true" />
                </div>
                <div class="globalFx dnnFormItem group">
                    <dnn:Label ID="lblTransition" runat="server" />
                    <asp:DropDownList ID="ddTransition" runat="server" CssClass="form-control selectpicker single-select">
                        <asp:ListItem Value="default" Text="Default" />
                        <asp:ListItem Value="random" Text="Random" />
                        <asp:ListItem Value="fade" Text="Fade" />
                        <asp:ListItem Value="fade2" Text="Fade 2" />
                        <asp:ListItem Value="slideLeft" Text="Slide Left" />
                        <asp:ListItem Value="slideLeft2" Text="Slide Left II" />
                        <asp:ListItem Value="slideRight" Text="Slide Right" />
                        <asp:ListItem Value="slideRight2" Text="Slide Right II" />
                        <asp:ListItem Value="slideUp" Text="Slide Up" />
                        <asp:ListItem Value="slideUp2" Text="Slide Up II" />
                        <asp:ListItem Value="slideDown" Text="Slide Down" />
                        <asp:ListItem Value="slideDown2" Text="Slide Down II" />
                        <asp:ListItem Value="zoomIn" Text="Zoom In" />
                        <asp:ListItem Value="zoomIn2" Text="Zoom In II" />
                        <asp:ListItem Value="zoomOut" Text="Zoom Out" />
                        <asp:ListItem Value="zoomOut2" Text="Zoom Out II" />
                        <asp:ListItem Value="swirlLeft" Text="Swirl Left" />
                        <asp:ListItem Value="swirlLeft2" Text="Swirl Left II" />
                        <asp:ListItem Value="swirlRight" Text="Swirl Right" />
                        <asp:ListItem Value="swirlRight2" Text="Swirl Right II" />
                        <asp:ListItem Value="burn" Text="Burn" />
                        <asp:ListItem Value="burn2" Text="Burn II" />
                        <asp:ListItem Value="blur" Text="Blur" />
                        <asp:ListItem Value="blur2" Text="Blur II" />
                        <asp:ListItem Value="flash" Text="Flash" />
                        <asp:ListItem Value="flash2" Text="Flash II" />
                        <asp:ListItem Value="negative" Text="Negative" />
                        <asp:ListItem Value="negative2" Text="Negative II" />
                    </asp:DropDownList>
                </div>
                <div class="globalFx dnnFormItem group">
                    <dnn:Label ID="lblAnimation" runat="server" />
                    <asp:DropDownList ID="ddAnimation" runat="server" CssClass="form-control selectpicker single-select">
                        <asp:ListItem Value="default" Text="Default" />
                        <asp:ListItem Value="random" Text="Random" />
                        <asp:ListItem Value="kenburns" Text="Kenburns" />
                        <asp:ListItem class="link-select-up" Value="kenburnsUp" Text="Kenburns" />
                        <asp:ListItem class="link-select-down" Value="kenburnsDown" Text="Kenburns" />
                        <asp:ListItem class="link-select-right" Value="kenburnsRight" Text="Kenburns" />
                        <asp:ListItem class="link-select-left" Value="kenburnsLeft" Text="Kenburns" />
                        <asp:ListItem class="link-select-up link-select-left" Value="kenburnsUpLeft" Text="Kenburns" />
                        <asp:ListItem class="link-select-up link-select-right" Value="kenburnsUpRight" Text="Kenburns" />
                        <asp:ListItem class="link-select-down link-select-left" Value="kenburnsDownLeft" Text="Kenburns" />
                        <asp:ListItem class="link-select-down link-select-right" Value="kenburnsDownRight" Text="Kenburns" />
                    </asp:DropDownList>
                </div>
            </div>
            <asp:Panel ID="pnlConfirmDelete" runat="server" Visible="false">
                <div class="popup-wrapper">
                    <asp:Label ID="lblConfirmIcon" runat="server" />
                    <h3>
                        <asp:Label ID="lblConfirmDelete" runat="server" CssClass="popup-msg"
                            ResourceKey="lblConfirmDelete" />
                    </h3>
                    <asp:LinkButton ID="btnYes" runat="server" CssClass="primary-action btn btn-danger link-delete"
                        OnClick="btnYes_Click" ResourceKey="btnYes"
                        data-toggle="tooltip" ToolTip="Delete Image" />
                    <asp:LinkButton ID="btnNo" runat="server" CssClass="close-action btn btn-default link-close no-txt"
                        OnClick="btnNo_Click" data-toggle="tooltip" ToolTip="Close" />
                </div>
            </asp:Panel>
            <asp:LinkButton ID="btnScrollTop" runat="server" CssClass="scroll-action btn btn-primary link-up no-txt" 
                ToolTip="Top"/>
        </fieldset>
    </div>
    <div class="dnnForm controls">
        <div class="dnnFormItem">
            <asp:LinkButton ID="btnAddImage" runat="server" CssClass="btn btn-primary link-add"
                OnClick="btnAddImage_Click" ResourceKey="btnAddImage" />
            <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-default link-cancel"
                OnClick="btnCancel_Click" ResourceKey="btnCancel" />
        </div>
    </div>
</div>

<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="19" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="20" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/main.min.js" Priority="21" />
