﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="JS.Modules.JSImageRotator.Edit" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />

<div class="JSRotator">
    <div class="dnnForm edit">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <a href="http://www.joopsoft.com/" title="JoopSOFT.com" class="link-dev">JoopSOFT.com</a>
            </h3>
        </div>
        <div class="dnnFormSectionHead">
            <div class="dnnFormItem JSRotatorMenu">
                <asp:Panel ID="headerMenu" runat="server" CssClass="dnnFormMessage three-controls dnnFormTitle no-spacing">
                    <asp:Label ID="lblJsonTitle" runat="server" Text="Create Image Lists" />
                </asp:Panel>
                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add no-txt"
                    data-toggle="tooltip" ToolTip="Add New Image" />
                <asp:HyperLink ID="lnkLists" runat="server" CssClass="btn btn-primary link-list no-txt"
                    data-toggle="tooltip" ToolTip="View Image Lists" />
                <asp:LinkButton ID="btnShowAddNewList" runat="server" CssClass="btn btn-primary link-exch no-txt" 
                    data-toggle="tooltip" ToolTip="Edit Available Lists"
                    OnClick="btnShowAddNewList_Click" />
            </div>
        </div>

        <fieldset>
            <div class="dnnFormItem group">
                <dnn:label ID="lblFileName" runat="server" />
                <asp:TextBox ID="txtFileName" runat="server" CssClass="form-control grouped" />

                <dnn:label ID="lblSelectList" runat="server" Visible="false" />
                <asp:DropDownList ID="lstSelectList" runat="server" CssClass="selectpicker show-tick single-select" AutoPostBack="True" 
                    OnSelectedIndexChanged="lstSelectList_SelectedIndexChanged" Visible="false" />

                <asp:LinkButton ID="btnDeleteList" runat="server" CssClass="btn btn-danger link-delete no-txt" 
                    data-toggle="tooltip" ToolTip="Delete Selected List"
                    OnClick="btnDeleteList_Click" Visible="false" />

                <asp:LinkButton ID="btnAddUpdateList" runat="server" CssClass="btn btn-primary link-add" 
                    Text="Create" data-toggle="tooltip" ToolTip="Create New List" 
                    OnClick="btnAddUpdateList_Click" />                
            </div>

            <asp:Panel ID="pnlPopUp" runat="server" Visible="false" >
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
            
            <div class="dnnFormItem">
                <h3>
                    <asp:Label ID="lblTableTitle" runat="server" ResourceKey="lblTableTitle" />
                </h3>
                <table id="table-list" class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <asp:CheckBox ID="cbSelectAll" runat="server" CssClass="cbSelectAll"
                                    AutoPostBack="false" OnCheckedChanged="cbSelectAll_CheckedChanged" />
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
                                <asp:Label runat="server" CssClass="custom-fx" ResourceKey="thTransition" />
                            </th>
                            <th>
                                <asp:Label runat="server" CssClass="custom-fx" ResourceKey="thAnimation" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thModify" />
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptImageList" runat="server" >
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:TableRow ID="tableRow" runat="server">
                                    <asp:TableCell>
                                        <asp:Label ID="imgId" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem, "ImageId").ToString() %>' />
                                        <asp:CheckBox ID="cbSelect" runat="server" CssClass="cbSelect" AutoPostBack="false"
                                            Checked='<%#((DataBinder.Eval(Container.DataItem,"IsSelected")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"IsSelected")==true)) %>'
                                            OnCheckedChanged="cbSelect_CheckedChanged" />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Image ID="imgPreview" runat="server" CssClass="row-img"
                                            ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtTitle" runat="server" CssClass="ellipsis" Enabled="false"
                                            data-toggle="tooltip" ToolTip="Edit Title"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImageTitle").ToString() %>' />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="ellipsis" Enabled="false"
                                            data-toggle="tooltip" ToolTip="Edit Description"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImageDescription").ToString() %>' />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtPhotographer" runat="server" CssClass="ellipsis" Enabled="false"
                                            data-toggle="tooltip" ToolTip="Edit Photographer"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImagePhotographer").ToString() %>' />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtContact" runat="server" CssClass="ellipsis" Enabled="false"
                                            data-toggle="tooltip" ToolTip="Edit Contact"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImageContact").ToString() %>' />
                                    </asp:TableCell>
                                    <asp:TableCell CssClass="custom-fx">
                                        <asp:DropDownList ID="ddTransition" runat="server" CssClass="selectpicker show-tick table-select" Enabled="false" >
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
                                        </asp:DropDownList>
                                    </asp:TableCell>                                    
                                    <asp:TableCell CssClass="custom-fx">
                                        <asp:DropDownList ID="ddAnimation" runat="server" CssClass="selectpicker show-tick table-select" Enabled="false" >
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
                    <%--<tfoot>
                    <tr>
                        <th>
                            <dnn:PagingControl ID="pagingControl" runat="server"></dnn:PagingControl>
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
                            <asp:Label runat="server" ResourceKey="thTransition" />
                        </th>
                        <th>
                            <asp:Label runat="server" ResourceKey="thAnimation" />
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
                OnClick="btnSubmit_Click" Text="Create And Save" ToolTip="Create And Save" />
            <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-default link-cancel"
                OnClick="btnCancel_Click" ResourceKey="btnCancel" />
        </div>
    </div>
</div>

<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="19" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="20" />
<dnn:DnnJsInclude ID="ellipsisJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Ellipsis/jquery.ellipsis.min.js" Priority="21" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/main.min.js" Priority="22" />
