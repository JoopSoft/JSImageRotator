<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Select.ascx.cs" Inherits="JS.Modules.JSImageRotator.Select" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

<div class="JSRotator">
    <div class="dnnForm select">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <a href="http://www.joopsoft.com/" title="JoopSOFT.com" class="link-dev">JoopSOFT.com</a>
            </h3>
        </div>
        <div class="dnnFormSectionHead">
            <div class="dnnFormItem JSRotatorMenu">
                <h3 class="dnnFormMessage three-controls dnnFormTitle no-spacing">
                    <asp:Label ID="lblTableTitle" runat="server" Text="Image List" />
                </h3>
                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add no-txt"
                    data-toggle="tooltip" ToolTip="Add New Image" />
                <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary link-edit-square no-txt"
                    data-toggle="tooltip" ToolTip="Edit Lists" />                
                <asp:LinkButton ID="btnDeleteList" runat="server" CssClass="btn btn-danger link-delete no-txt" OnClick="btnDeleteList_Click" 
                    data-toggle="tooltip" ToolTip="Delete Selected List" />
            </div>
        </div>

        <fieldset>
            <div class="dnnFormItem group">
                <dnn:label ID="lblImageLists" runat="server" />
                <asp:DropDownList ID="lstImageLists" runat="server" CssClass="selectpicker show-tick single-select" AutoPostBack="true" 
                    OnSelectedIndexChanged="lstImageLists_SelectedIndexChanged" />
            </div>

            <asp:Panel ID="pnlConfirmDelete" runat="server" CssClass="dnnFormItem" Visible="false">
                <div class="popup-wrapper">
                    <h3>
                        <asp:Label ID="lblConfirmDelete" runat="server" CssClass="popup-msg" ResourceKey="lblConfirmDelete" Visible="false" />
                    </h3>
                    <asp:LinkButton ID="btnYes" runat="server" CssClass="btn btn-danger link-delete" 
                        OnClick="btnYes_Click" resourcekey="btnYes" />
                    <asp:LinkButton ID="btnNo" runat="server" CssClass="btn btn-default link-cancel"
                        OnClick="btnNo_Click" resourcekey="btnNo" />
                </div>
            </asp:Panel>

            <div class="dnnFormItem">
                <table id="table-list" class="table table-striped table-hover">
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
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptImageList" runat="server" 
                            OnItemDataBound="rptImages_ItemDataBound" OnItemCommand="rptImages_ItemCommand">
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
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </tbody>
                    <%--<tfoot>
                    <tr>
                        <th></th>
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
                            <asp:Label runat="server" ResourceKey="thModify" />
                        </th>
                    </tr>   
                </tfoot>--%>
                </table>
            </div>
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

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="<%= ModulePath %>Ellipsis/jquery.ellipsis.min.js"></script>
<script type="text/javascript" src="<%= ModulePath %>Js/main.js"></script>
