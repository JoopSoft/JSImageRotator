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
            <asp:HyperLink ID="lnkEdit" runat="server" Text="Edit Image Lists" CssClass="dnnSecondaryAction" />
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
