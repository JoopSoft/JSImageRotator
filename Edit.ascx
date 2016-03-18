<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="JS.Modules.JSImageRotator.Edit" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />

<div class="dnnForm edit">
    <div class="dnnFormSectionHead">
        <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon">
            <%=LocalizeString("Title")%>
        </h3>
    </div>

    <fieldset>
        <div class="dnnFormItem">
            <asp:HyperLink ID="lnkAdd" runat="server" ResourceKey="lnkAdd" CssClass="btn btn-primary link-add" />
        </div>
        <div class="dnnFormItem">
            <h3>
                <asp:Label ID="lblTableTitle" runat="server" ResourceKey="lblTableTitle" />
            </h3>
        </div>

        <div class="dnnFormItem">
            <table class="table-list table table-hover table-striped">
                <thead>
                    <tr>
                        <th>
                            <asp:CheckBox ID="cbSelectAll" runat="server" AutoPostBack="true" OnCheckedChanged="cbSelectAll_CheckedChanged" />
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
                        <th>
                            <asp:Label runat="server" ResourceKey="thModify" />
                        </th>
                    </tr>   
                </thead>
                <tbody>
                    <asp:Repeater ID="rptImageList" runat="server" OnItemDataBound="rptImages_ItemDataBound" OnItemCommand="rptImages_ItemCommand">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <th scope="row">
                                    <asp:Label ID="imgId" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem, "ImageId").ToString() %>' />
                                    <asp:CheckBox ID="cbSelect" runat="server" AutoPostBack="true" Checked='<%#((DataBinder.Eval(Container.DataItem,"IsSelected")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"IsSelected")==true)) %>' OnCheckedChanged="cbSelect_CheckedChanged" />
                                </th>
                                <td>
                                    <asp:Image runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' Width="30" Height="30" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTitle" runat="server" Enabled="false" Text='<%#DataBinder.Eval(Container.DataItem,"ImageTitle").ToString() %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDescription" runat="server" Enabled="false" Text='<%#DataBinder.Eval(Container.DataItem,"ImageDescription").ToString() %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPhotographer" runat="server" Enabled="false" Text='<%#DataBinder.Eval(Container.DataItem,"ImagePhotographer").ToString() %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtContact" runat="server" Enabled="false" Text='<%#DataBinder.Eval(Container.DataItem,"ImageContact").ToString() %>' />
                                </td>
                                <td>
                                    <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-primary link-edit" Text="Edit" Title="Edit" OnClick="btnEdit_Click" />
                                    <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-primary link-cancel" ResourceKey="CancelItem" />
                                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger link-delete" ResourceKey="DeleteItem" CommandName="Delete" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                </tbody>
                <tfoot>
                    <tr>
                        <td>footer table</td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </fieldset>

    <div class="dnnFormItem">
        <dnn:label ID="lblSelectList" runat="server" Visible="false" />
        <asp:DropDownList ID="lstSelectList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lstSelectList_SelectedIndexChanged" Visible="false" />
        <asp:LinkButton ID="btnDeleteList" runat="server" OnClick="btnDeleteList_Click" ResourceKey="btnDeleteList" CssClass="btn btn-default link-cancel" Visible="false" />
        <asp:LinkButton ID="btnShowAddNewList" runat="server" OnClick="btnShowAddNewList_Click" ResourceKey="btnShowAddList" CssClass="btn btn-default link-cancel" Visible="false" />
        <dnn:label ID="lblFileName" runat="server" />
        <asp:TextBox ID="txtFileName" runat="server" />
        <asp:LinkButton ID="btnShowSelectList" runat="server" OnClick="btnShowSelectList_Click" ResourceKey="btnShowSelectList" CssClass="btn btn-default link-cancel" Visible="false" />
    </div>
    <div class="dnnFormItem">
        <asp:Label ID="lblConfirmDelete" runat="server" ResourceKey="lblConfirmDelete" Visible="false" />
        <asp:LinkButton ID="btnYes" runat="server"
            OnClick="btnYes_Click" ResourceKey="btnYes" CssClass="btn btn-default link-cancel" Visible="false" />
        <asp:LinkButton ID="btnNo" runat="server"
            OnClick="btnNo_Click" ResourceKey="btnNo" CssClass="btn btn-default link-cancel" Visible="false" />
    </div>
    <div class="dnnFormItem">
        <asp:LinkButton ID="btnGenerate" runat="server" OnClick="btnGenerate_Click" ResourceKey="btnGenerate" CssClass="btn btn-default link-cancel" />
        <asp:HyperLink ID="lnkSelect" runat="server" ResourceKey="lnkSelect" CssClass="btn btn-default link-cancel" />
        <asp:Label ID="lblListAdded" runat="server" />
    </div>
    <div class="dnnFormItem">
        <asp:LinkButton ID="btnSubmit" runat="server"
            OnClick="btnSubmit_Click" ResourceKey="btnSubmit" CssClass="btn btn-primary link-save" />
        <asp:LinkButton ID="btnCancel" runat="server"
            OnClick="btnCancel_Click" ResourceKey="btnCancel" CssClass="btn btn-default link-cancel" />
    </div>

</div>

<script type="text/javascript" src="<%= ModulePath %>Js/main.js"></script>
