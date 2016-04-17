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
                <a href="http://www.joopsoft.com/" title="JoopSOFT.com" class="link-dev">JoopSOFT.com</a>
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
                    data-toggle="tooltip" ToolTip="View Image Lists" Visible="true" />

                <%--<asp:LinkButton ID="btnShowAddNewList" runat="server" CssClass="btn btn-primary link-exch no-txt" 
                    data-toggle="tooltip" ToolTip="Create New List" />--%>
            </div>
        </div>

        <fieldset>
            <div class="dnnFormItem">
                <dnn:Label ID="lblSlideType" runat="server" />
                <asp:DropDownList ID="ddSlideType" runat="server" CssClass="selectpicker show-tick single-select hidder" data-target=".videoAttr">
                    <asp:ListItem Value="image" Selected="True">Image</asp:ListItem>
                    <asp:ListItem Value="video">Video</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="dnnFormItem">
                <dnn:label ID="lblImage" runat="server" />
                <asp:FileUpload ID="btnImageSelect" runat="server" />
                <asp:LinkButton ID="btnImageUpload" runat="server" CssClass="dnnSecondaryAction link-upload"  
                    OnClick="btnImageUpload_Click" ResourceKey="btnUpload" />
            </div>
            <div class="videoAttr dnnFormItem">
                <dnn:label ID="lblVideo" runat="server" />
                <asp:FileUpload ID="btnVideoSelect" runat="server" />
                <asp:LinkButton ID="btnVideoUpload" runat="server" CssClass="dnnSecondaryAction link-upload"  
                    OnClick="btnImageUpload_Click" ResourceKey="btnUpload" />
            </div>
            <div class="videoAttr dnnFormItem">
                <dnn:label ID="lblLoop" runat="server" />
                <asp:CheckBox ID="cbLoop" runat="server" />
            </div>
            <div class="videoAttr dnnFormItem">
                <dnn:label ID="lblMute" runat="server" />
                <asp:CheckBox ID="cbMute" runat="server" 
                    Checked="true" />
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
                <asp:CheckBox ID="cbAddToList" runat="server" 
                    OnCheckedChanged="cbAddToList_CheckedChanged" AutoPostBack="true" />
                <asp:DropDownList ID="lstAvailableLists" runat="server" CssClass="selectpicker show-tick single-select cb-group" Visible="false" />
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
                        data-toggle="tooltip" ToolTip="Delete Image" />
                    <asp:LinkButton ID="btnNo" runat="server" CssClass="close-action btn btn-default link-close"
                        OnClick="btnNo_Click" 
                        data-toggle="tooltip" ToolTip="Close" />
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
            <div class="dnnFormItem">
                <dnn:label ID="lblGlobalFx" runat="server" />
                <asp:CheckBox ID="cbGlobalFx" runat="server" CssClass="unhidder" data-target=".globalFx"
                    Checked="true" />
            </div>
            <div class="globalFx dnnFormItem group">
                <dnn:Label ID="lblAnimation" runat="server" />
                <asp:ListBox ID="lbAnimation" runat="server" CssClass="selectpicker multi-select" SelectionMode="Multiple">
                    <asp:ListItem>Random</asp:ListItem>
                    <asp:ListItem>Kenburns</asp:ListItem>
                    <asp:ListItem>Kenburns Up</asp:ListItem>
                    <asp:ListItem>Kenburns Down</asp:ListItem>
                    <asp:ListItem>Kenburns Right</asp:ListItem>
                    <asp:ListItem>Kenburns Left</asp:ListItem>
                    <asp:ListItem>Kenburns Up Left</asp:ListItem>
                    <asp:ListItem>Kenburns Up Right</asp:ListItem>
                    <asp:ListItem>Kenburns Down Left</asp:ListItem>
                    <asp:ListItem>Kenburns Down Right</asp:ListItem>
                </asp:ListBox>
            </div>
            <div class="globalFx dnnFormItem group">
                <dnn:Label ID="lblTransition" runat="server" />
                <asp:ListBox ID="lbTransition" runat="server" CssClass="selectpicker multi-select" SelectionMode="Multiple">
                    <asp:ListItem>Random</asp:ListItem>
                    <asp:ListItem>Fade</asp:ListItem>
                    <asp:ListItem>Fade 2</asp:ListItem>
                    <asp:ListItem>Slide Left</asp:ListItem>
                    <asp:ListItem>Slide Left 2</asp:ListItem>
                    <asp:ListItem>Slide Right</asp:ListItem>
                    <asp:ListItem>Slide Right 2</asp:ListItem>
                    <asp:ListItem>Slide Up</asp:ListItem>
                    <asp:ListItem>Slide Up 2</asp:ListItem>
                    <asp:ListItem>Slide Down</asp:ListItem>
                    <asp:ListItem>Slide Down 2</asp:ListItem>
                    <asp:ListItem>Zoom In</asp:ListItem>
                    <asp:ListItem>Zoom In 2</asp:ListItem>
                    <asp:ListItem>Zoom Out</asp:ListItem>
                    <asp:ListItem>Zoom Out 2</asp:ListItem>
                    <asp:ListItem>Swirl Left</asp:ListItem>
                    <asp:ListItem>Swirl Left 2</asp:ListItem>
                    <asp:ListItem>Swirl Right</asp:ListItem>
                    <asp:ListItem>Swirl Right 2</asp:ListItem>
                    <asp:ListItem>Burn</asp:ListItem>
                    <asp:ListItem>Burn 2</asp:ListItem>
                    <asp:ListItem>Blur</asp:ListItem>
                    <asp:ListItem>Blur 2</asp:ListItem>
                    <asp:ListItem>Flash</asp:ListItem>
                    <asp:ListItem>Flash 2</asp:ListItem>
                    <asp:ListItem>Negative</asp:ListItem>
                    <asp:ListItem>Negative 2</asp:ListItem>
                </asp:ListBox>
            </div>


        </fieldset>
    </div>
    <div class="dnnForm controls">
        <div class="dnnFormItem">
            <asp:LinkButton ID="btnAddImage" runat="server" CssClass="btn btn-primary link-add" 
                OnClick="btnAddImage_Click" ResourceKey="btnAddImage" />            
            <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-default link-cancel"
                OnClick="btnCancel_Click" ResourceKey="btnCancel"  />
        </div>
    </div>
</div>

<script type="text/javascript">
    var $ddSlideType = '<%= ddSlideType.ClientID %>';

    $('#' + $ddSlideType)
        .each(function () {
            var $this = $(this),
                $target = $this.data('target');
        
            if ($this.val() !== 'image') $($target).removeClass('hidden');
            else $($target).addClass('hidden');
        })
        .bind('change', function () {
            var $this = $(this),
                $target = $(this).data('target');
        
            if ($this.val() !== 'image') $($target).removeClass('hidden');
            else $($target).addClass('hidden');
        });
    
</script>

<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="19" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="20" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/main.min.js" Priority="21" />
