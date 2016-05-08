<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddImage.ascx.cs" Inherits="JS.Modules.JSImageRotator.AddImage" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />

<div class="JSRotator">
    <div class="dnnForm add-img">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <asp:HyperLink ID="joopSoft" runat="server" />
            </h3>
        </div>
        <div class="dnnFormSectionHead">
            <div class="dnnFormItem JSRotatorMenu">
                <asp:Panel ID="headerMenu" runat="server" CssClass="dnnFormMessage two-controls dnnFormTitle no-spacing">
                    <asp:Label ID="lblAddedImage" runat="server" Text="Adding New Image" />
                </asp:Panel>
                <%--<asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add no-txt"
                    data-toggle="tooltip" ToolTip="Add New Image" />--%>

                <asp:HyperLink ID="btnEdit" runat="server" CssClass="btn btn-primary link-edit-square no-txt"
                    data-toggle="tooltip" ToolTip="Edit Lists" Visible="true" />

                <asp:HyperLink ID="btnLists" runat="server" CssClass="btn btn-primary link-list no-txt"
                    data-toggle="tooltip" ToolTip="Select Image Lists" Visible="true" />

                <%--<asp:LinkButton ID="btnShowAddNewList" runat="server" CssClass="btn btn-primary link-exch no-txt" 
                    data-toggle="tooltip" ToolTip="Create New List" />--%>
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
                    <asp:CheckBox ID="cbAddToList" runat="server" CssClass="hidder" 
                        data-target=".availableLists" />
                    <asp:DropDownList ID="ddAvailableLists" runat="server" CssClass="availableLists selectpicker show-tick single-select cb-group" 
                          />
                    <%--Visible="false" />--%>
                </asp:Panel>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblTitle" runat="server" />
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblDescription" runat="server" />
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control teaser-txt" TextMode="MultiLine" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblPhotographer" runat="server" />
                    <asp:TextBox ID="txtPhotographer" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblContact" runat="server" />
                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" />
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
                    <asp:DropDownList ID="ddTransition" runat="server" CssClass="selectpicker show-tick single-select">
                        <asp:ListItem Value="random">Random</asp:ListItem>
                        <asp:ListItem Value="fade">Fade</asp:ListItem>
                        <asp:ListItem Value="fade2">Fade 2</asp:ListItem>
                        <asp:ListItem Value="slideLeft">Slide Left</asp:ListItem>
                        <asp:ListItem Value="slideLeft2">Slide Left 2</asp:ListItem>
                        <asp:ListItem Value="slideRight">Slide Right</asp:ListItem>
                        <asp:ListItem Value="slideRight2">Slide Right 2</asp:ListItem>
                        <asp:ListItem Value="slideUp">Slide Up</asp:ListItem>
                        <asp:ListItem Value="slideUp2">Slide Up 2</asp:ListItem>
                        <asp:ListItem Value="slideDown">Slide Down</asp:ListItem>
                        <asp:ListItem Value="slideDown2">Slide Down 2</asp:ListItem>
                        <asp:ListItem Value="zoomIn">Zoom In</asp:ListItem>
                        <asp:ListItem Value="zoomIn2">Zoom In 2</asp:ListItem>
                        <asp:ListItem Value="zoomOut">Zoom Out</asp:ListItem>
                        <asp:ListItem Value="zoomOut2">Zoom Out 2</asp:ListItem>
                        <asp:ListItem Value="swirlLeft">Swirl Left</asp:ListItem>
                        <asp:ListItem Value="swirlLeft2">Swirl Left 2</asp:ListItem>
                        <asp:ListItem Value="swirlRight">Swirl Right</asp:ListItem>
                        <asp:ListItem Value="swirlRight2">Swirl Right 2</asp:ListItem>
                        <asp:ListItem Value="burn">Burn</asp:ListItem>
                        <asp:ListItem Value="burn2">Burn 2</asp:ListItem>
                        <asp:ListItem Value="blur">Blur</asp:ListItem>
                        <asp:ListItem Value="blur2">Blur 2</asp:ListItem>
                        <asp:ListItem Value="flash">Flash</asp:ListItem>
                        <asp:ListItem Value="flash2">Flash 2</asp:ListItem>
                        <asp:ListItem Value="negative">Negative</asp:ListItem>
                        <asp:ListItem Value="negative2">Negative 2</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="globalFx dnnFormItem group">
                    <dnn:Label ID="lblAnimation" runat="server" />
                    <asp:DropDownList ID="ddAnimation" runat="server" CssClass="selectpicker show-tick single-select">
                        <asp:ListItem Value="random">Random</asp:ListItem>
                        <asp:ListItem Value="kenburns">Kenburns</asp:ListItem>
                        <asp:ListItem Value="kenburnsUp">Kenburns Up</asp:ListItem>
                        <asp:ListItem Value="kenburnsDown">Kenburns Down</asp:ListItem>
                        <asp:ListItem Value="kenburnsRight">Kenburns Right</asp:ListItem>
                        <asp:ListItem Value="kenburnsLeft">Kenburns Left</asp:ListItem>
                        <asp:ListItem Value="kenburnsUpLeft">Kenburns Up Left</asp:ListItem>
                        <asp:ListItem Value="kenburnsUpRight">Kenburns Up Right</asp:ListItem>
                        <asp:ListItem Value="kenburnsDownLeft">Kenburns Down Left</asp:ListItem>
                        <asp:ListItem Value="kenburnsDownRight">Kenburns Down Right</asp:ListItem>
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

<%--<script type="text/javascript">

    $('.JSRotator #<%= ddSlideType.ClientID %>')
        .each(function () {
            var $this = $(this),
                $target = $this.data('target');
        
            if ($this.val() !== 'image') $($target).show();
            else $($target).hide();
        })
        .bind('change', function () {
            var $this = $(this),
                $target = $this.data('target');
        
            if ($this.val() !== 'image') $($target).show();
            else $($target).hide();
        });
    
</script>--%>

<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="19" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="20" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/main.min.js" Priority="21" />
