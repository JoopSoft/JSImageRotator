<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="JS.Modules.JSImageRotator.Edit" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />
<dnn:DnnCssInclude ID="moduleCss" runat="server" FilePath="~/DesktopModules/JSImageRotator/module.min.css" />

<div class="JSRotator">
    <div class="dnnForm edit">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <asp:HyperLink ID="joopSoft" runat="server" />
            </h3>
            <div class="dnnFormItem JSRotatorMenu">
                <asp:Panel ID="headerMenu" runat="server" CssClass="dnnFormMessage three-controls dnnFormTitle no-spacing">
                    <asp:Label ID="lblJsonTitle" runat="server" Text="Create Image Lists" />
                </asp:Panel>
                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add no-txt"
                    data-toggle="tooltip" ToolTip="Add New Image" />
                <asp:HyperLink ID="lnkLists" runat="server" CssClass="btn btn-primary link-list no-txt"
                    data-toggle="tooltip" ToolTip="Select Image Lists" />
                <asp:LinkButton ID="btnShowAddNewList" runat="server" CssClass="btn btn-primary link-exch no-txt"
                    data-toggle="tooltip" ToolTip="Edit Available Lists"
                    OnClick="btnShowAddNewList_Click" />
                <asp:HyperLink ID="lnkSettings" runat="server" CssClass="btn btn-primary link-settings no-txt"
                    ResourceKey="lnkSettings" ToolTip="Settings" />
            </div>
        </div>
        <fieldset>
            <div class="fieldset">
                <div class="dnnFormItem group">
                    <dnn:label ID="lblFileName" runat="server" />
                    <asp:TextBox ID="txtFileName" runat="server" CssClass="txtFileName form-control grouped"
                        Placeholder="Enter List Name" />

                    <dnn:label ID="lblSelectList" runat="server" Visible="false" />
                    <asp:DropDownList ID="lstSelectList" runat="server" CssClass="selectpicker single-select" AutoPostBack="True"
                        OnSelectedIndexChanged="lstSelectList_SelectedIndexChanged" Visible="false" />

                    <asp:LinkButton ID="btnAddUpdateList" runat="server" CssClass="btnAddUpdateList btn btn-primary link-add"
                        Text="Create" data-toggle="tooltip" ToolTip="Create New List"
                        OnClick="btnAddUpdateList_Click" />

                    <asp:LinkButton ID="btnDeleteList" runat="server" CssClass="btn btn-danger link-delete no-txt"
                        data-toggle="tooltip" ToolTip="Delete Selected List"
                        OnClick="btnDeleteList_Click" Visible="false" />

                </div>
            </div>
            <div class="dnnFormItem">
                <h3>
                    <asp:Label ID="lblTableTitle" runat="server" ResourceKey="lblTableTitle" />
                </h3>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <asp:CheckBox ID="cbSelectAll" runat="server" CssClass="cbSelectAll" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thImage" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thTitle" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thDesc" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thPhotographer" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thContact" />
                            </th>
                            <th class="custom-fx">
                                <asp:Label runat="server" ResourceKey="thTransition" />
                            </th>
                            <th class="custom-fx">
                                <asp:Label runat="server" ResourceKey="thAnimation" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thModify" />
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptImageList" runat="server">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:TableRow ID="tableRow" runat="server">
                                    <asp:TableCell>
                                        <asp:Label ID="imgId" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem, "ImageId").ToString() %>' />
                                        <asp:CheckBox ID="cbSelect" runat="server" CssClass="cbSelect"
                                            Checked='<%#((DataBinder.Eval(Container.DataItem,"IsSelected")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"IsSelected")==true)) %>' />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Image ID="imgPreview" runat="server" CssClass="row-img"
                                            ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtTitle" runat="server" CssClass="ellipsis"
                                            Enabled="false" data-toggle="tooltip" ToolTip="Edit Title"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImageTitle").ToString() %>'
                                            Placeholder="Enter Title" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="ellipsis"
                                            Enabled="false" data-toggle="tooltip" ToolTip="Edit Description"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImageDescription").ToString() %>'
                                            Placeholder="Enter Description" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtPhotographer" runat="server" CssClass="ellipsis"
                                            Enabled="false" data-toggle="tooltip" ToolTip="Edit Photographer"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImagePhotographer").ToString() %>'
                                            Placeholder="Enter Photographer Name" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtContact" runat="server" CssClass="ellipsis"
                                            Enabled="false" data-toggle="tooltip" ToolTip="Edit E-mail"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImageContact").ToString() %>'
                                            Placeholder="Enter E-mail Address" />
                                    </asp:TableCell>
                                    <asp:TableCell CssClass="custom-fx">
                                        <asp:DropDownList ID="ddTransition" runat="server" CssClass="selectpicker table-select"
                                            Enabled="false" SelectedValue='<%#DataBinder.Eval(Container.DataItem, "Transition").ToString() %>'>
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
                                    </asp:TableCell>
                                    <asp:TableCell CssClass="custom-fx">
                                        <asp:DropDownList ID="ddAnimation" runat="server" CssClass="selectpicker table-select"
                                            Enabled="false" SelectedValue='<%#DataBinder.Eval(Container.DataItem, "Animation").ToString() %>'>
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
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-primary link-edit no-txt"
                                            OnClick="btnEdit_Click" data-toggle="tooltip" ToolTip="Edit" />
                                        <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger link-delete no-txt"
                                            OnClick="lnkDelete_Click" data-toggle="tooltip" ToolTip="Delete"
                                            CommandName="Delete" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
            <asp:Panel ID="pnlPopUp" runat="server" Visible="false">
                <div class="popup-wrapper">
                    <asp:Label ID="lblPopUpIcon" runat="server" />
                    <h3>
                        <asp:Label ID="lblListAdded" runat="server" CssClass="popup-msg" />
                    </h3>
                    <asp:LinkButton ID="btnClose" runat="server" CssClass="close-action btn btn-default link-close no-txt"
                        OnClick="btnClose_Click" data-toggle="tooltip" ToolTip="Close" />
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlConfirmDelete" runat="server" Visible="false">
                <div class="popup-wrapper">
                    <asp:Label ID="lblConfirmIcon" runat="server" />
                    <h3>
                        <asp:Label ID="lblConfirmDelete" runat="server" CssClass="popup-msg" />
                        <asp:Label ID="lblDeleteImageID" runat="server" Visible="false" />
                        <asp:Label ID="lblDeleteImageUrl" runat="server" Visible="false" />
                    </h3>
                    <asp:LinkButton ID="btnYes" runat="server" CssClass="btn btn-danger link-delete"
                        OnClick="btnYes_Click" ResourceKey="btnYes"
                        data-toggle="tooltip" ToolTip="Delete List" />
                    <asp:LinkButton ID="btnNo" runat="server" CssClass="close-action btn btn-default link-close no-txt"
                        OnClick="btnNo_Click" data-toggle="tooltip" ToolTip="Close" />
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlOverlay" runat="server" Visible="false">
                <div class="popup-wrapper">
                    <asp:Label ID="lblOverlayIcon" runat="server" />
                    <h3>
                        <asp:Label ID="lblOverlayMsg" runat="server" CssClass="popup-msg" />
                    </h3>
                </div>
            </asp:Panel>

            <asp:LinkButton ID="btnScrollTop" runat="server" CssClass="scroll-action btn btn-primary link-up no-txt"
                ToolTip="Top" />
        </fieldset>
    </div>
    <div class="dnnForm controls">
        <div class="dnnFormItem">
            <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btnSubmit btn btn-primary link-save"
                OnClick="btnSubmit_Click" Text="Create And Apply" ToolTip="Create And Apply" />
            <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-default link-cancel"
                OnClick="btnCancel_Click" ResourceKey="btnCancel" />
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {

        //ENABLE/DISABLE CREATE LIST BUTTONS
        $('.JSRotator #<%= txtFileName.ClientID %>')
            .each(function () {
                var $n = parseInt($('.JSRotator table tbody .cbSelect input:checked').length);

                if ($n != 0) {
                    if ($(this).val() === '') {
                        $('.JSRotator #<%= btnSubmit.ClientID %>').addClass('disabled');
                    $('.JSRotator #<%= btnAddUpdateList.ClientID %>').addClass('disabled');
                } else {
                    $('.JSRotator #<%= btnSubmit.ClientID %>').removeClass('disabled');
                    $('.JSRotator #<%= btnAddUpdateList.ClientID %>').removeClass('disabled');
                }
            } else {
                $('.JSRotator #<%= btnSubmit.ClientID %>').addClass('disabled');
                $('.JSRotator #<%= btnAddUpdateList.ClientID %>').addClass('disabled');
            }
        })
        .bind('keyup', function () {
            var $n = parseInt($('.JSRotator table tbody .cbSelect input:checked').length);

            if ($n != 0) {
                if ($(this).val() === '') {
                    $('.JSRotator #<%= btnSubmit.ClientID %>').addClass('disabled');
                    $('.JSRotator #<%= btnAddUpdateList.ClientID %>').addClass('disabled');
                } else {
                    $('.JSRotator #<%= btnSubmit.ClientID %>').removeClass('disabled');
                    $('.JSRotator #<%= btnAddUpdateList.ClientID %>').removeClass('disabled');
                }
            } else {
                $('.JSRotator #<%= btnSubmit.ClientID %>').addClass('disabled');
                $('.JSRotator #<%= btnAddUpdateList.ClientID %>').addClass('disabled');
            }
        });

    });
</script>

<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="19" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="20" />
<dnn:DnnJsInclude ID="ellipsisJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/jquery.ellipsis.min.js" Priority="21" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/main.min.js" Priority="22" />
