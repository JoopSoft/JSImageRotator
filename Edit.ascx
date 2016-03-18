<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="JS.Modules.JSImageRotator.Edit" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />

<div class="dnnForm edit">
    <div class="dnnFormSectionHead">
        <h3 class="dnnFormMessage dnnFormInfo">
            <%=LocalizeString("Title")%>
        </h3>
    </div>

    <fieldset>
        <div class="dnnFormItem">
            <asp:HyperLink ID="lnkAdd" runat="server" Text="[+] Add New Image" CssClass="dnnSecondaryAction" />
        </div>
        <div class="dnnFormItem">
            <asp:Label ID="lblTableTitle" runat="server" Text="Image List" />
        </div>
        <asp:Table runat="server" BorderStyle="None" Width="100%" GridLines="Both">
            <asp:TableRow>
                <asp:TableCell Width="3%">
                    <asp:CheckBox ID="cbSelectAll" runat="server" AutoPostBack="true" OnCheckedChanged="cbSelectAll_CheckedChanged" />
                </asp:TableCell>
                <asp:TableCell Width="5%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Image" />
                </asp:TableCell><asp:TableCell Width="10%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Title" />
                </asp:TableCell><asp:TableCell Width="33%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Description" />
                </asp:TableCell><asp:TableCell Width="14%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Photographer" />
                </asp:TableCell><asp:TableCell Width="14%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Contact" />
                </asp:TableCell><asp:TableCell Width="21%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Modify Items" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Repeater ID="rptImageList" runat="server" OnItemDataBound="rptImages_ItemDataBound" OnItemCommand="rptImages_ItemCommand">
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Table runat="server" BorderStyle="None" HorizontalAlign="Left" Width="100%" GridLines="Both">
                    <asp:TableRow>
                        <asp:TableCell Width="3%">
                            <asp:Label ID="imgId" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem, "ImageId").ToString() %>' />
                            <asp:CheckBox ID="cbSelect" runat="server" AutoPostBack="true" Checked='<%#((DataBinder.Eval(Container.DataItem,"IsSelected")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"IsSelected")==true)) %>' OnCheckedChanged="cbSelect_CheckedChanged" />
                        </asp:TableCell><asp:TableCell Width="5%">
                            <asp:Image runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' Width="30" Height="30" />
                        </asp:TableCell><asp:TableCell Width="10%">
                            <asp:TextBox ID="txtTitle" runat="server" Enabled="false" Text='<%#DataBinder.Eval(Container.DataItem,"ImageTitle").ToString() %>' />
                        </asp:TableCell><asp:TableCell Width="33%">
                            <asp:TextBox ID="txtDescription" runat="server" Enabled="false" Text='<%#DataBinder.Eval(Container.DataItem,"ImageDescription").ToString() %>' />
                        </asp:TableCell><asp:TableCell Width="14%">
                            <asp:TextBox ID="txtPhotographer" runat="server" Enabled="false" Text='<%#DataBinder.Eval(Container.DataItem,"ImagePhotographer").ToString() %>' />
                        </asp:TableCell><asp:TableCell Width="14%">
                            <asp:TextBox ID="txtContact" runat="server" Enabled="false" Text='<%#DataBinder.Eval(Container.DataItem,"ImageContact").ToString() %>' />
                        </asp:TableCell><asp:TableCell Width="21%" HorizontalAlign="Justify">
                            <asp:LinkButton ID="btnEdit" runat="server" CssClass="dnnSecondaryAction" Text="Edit" OnClick="btnEdit_Click" />
                            <asp:LinkButton ID="lnkDelete" runat="server" CssClass="dnnSecondaryAction" ResourceKey="DeleteItem.Text" CommandName="Delete" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>
    </fieldset>
</div>
<div class="dnnFormItem">
    <dnn:label ID="lblSelectList" runat="server" Visible="false" />
    <asp:DropDownList ID="lstSelectList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lstSelectList_SelectedIndexChanged" Visible="false" />
    <asp:LinkButton ID="btnDeleteList" runat="server" OnClick="btnDeleteList_Click" resourcekey="btnDeleteList" CssClass="dnnSecondaryAction" Visible="false" />
    <asp:LinkButton ID="btnShowAddNewList" runat="server" OnClick="btnShowAddNewList_Click" resourcekey="btnShowAddList" CssClass="dnnSecondaryAction" Visible="false" />
    <dnn:label ID="lblFileName" runat="server" />
    <asp:TextBox ID="txtFileName" runat="server" />
    <asp:LinkButton ID="btnShowSelectList" runat="server" OnClick="btnShowSelectList_Click" resourcekey="btnShowSelectList" CssClass="dnnSecondaryAction" Visible="false" />
</div>
<div class="dnnFormItem">
    <asp:Label ID="lblConfirmDelete" runat="server" Text="Are you sure you want to Delete this List!" Visible="false" />
    <asp:LinkButton ID="btnYes" runat="server"
        OnClick="btnYes_Click" resourcekey="btnYes" CssClass="dnnSecondaryAction" Visible="false" />
    <asp:LinkButton ID="btnNo" runat="server"
        OnClick="btnNo_Click" resourcekey="btnNo" CssClass="dnnSecondaryAction" Visible="false" />
</div>
<div class="dnnFormItem">
    <asp:LinkButton ID="btnGenerate" runat="server" OnClick="btnGenerate_Click" resourcekey="btnGenerate" CssClass="dnnSecondaryAction" Text="Add List" />
    <asp:HyperLink ID="lnkSelect" runat="server" Text="Select Image List" CssClass="dnnSecondaryAction" />
    <asp:Label ID="lblListAdded" runat="server" />
</div>
<div class="dnnFormItem">
    <asp:LinkButton ID="btnSubmit" runat="server"
        OnClick="btnSubmit_Click" resourcekey="btnSubmit" CssClass="dnnPrimaryAction" />
    <asp:LinkButton ID="btnCancel" runat="server"
        OnClick="btnCancel_Click" resourcekey="btnCancel" CssClass="dnnSecondaryAction" />
</div>

<script type="text/javascript" src="<%= ModulePath %>Js/main.js"></script>
