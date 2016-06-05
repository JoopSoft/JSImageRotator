<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Select.ascx.cs" Inherits="JS.Modules.JSImageRotator.Select" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />

<div class="JSRotator">
    <div class="dnnForm select">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <asp:HyperLink ID="joopSoft" runat="server" />
            </h3>
            <div class="dnnFormItem JSRotatorMenu">
                <h3 class="dnnFormMessage four-controls dnnFormTitle no-spacing">
                    <asp:Label ID="lblTableTitle" runat="server" Text="Select Image List" />
                </h3>
                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add no-txt"
                    data-toggle="tooltip" ToolTip="Add New Image" />
                <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary link-edit-square no-txt"
                    data-toggle="tooltip" ToolTip="Edit Lists" />
                <asp:LinkButton ID="btnDeleteList" runat="server" CssClass="btn btn-danger link-delete no-txt" OnClick="btnDeleteList_Click"
                    data-toggle="tooltip" ToolTip="Delete Selected List" />
                <asp:HyperLink ID="lnkSettings" runat="server" CssClass="btn btn-primary link-settings no-txt"
                    ResourceKey="lnkSettings" ToolTip="Settings" />
            </div>
        </div>

        <fieldset>
            <div class="fieldset">
                <div class="dnnFormItem group">
                    <dnn:label ID="lblImageLists" runat="server" />
                    <asp:DropDownList ID="lstImageLists" runat="server" CssClass="selectpicker single-select" AutoPostBack="true"
                        OnSelectedIndexChanged="lstImageLists_SelectedIndexChanged" />
                </div>
            </div>
            <div class="dnnFormItem">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
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
                            <th>
                                <asp:Label runat="server" ResourceKey="thTransition" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thAnimation" />
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptImageList" runat="server">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Image runat="server" CssClass="row-img"
                                            ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" CssClass="ellipsis"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImageTitle").ToString() %>' />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" CssClass="ellipsis"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImageDescription").ToString() %>' />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" CssClass="ellipsis"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImagePhotographer").ToString() %>' />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" CssClass="ellipsis"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImageContact").ToString() %>' />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" CssClass="ellipsis"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"Transition").ToString() %>' />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" CssClass="ellipsis"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"Animation").ToString() %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <asp:Panel ID="pnlConfirmDelete" runat="server" Visible="false">
                <div class="popup-wrapper">
                    <asp:Label ID="lblConfirmIcon" runat="server" />
                    <h3>
                        <asp:Label ID="lblConfirmDelete" runat="server" CssClass="popup-msg" 
                            ResourceKey="lblConfirmDelete" />
                    </h3>
                    <asp:LinkButton ID="btnYes" runat="server" CssClass="primary-action btn btn-danger link-delete"
                        OnClick="btnYes_Click" resourcekey="btnYes"
                        data-toggle="tooltip" ToolTip="Delete Image" />
                    <asp:LinkButton ID="btnNo" runat="server" CssClass="close-action btn btn-default link-close no-txt"
                        OnClick="btnNo_Click" data-toggle="tooltip" ToolTip="Close" />
                </div>
            </asp:Panel>
            <asp:LinkButton ID="btnScrollTop" runat="server" CssClass="scroll-action btn btn-primary link-up no-txt"
                ToolTip="Top" />
        </fieldset>
    </div>
    <div class="dnnForm controls">
        <div class="dnnFormItem">
            <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn btn-primary link-save"
                OnClick="btnSubmit_Click" resourcekey="btnSubmit" />
            <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-default link-cancel"
                OnClick="btnCancel_Click" resourcekey="btnCancel" />
        </div>
    </div>
</div>

<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="19" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="20" />
<dnn:DnnJsInclude ID="ellipsisJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/jquery.ellipsis.min.js" Priority="21" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/main.min.js" Priority="22" />
