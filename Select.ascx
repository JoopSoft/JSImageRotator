<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Select.ascx.cs" Inherits="JS.Modules.JSImageRotator.Select" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />

<div class="dnnForm select">
    <div class="dnnFormSectionHead">
        <h3 class="dnnFormMessage dnnFormInfo">
            <%=LocalizeString("Title")%>
        </h3>
    </div>

    <fieldset>
        <div class="dnnFormItem">
            <asp:HyperLink ID="lnkAdd" runat="server" Text="[+] Add New Image" CssClass="dnnSecondaryAction" />
            <asp:HyperLink ID="lnkEdit" runat="server" Text="Edit Image Lists" CssClass="dnnSecondaryAction" />
            <asp:DropDownList ID="lstImageLists" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lstImageLists_SelectedIndexChanged"/>
        </div>
        <div class="dnnFormItem">
            <asp:Label ID="lblTableTitle" runat="server" Text="Image List"/>
        </div>
        <asp:Table runat="server" BorderStyle="None" Width="100%" GridLines="Both">
            <asp:TableRow>
                <asp:TableCell Width="10%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Image" />
                </asp:TableCell>
                <asp:TableCell Width="10%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Title" />
                </asp:TableCell>
                <asp:TableCell Width="40%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Description" />
                </asp:TableCell>
                <asp:TableCell Width="20%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Photographer" />
                </asp:TableCell>
                <asp:TableCell Width="20%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Contact" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <asp:Repeater ID="rptImageList" runat="server" OnItemDataBound="rptImages_ItemDataBound" OnItemCommand="rptImages_ItemCommand">
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Table runat="server" BorderStyle="None" HorizontalAlign="Left" Width="100%" GridLines="Both">
                    <asp:TableRow>
                        <asp:TableCell Width="10%">
                            <asp:Image runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' Width="70" Height="70" />
                        </asp:TableCell>
                        <asp:TableCell Width="10%">
                            <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ImageTitle").ToString() %>' />
                        </asp:TableCell>
                        <asp:TableCell Width="40%">
                            <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ImageDescription").ToString() %>' />
                        </asp:TableCell>
                        <asp:TableCell Width="20%">
                            <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ImagePhotographer").ToString() %>' />
                        </asp:TableCell>
                        <asp:TableCell Width="20%">
                            <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ImageContact").ToString() %>' />
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
    <asp:LinkButton ID="btnSubmit" runat="server"
        OnClick="btnSubmit_Click" resourcekey="btnSubmit" CssClass="dnnPrimaryAction" />
    <asp:LinkButton ID="btnCancel" runat="server"
        OnClick="btnCancel_Click" resourcekey="btnCancel" CssClass="dnnSecondaryAction" />
    <asp:LinkButton ID="btnDeleteList" runat="server"
        OnClick="btnDeleteList_Click" resourcekey="btnDeleteList" CssClass="dnnSecondaryAction" />
    <asp:Label ID="lblConfirmDelete" runat="server" Text="Are you sure you want to Delete this List!" Visible="false" />
    <asp:LinkButton ID="btnYes" runat="server"
        OnClick="btnYes_Click" resourcekey="btnYes" CssClass="dnnSecondaryAction" Visible="false" />
    <asp:LinkButton ID="btnNo" runat="server"
        OnClick="btnNo_Click" resourcekey="btnNo" CssClass="dnnSecondaryAction" Visible="false" />
</div>

<script type="text/javascript" src="<%= ModulePath %>Js/main.js"></script>

