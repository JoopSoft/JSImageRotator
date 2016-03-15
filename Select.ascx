<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Select.ascx.cs" Inherits="JS.Modules.JSImageRotator.Select" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>
<div class="dnnForm dnnEditBasicSettings" id="dnnEditBasicSettings">
    <div class="dnnFormExpandContent dnnRight "><a href=""><%=LocalizeString("ExpandAll")%></a></div>

    <h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead dnnClear">
        <a href="" class="dnnSectionExpanded">
            <%=LocalizeString("BasicSettings")%>
        </a>
    </h2>
    <fieldset>
        <div class="dnnFormItem">
            <asp:HyperLink ID="lnkAdd" runat="server" Text="[+] Add New Image" CssClass="dnnSecondaryAction" />
            <asp:HyperLink ID="lnkGenerate" runat="server" Text="Generate New" CssClass="dnnSecondaryAction" />
        </div>
        <div class="dnnFormItem">
            <asp:Label ID="lblTableTitle" runat="server" Text="Image List"/>
        </div>
        <asp:Table runat="server" BorderStyle="None" Width="100%" GridLines="Both">
            <asp:TableRow>
                <asp:TableCell Width="3%">
                    <asp:CheckBox ID="cbSelectAll" runat="server" AutoPostBack="true" OnCheckedChanged="cbSelectAll_CheckedChanged" />
                </asp:TableCell>
                <asp:TableCell Width="5%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Image" />
                </asp:TableCell>
                <asp:TableCell Width="10%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Title" />
                </asp:TableCell>
                <asp:TableCell Width="33%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Description" />
                </asp:TableCell>
                <asp:TableCell Width="14%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Photographer" />
                </asp:TableCell>
                <asp:TableCell Width="14%" HorizontalAlign="Center">
                     <asp:Label runat="server" Text="Contact" />
                </asp:TableCell>
                <asp:TableCell Width="21%" HorizontalAlign="Center">
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
                            <asp:CheckBox ID="cbSelect" runat="server" AutoPostBack="true" Checked='<%#((DataBinder.Eval(Container.DataItem,"IsSelected")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"IsSelected")==true)) %>' OnCheckedChanged="cbSelect_CheckedChanged" />
                        </asp:TableCell>
                        <asp:TableCell Width="5%">
                            <asp:Image runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' Width="30" Height="30" />
                        </asp:TableCell>
                        <asp:TableCell Width="10%">
                            <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ImageTitle").ToString() %>' />
                        </asp:TableCell>
                        <asp:TableCell Width="33%">
                            <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ImageDescription").ToString() %>' />
                        </asp:TableCell>
                        <asp:TableCell Width="14%">
                            <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ImagePhotographer").ToString() %>' />
                        </asp:TableCell>
                        <asp:TableCell Width="14%">
                            <asp:Label runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ImageContact").ToString() %>' />
                        </asp:TableCell>
                        <asp:TableCell Width="21%" HorizontalAlign="Justify">
                            <asp:HyperLink ID="lnkEdit" runat="server" CssClass="dnnSecondaryAction" ResourceKey="EditItem.Text" />
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
<div>
    <asp:Label ID="lblOverwriteError" runat="server" ForeColor="Red" />
</div>
<div class="dnnFormItem">
    <dnn:label ID="lblFileName" runat="server" />
    <asp:TextBox ID="txtFileName" runat="server" />
</div>
<div class="dnnFormItem">
    <dnn:label ID="lblOverwrite" runat="server" />
    <asp:CheckBox ID="cbOverwrite" runat="server" />
</div>
<div class="dnnFormItem">
<asp:LinkButton ID="btnSubmit" runat="server"
    OnClick="btnSubmit_Click" resourcekey="btnSubmit" CssClass="dnnPrimaryAction" />
<asp:LinkButton ID="btnCancel" runat="server"
    OnClick="btnCancel_Click" resourcekey="btnCancel" CssClass="dnnSecondaryAction" />
</div>
<script type="text/javascript">
    /*globals jQuery, window, Sys */
    (function ($, Sys) {
        function dnnEditBasicSettings() {
            $('#dnnEditBasicSettings').dnnPanels();
            $('#dnnEditBasicSettings .dnnFormExpandContent a').dnnExpandAll({ expandText: '<%=Localization.GetString("ExpandAll", LocalResourceFile)%>', collapseText: '<%=Localization.GetString("CollapseAll", LocalResourceFile)%>', targetArea: '#dnnEditBasicSettings' });
        }

        $(document).ready(function () {
            dnnEditBasicSettings();
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                dnnEditBasicSettings();
            });
        });

    }(jQuery, window.Sys));
</script>
